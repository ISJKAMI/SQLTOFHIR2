Class SQLTOFHIR.PROD.SQLOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method GetSQLRecord(pRequest As SQLTOFHIR.PROD.MSG.GetFHIRResourceRequest, Output pResponse As Ens.Response) As %Status
{
	set tSC=$$$OK
	
	if pRequest.Type="getPatient" {
		set tSC=..getPatient(pRequest.Pid,.pResponse)	
	}
	elseif pRequest.Type="medicationdispense" {
		//medicationdispenseは中間メッセージを作成せずダイレクトにFHIRリソースへ格納する方法を試してみる
		set tSC=..getMedicationDispense(pRequest.Pid,.pResponse)
	
	}
	elseif pRequest.Type="bloodpressure" {
		set pResponse=##class(SQLTOFHIR.PROD.MSG.ObservationInfoBundle).%New()
		set tSC=..getPatient(pRequest.Pid,.patient)	


		//patient取得の結果がヒットなし/エラーの場合はその応答を返す
		if patient.%ClassName()="OperationOutcome" {
			set pResponse=patient
		}
		else {
			set pResponse.Patient=patient
			
			set tSC=..getBPObservation(pRequest.Pid,.observationlist,pRequest.Type)
			set pResponse.ObservationInfoList=observationlist
		}
	}
	//pulserateなど一般的なObservation
	else  {
		set pResponse=##class(SQLTOFHIR.PROD.MSG.ObservationInfoBundle).%New()
		set tSC=..getPatient(pRequest.Pid,.patient)	
		
		//patient取得の結果がヒットなし/エラーの場合はその応答を返す
		if patient.%ClassName()="OperationOutcome" {
			set pResponse=patient
		}
		else {
			set pResponse.Patient=patient
			
			set tSC=..getGeneralObservation(pRequest.Pid,.observationlist,pRequest.Type)
			set pResponse.ObservationInfoList=observationlist
		}		
	}

	Quit tSC
}

Method getPatient(pPid As %String, Output pResponse As SQLTOFHIR.PROD.MSG.PatientInfo) As %Status
{
	set tSC=$$$OK
	
	set sql="SELECT ID, PID, GivenName, FamilyName, GivenNameKana, FamilyNameKana, PostalCode, Address, DateOfBirth, Gender, Phone FROM SQLTOFHIR_SQL.Patient WHERE PID = ?"
 	
 	set tSC=..Adapter.ExecuteQuery(.tRS,sql,pPid)
 	
 	if $$$ISOK(tSC) {
	 	set getdata=tRS.Next()
	 	if getdata {
		 	set pResponse=##class(SQLTOFHIR.PROD.MSG.PatientInfo).%New()
		 	set pResponse.PID=tRS.Get("PID")
		 	set pResponse.GivenName=tRS.Get("GivenName")
		 	set pResponse.FamilyName=tRS.Get("FamilyName")
		 	set pResponse.GivenNameKana=tRS.Get("GivenNameKana")
		 	set pResponse.FamilyNameKana=tRS.Get("FamilyNameKana")
		 	set pResponse.PostalCode=tRS.Get("PostalCode")
		 	set pResponse.Address=tRS.Get("Address")
		 	set pResponse.DateOfBirth=$ZDH(tRS.Get("DateOfBirth"),8)
		 	set pResponse.Gender=tRS.Get("Gender")
		 	set pResponse.Phone=tRS.Get("Phone")
	 	}
	 	//hitしなかった場合
	 	else {
		 	set pResponse=##class(SQLTOFHIR.PROD.MSG.OperationOutcome).%New()
		 	set pResponse.severity="error"
		 	set pResponse.code="not-found"
		 	set pResponse.detailsText="リソースが見つかりませんでした。: Patient ID="_pPid
			set pResponse.diagnostics=pResponse.detailsText 	
		 	
	 	}	
 	}
 	else {
		 	set pResponse=##class(SQLTOFHIR.PROD.MSG.OperationOutcome).%New()
		 	set pResponse.severity="error"
		 	set pResponse.code="not-found"
		 	set pResponse.detailsText="患者情報を取得できませんでした。: Patient ID="_pPid
			set pResponse.diagnostics=pResponse.detailsText 	 	
 	}
 	
	Quit tSC
}

/// 検査結果を取得する
Method getGeneralObservation(pPid As %String, Output observationlist As %ListOfObjects, pType As %String) As %Status
{
	set tSC=$$$OK
	
	//応答のリストオブジェクトを生成
	set observationlist=##class(%ListOfObjects).%New()
	
	//valueSetのCode指定
	Set Param("valSystem")="http://www.intersystems.com/fhir/system"
	//statusの指定
	Set Param("status")="final"
	
	
	//脈拍の場合
	if pType="pulserate" {
		//外部DBから脈拍の検査値と時刻を取得するSQL
		set sql="select ID,PRValue as TestValue,MeasurementDate as DateTimeValue from SQLTOFHIR_SQL.PulseRate where PID = ?"
 	}
 	elseif pType="bodytemperature" {
	 	//外部DBから体温の検査値と時刻を取得するSQL
	 	set sql="select ID,BTValue as TestValue,MeasurementDate As DateTimeValue from SQLTOFHIR_SQL.BodyTemperature where PID=?"
 	}
 	
 	set tSC=..Adapter.ExecuteQuery(.tRS,sql,pPid)
 	
 	//　ヒットしたレコード件数分Observationを作成する
	While(tRS.Next()) {
	 	set oinfo=##class(SQLTOFHIR.PROD.MSG.ObservationInfoS).%New()
	 	//PatientID
	 	set oinfo.PID=pPid
	 	//ObservationType
	 	set oinfo.ObservationType=pType
	 	//Value
        set oinfo.ValueQuantity=##class(SQLTOFHIR.PROD.MSG.ObservationValueSet).getValueSet(tRS.Get("TestValue"))
        //EffectiveDatetime
        set oinfo.EffectiveDateTime=tRS.Get("DateTimeValue")
        set tSC=observationlist.Insert(oinfo)
 	}

	Quit tSC
}

// 血圧は血圧用のProfileで定義されたObservation構造になるため、別メソッドで実装

Method getBPObservation(pPid As %String, Output observationlist As %ListOfObjects, pType As %String) As %Status
{
	set tSC=$$$OK
	
	//応答のリストオブジェクトを生成
	set observationlist=##class(%ListOfObjects).%New()
	
	//外部DBから血圧の検査値と時刻を取得するSQL
	//Arm:右/左 Result:H/N/L
	set sql="SELECT ID, BPSysValue As BPSysValue,BPDiaValue As BPDiaValue,MeasurementDate As DateTimeValue,Arm as Arm,Result As Result FROM SQLTOFHIR_SQL.BloodPressure WHERE PID = ?"
	


	//FHIRに格納するデフォルトパラメータをセットする。検査ごとに変更が必要な場合は、if文内で上書きする
	//categoryのCode指定
	Set Param("cateSystem")="http://terminology.hl7.org/CodeSystem/observation-category"
	Set Param("cateCode")="vital-signs"
	Set Param("cateDisplay")="Vital Signs"
	
	//nameのCode指定
	Set Param("nameSystem")="http://loinc.org"
	Set Param("nameCode")="85354-9"
	Set Param("nameText")="Blood pressure systolic & diastolic"

	//statusの指定
	Set Param("status")="final"
	
 	
 	set tSC=..Adapter.ExecuteQuery(.tRS,sql,pPid)
 	

	While(tRS.Next()) {
	
	 	set oinfo=##class(SQLTOFHIR.PROD.ObservationInfoC).%New()
	 	set oinfo.PID=pPid
	 	//category coding
	 	set oinfo.ObservationCategory=##class(SQLTOFHIR.PROD.MSG.CodeableConcept).getCodeableConcept(Param("cateSystem"),Param("cateCode"),Param("cateDisplay"),"")
	 	//name coding
	 	set oinfo.ObservationName=##class(SQLTOFHIR.PROD.MSG.CodeableConcept).getCodeableConcept(Param("nameSystem"),Param("nameCode"),"",Param("nameText"))
	 	
	 	//bodySite
	 	set Param("bodySystem")="http://snomed.info/sct"
	 	//left:368208006/Left arm right:368209003/Right arm
	 	if tRS.Get("Arm")="左" {
		 	set Param("bodyCode")="368208006"
		 	set Param("bodyText")="Left arm"
	 	}
	 	elseif tRS.Get("Arm")="右" {
		 	set Param("bodyCode")="368209003"
		 	set Param("bodyText")="Right arm"
	 	}
	 	set oinfo.bodySite=##class(SQLTOFHIR.PROD.MSG.CodeableConcept).getCodeableConcept(Param("bodySystem"),Param("bodyCode"),"",Param("bodyText"))
	 	
	 	//Interpretation
	 	set Param("ipSystem")="http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
	 	//L:Below low normal H:Above high normal N:Normal
	 	if tRS.Get("Result")="L" {
		 	set Param("ipCode")="L"
		 	set Param("ipDisplay")="low"
		 	set Param("ipText")="Below low normal"
	 	}
	 	elseif tRS.Get("Result")="H" {
		 	set Param("ipCode")="H"
		 	set Param("ipDisplay")="high"
		 	set Param("ipText")="Above High normal"
	 	}
	 	elseif tRS.Get("Result")="N" {
		 	set Param("ipCode")="N"
		 	set Param("ipDisplay")="normal"
		 	set Param("ipText")="Normal"
	 	}
	 	set oinfo.Interpretation=##class(SQLTOFHIR.PROD.MSG.CodeableConcept).getCodeableConcept(Param("ipSystem"),Param("ipCode"),Param("ipDisplay"),Param("ipText"))
	 	
	 	
	 	//Systolic Blood pressure
	 	set syscp=##Class(SQLTOFHIR.PROD.ObservationComponent).%New()
	 	//valueset
        set syscp.ValueQuantity=##class(SQLTOFHIR.PROD.MSG.ObservationValueSet).getValueSet(tRS.Get("BPSysValue"),"mmHg","http://unitsofmeasure.org","mm[Hg]")        
        //codeableConcept
	 	set syscp.Code=##class(SQLTOFHIR.PROD.MSG.CodeableConcept).getCodeableConcept("http://loinc.org","8480-6","Systolic blood pressure","")                
        set sts=oinfo.ComponentList.Insert(syscp)
        

	 	//Diastolic Blood pressure
	 	set diacp=##Class(SQLTOFHIR.PROD.ObservationComponent).%New()
	 	//valueset
        set diacp.ValueQuantity=##class(SQLTOFHIR.PROD.MSG.ObservationValueSet).getValueSet(tRS.Get("BPDiaValue"),"mmHg","http://unitsofmeasure.org","mm[Hg]")        
        //codeableConcept
	 	set diacp.Code=##class(SQLTOFHIR.PROD.MSG.CodeableConcept).getCodeableConcept("http://loinc.org","8462-4","Diastolic blood pressure","")                	 	
        set sts=oinfo.ComponentList.Insert(diacp)
        
                
        set oinfo.Status=Param("status")
        set oinfo.EffectiveDateTime=tRS.Get("DateTimeValue")
        set tSC=observationlist.Insert(oinfo)
	 	
 	}
	 	

	Quit tSC
}

Method getMedicationDispense(pPid As %String, Output pResponse As SQLTOFHIR.PROD.MSG.PatientResource) As %Status
{
	#dim fhirBundle as HS.FHIR.DTL.vSTU3.Model.Resource.Bundle
	#dim mdReference as HS.FHIR.DTL.vSTU3.Model.Resource.MedicationDispense
	
	set tSC=$$$OK
	set pResponse=##class(SQLTOFHIR.PROD.MSG.PatientResource).%New()
	
	//Patient+MedicationDispensexNを格納する
	set fhirBundle=##class(HS.FHIR.DTL.vSTU3.Model.Resource.Bundle).%New()

	//まずは患者情報を取得しBundleに入れる（他のリソース取得ではBPのDTLでやっていた内容まで含む
	set tSC=..getPatient(pPid,.patient)	
	
	//patientがhitなし、エラーの場合
	if patient.%ClassName()="OperationOutcome" {
		
		set tSC=##class(SQLTOFHIR.DTL.OperationOutcome).Transform(patient,.fhirOutcome)
		set pResponse.Payload=fhirOutcome.ToJSON()
		Quit $$$OK
	}
	
	
	set tSC=##class(SQLTOFHIR.DTL.Patient).Transform(patient,.patientFHIRResource)
	set entry=##class(HS.FHIR.DTL.vSTU3.Model.Element.Bundle.entry).%New()
	set entry.resource=patientFHIRResource
	set tSC=fhirBundle.entry.Insert(entry)
	
	
	set sql="SELECT ID, PID, 薬剤名, 薬剤コード, 処方日, 処方1回量, 処方1回量単位, 処方1日回数, 日数, 用法, 全体量, 全体量単位 FROM SQLTOFHIR_SQL.Prescription WHERE PID = ?"
 	
 	set tSC=..Adapter.ExecuteQuery(.tRS,sql,pPid)
 	
 	set medid=0
 	While(tRS.Next()){
 		
 		set mdResource=##class(HS.FHIR.DTL.vSTU3.Model.Resource.MedicationDispense).%New()
 		
 		//containedにMedicationを格納
 		set mResource=##Class(HS.FHIR.DTL.vSTU3.Model.Resource.Medication).%New()
 		set thismedid="med"_$I(medid)
 		set mResource.id=thismedid //内部参照用
 		set coding=##class(HS.FHIR.DTL.vSTU3.Model.Datatype.Coding).%New()
 		set coding.system="http://myhospital/thisisOurHospitalCodeURL"
 		set coding.code=tRS.Get("薬剤コード")
 		set coding.display=tRS.Get("薬剤名")
 		set code=##class(HS.FHIR.DTL.vSTU3.Model.Datatype.CodeableConcept).%New()
 		set tSC=code.coding.Insert(coding)
 		set mResource.code=code
 		
 		set tSC=mdResource.contained.Insert(mResource)
 		
 		//status="completed"
 		set mdResource.status="completed"
 		
 		//medicalReference
 		set ref=##class(HS.FHIR.DTL.vSTU3.Model.Base.Reference).%New()
 		set ref.display=tRS.Get("薬剤名")
 		set ref.reference="#"_thismedid
 		set mdResource.medicationReference=ref
 		
 		set sub=##class(HS.FHIR.DTL.vSTU3.Model.Base.Reference).%New()
 		set sub.display=patient.FamilyName_" "_patient.GivenName
 		set sub.reference="Patient/"_pPid
 		set mdResource.subject=sub
 		
 		//quantity
 		set sq=##class(HS.FHIR.DTL.vSTU3.Model.Datatype.SimpleQuantity).%New()
 		set sq.value=tRS.Get("全体量")
 		set sq.system="http://myhospital/terminology/CodeSystems/orderableDrugForm"
 		set sq.code=tRS.Get("全体量単位")
 		set mdResource.quantity=sq
 		
 		//daysSupply(日数固定：実際は月とかある？）
 		set ds=##class(HS.FHIR.DTL.vSTU3.Model.Datatype.SimpleQuantity).%New()
 		set ds.value=tRS.Get("日数")
 		set ds.unit="Day"
 		set ds.system="http://unitfomeasure.org"
 		set ds.code="d"
 		set mdResource.daysSupply=ds
 		
 		//whenHandedOver
 		set mdResource.whenHandedOver=tRS.Get("処方日")

 		//実際は同時に処方された薬剤のdosageをまとめられるならばまとめるべき

 		//dosageInstruction
 		set dosage=##class(HS.FHIR.DTL.vSTU3.Model.Element.Dosage).%New()
 		set dosage.sequence=1
 		set dosage.text=tRS.Get("用法")
 		set dosage.timing=..getTiming(tRS.Get("用法"))
 		//route
 		set rcoding=##class(HS.FHIR.DTL.vSTU3.Model.Datatype.Coding).%New()
 		set rcoding.system="http://snomed.info/sct"
 		set rcoding.code=26643006
 		set rcoding.display="Oral Route"
 		set rcode=##class(HS.FHIR.DTL.vSTU3.Model.Datatype.CodeableConcept).%New()
 		set tSC=rcode.coding.Insert(rcoding)
 		set dosage.route=rcode

 		//doseQuantity
 		set dq=##class(HS.FHIR.DTL.vSTU3.Model.Datatype.SimpleQuantity).%New()
 		set dq.value=tRS.Get("処方1回量")
 		set dq.unit=tRS.Get("処方1回量単位")
 		set dq.code=tRS.Get("処方1回量単位")
 		set dq.system="http://myhospital/terminology/CodeSystems/orderableDrugForm"
 		
 		set dosage.doseQuantity=dq

 		set tSC=mdResource.dosageInstruction.Insert(dosage)


 		//mdResourceをBundleに追加
 		set entry=##class(HS.FHIR.DTL.vSTU3.Model.Element.Bundle.entry).%New()
		set entry.resource=mdResource
		set tSC=fhirBundle.entry.Insert(entry)	
	 	}

	//set pResponse=##class(SQLTOFHIR.PROD.MSG.PatientResource).%New()
 	set pResponse.Payload=fhirBundle.ToJSON()

	Quit tSC
}

Method getTiming(youhou As %String) As HS.FHIR.DTL.vSTU3.Model.Datatype.Timing
{
	//とりあえず　朝食後、昼食後、夕食後、朝夕食後、朝昼夕食後　だけつくってみる
	set timing=##class(HS.FHIR.DTL.vSTU3.Model.Datatype.Timing).%New()
	set repeat=##class(HS.FHIR.DTL.vSTU3.Model.Element.Timing.repeat).%New()
	
	set repeat.frequency=1
	set repeat.period=1
	set repeat.periodUnit="d"
	set repeat.offset=30
	
	if ((youhou="朝食後")!(youhou="昼食後")!(youhou="夕食後")) {
		set tSC=repeat.when.Insert($Case(youhou,"朝食後":"MPC","昼食後":"DPC","夕食後":"VPC",:""))
	}
	elseif youhou="朝昼夕食後" {
		set tSC=repeat.when.Insert("PC")
		set repeat.frequency=3
	}
	elseif youhou="朝夕食後" {
		set tSC=repeat.when.Insert("MPC")
		set tSC=repeat.when.Insert("VPC")
		set repeat.frequency=2	
	}
	set timing.repeat=repeat
	
	quit timing
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="SQLTOFHIR.PROD.MSG.GetFHIRResourceRequest"> 
		<Method>GetSQLRecord</Method>
	</MapItem>
	<!--
	<MapItem MessageType="Ens.StringRequest"> 
		<Method>GetPatient</Method>
	</MapItem>
	-->
</MapItems>
}

}

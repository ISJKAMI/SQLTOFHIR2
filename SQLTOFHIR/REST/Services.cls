/// RESTのリクエストを受けて、次の処理を呼び出す
Class SQLTOFHIR.REST.Services Extends (%CSP.REST, EnsLib.REST.GenericService)
{

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/fhir/patient/:pid" Method="GET" Call="getPatient"/>
<Route Url="/fhir/observation/pulserate/:pid" Method="GET" Call="getPulseRate"/>
<Route Url="/fhir/observation/bodytemperature/:pid" Method="GET" Call="getBodyTemperature"/>
<Route Url="/fhir/medicationdispense/:pid" Method="GET" Call="getMedicationDispense"/>
</Routes>
}

ClassMethod getPatient(pPid As %String) As %Status
{
	//test
#;	set %response.ContentType="application/json; charset=UTF-8"
#;	set jsontestdata="{""resourceType"":""Patient"",""address"":[{""country"":""JPN"",""line"":[""静岡県静岡市駿河区登呂; 1-3-5 ""],""postalCode"":""422-8033""}],""birthDate"":""1948-04-05"",""contact"":[{""address"":{""country"":""JPN"",""postalCode"":""422-8033""},""extension"":[{""url"":""http://intersystems.com/fhir/extn/sda3/lib/support-contact-relationship"",""valueCodeableConcept"":{""coding"":[{""code"":""SEL"",""display"":""本人"",""extension"":[{""url"":""http://intersystems.com/fhir/extn/sda3/lib/code-table-translated-s-d-a-coding-standard"",""valueString"":""HL70063""}]}]}}],""name"":{""family"":""山田"",""given"":[""太郎""],""text"":""太郎 山田""},""relationship"":[{}],""telecom"":[{""system"":""phone"",""use"":""home"",""value"":""054-000-0000""},{""system"":""phone"",""use"":""work"",""value"":""03-3599-9993""}]},{""organization"":{""reference"":""Organization/2""},""relationship"":[{}]}],""extension"":[{""url"":""http://intersystems.com/fhir/extn/sda3/lib/patient-entered-on"",""valueDateTime"":""2011-12-19T12:15:51+09:00""}],""gender"":""male"",""id"":""1"",""identifier"":[{""assigner"":{""reference"":""Organization/1""},""type"":{""coding"":[{""code"":""MR"",""system"":""http://hl7.org/fhir/v2/0203""}],""text"":""MRN""},""value"":""00000001""}],""managingOrganization"":{""reference"":""Organization/1""},""name"":[{""family"":""ヤマダ"",""given"":[""タロウ""],""text"":""タロウ ヤマダ""},{""family"":""山田"",""given"":[""太郎""],""text"":""太郎 山田"",""use"":""official""}],""telecom"":[{""system"":""phone"",""use"":""home"",""value"":""054-000-0000""},{""system"":""phone"",""use"":""work"",""value"":""03-3599-9993""}],""meta"":{""versionId"":""1"",""lastUpdated"":""2019-04-25T08:49:26Z""}}"
#;	write $ZCVT(jsontestdata,"O","UTF8")

	set tSC=$$$OK
	set request=##class(SQLTOFHIR.PROD.MSG.GetFHIRResourceRequest).%New()
	set request.Pid=pPid
	set request.Type="getPatient"

	
	// Instantiate Business Service and send request
	set tSC=##class(Ens.Director).CreateBusinessService("SQLTOFHIR.REST.Services",.tBS)
	if $$$ISOK(tSC) set tSC=tBS.SendRequestSync(tBS.TargetConfigName,request,.response)

	if $$$ISOK(tSC),$ISOBJECT(response) {
		Quit ..outputFHIR(response)
	}
	else {
		Quit tSC
	}
}

// 脈拍データのObservationリソースを取得する

ClassMethod getPulseRate(pPid As %String) As %Status
{
	set pType="pulserate"
	set tSC=##class(SQLTOFHIR.REST.Services).getObservation(pType,pPid)
	
	quit tSC
}

// 体温データのObservationリソースを取得する

ClassMethod getBodyTemperature(pPid As %String) As %Status
{
	set pType="bodytemperature"
	set tSC=##class(SQLTOFHIR.REST.Services).getObservation(pType,pPid)
	
	quit tSC
}

ClassMethod getObservation(pType As %String, pPid As %String) As %Status
{

	set tSC=$$$OK
	set request=##class(SQLTOFHIR.PROD.MSG.GetFHIRResourceRequest).%New()
	set request.Pid=pPid
	set request.Type=pType

	
	// Instantiate Business Service and send request
	set tSC=##class(Ens.Director).CreateBusinessService("SQLTOFHIR.REST.Services",.tBS)
	if $$$ISOK(tSC) set tSC=tBS.SendRequestSync(tBS.TargetConfigName,request,.response)

	if $$$ISOK(tSC),$ISOBJECT(response) {
		Quit ..outputFHIR(response)
	}
	else {
		Quit tSC
	}
}

ClassMethod getMedicationDispense(pPid As %String) As %Status
{

	set tSC=$$$OK
	set request=##class(SQLTOFHIR.PROD.MSG.GetFHIRResourceRequest).%New()
	set request.Pid=pPid
	set request.Type="medicationdispense"

	
	// Instantiate Business Service and send request
	set tSC=##class(Ens.Director).CreateBusinessService("SQLTOFHIR.REST.Services",.tBS)
	if $$$ISOK(tSC) set tSC=tBS.SendRequestSync("SQLTOFHIR.PROD.SQLOperation",request,.response)

	if $$$ISOK(tSC),$ISOBJECT(response) {
		Quit ..outputFHIR(response)
	}
	else {
		Quit tSC
	}
}

ClassMethod outputFHIR(response As %RegisteredObject)
{
	
	set %response.ContentType="application/json; charset=UTF-8"
	While 'response.Payload.AtEnd {
	     WRITE $ZCONVERT(response.Payload.Read(20000),"O","UTF8",handle)
	}

	Quit $$$OK
}

}

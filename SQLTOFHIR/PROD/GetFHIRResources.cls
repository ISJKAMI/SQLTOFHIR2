/// 
Class SQLTOFHIR.PROD.GetFHIRResources Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='SQLTOFHIR.PROD.MSG.GetFHIRResourceRequest' response='SQLTOFHIR.PROD.MSG.PatientResource' height='2000' width='2000' >
<context>
<property name='PatientInfo' type='Ens.Response' instantiate='0' />
<property name='FHIRResource' type='HS.FHIR.DTL.vSTU3.Model.Base.DomainResource' instantiate='0' />
</context>
<sequence xend='200' yend='900' >
<call name='Get SQL Data' target='SQLTOFHIR.PROD.SQLOperation' async='1' xpos='200' ypos='250' >
<request type='SQLTOFHIR.PROD.MSG.GetFHIRResourceRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='SQLTOFHIR.PROD.MSG.PatientInfo' >
<assign property="context.PatientInfo" value="callresponse" action="set" />
</response>
</call>
<sync name='sync call' calls='Get SQL Data' type='all' xpos='200' ypos='350' />
<switch name='CheckType' xpos='200' ypos='450' xend='200' yend='700' >
<case condition='context.PatientInfo.%ClassName()="OperationOutcome"' name='OperationOutcome' >
<transform name='Convert to FHIR' class='SQLTOFHIR.DTL.OperationOutcome' source='context.PatientInfo' target='context.FHIRResource' xpos='200' ypos='600' />
</case>

<case condition='request.Type="getPatient"' name='patient' >
<transform name='Convert to FHIR' class='SQLTOFHIR.DTL.Patient' source='context.PatientInfo' target='context.FHIRResource' xpos='200' ypos='600' />
</case>
<default>
<transform name='Convert to FHIR' class='SQLTOFHIR.DTL.ObservationBundle' source='context.PatientInfo' target='context.FHIRResource' xpos='470' ypos='600' />
</default>
</switch>
<assign name="Get FHIR stream" property="response.Payload" value="context.FHIRResource.ToJSON()" action="set" xpos='200' ypos='800' />
</sequence>
</process>
}

}

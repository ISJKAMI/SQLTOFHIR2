Class SQLTOFHIR.DTL.OperationOutcome Extends Ens.DataTransformDTL [ DependsOn = (SQLTOFHIR.PROD.MSG.OperationOutcome, HS.FHIR.DTL.vSTU3.Model.Resource.OperationOutcome) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='SQLTOFHIR.PROD.MSG.OperationOutcome' targetClass='HS.FHIR.DTL.vSTU3.Model.Resource.OperationOutcome' create='new' language='objectscript' >
<assign value='source.severity' property='target.issue.(1).severity' action='set' />
<assign value='source.code' property='target.issue.(1).code' action='set' />
<assign value='source.detailsText' property='target.issue.(1).details.text' action='set' />
<assign value='source.diagnostics' property='target.issue.(1).diagnostics' action='set' />
</transform>
}

}

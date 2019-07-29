Class SQLTOFHIR.DTL.PulseRate Extends Ens.DataTransformDTL [ DependsOn = (SQLTOFHIR.PROD.MSG.ObservationInfoS, HS.FHIR.DTL.vSTU3.Model.Resource.Observation) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='SQLTOFHIR.PROD.MSG.ObservationInfoS' targetClass='HS.FHIR.DTL.vSTU3.Model.Resource.Observation' create='new' language='objectscript' >
<assign value='"Patient/"_source.PID' property='target.subject.reference' action='set' />
<assign value='"8867-4"' property='target.code.coding.(1).code' action='set' />
<assign value='"脈拍"' property='target.code.text' action='set' />
<assign value='source.EffectiveDateTime' property='target.effectiveDateTime' action='set' />
<assign value='"bpm"' property='target.valueQuantity.unit' action='set' />
<assign value='source.ValueQuantity.Value' property='target.valueQuantity.value' action='set' />
</transform>
}

}

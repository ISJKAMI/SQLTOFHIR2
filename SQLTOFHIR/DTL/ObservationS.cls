Class SQLTOFHIR.DTL.ObservationS Extends Ens.DataTransformDTL [ DependsOn = (SQLTOFHIR.PROD.MSG.ObservationInfoS, HS.FHIR.DTL.vSTU3.Model.Resource.Observation) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='SQLTOFHIR.PROD.MSG.ObservationInfoS' targetClass='HS.FHIR.DTL.vSTU3.Model.Resource.Observation' create='new' language='objectscript' >
<assign value='source.Status' property='target.status' action='set' />
<assign value='source.ObservationCategory.Coding.System' property='target.category.(1).coding.(1).system' action='set' />
<assign value='source.ObservationCategory.Coding.Code' property='target.category.(1).coding.(1).code' action='set' />
<assign value='source.ObservationCategory.Coding.Display' property='target.category.(1).coding.(1).display' action='set' />
<assign value='source.ObservationCategory.Text' property='target.category.(1).text' action='set' />
<assign value='source.ObservationName.Coding.System' property='target.code.coding.(1).system' action='set' />
<assign value='source.ObservationName.Coding.Code' property='target.code.coding.(1).code' action='set' />
<assign value='source.ObservationName.Coding.Display' property='target.code.coding.(1).display' action='set' />
<assign value='source.ObservationName.Text' property='target.code.text' action='set' />
<assign value='"Patient/"_source.PID' property='target.subject.reference' action='set' />
<assign value='source.ValueQuantity.Value' property='target.valueQuantity.value' action='set' />
<assign value='source.ValueQuantity.Unit' property='target.valueQuantity.unit' action='set' />
<assign value='source.ValueQuantity.System' property='target.valueQuantity.system' action='set' />
<assign value='source.ValueQuantity.Code' property='target.valueQuantity.code' action='set' />
<assign value='source.EffectiveDateTime' property='target.effectiveDateTime' action='set' />
</transform>
}

}

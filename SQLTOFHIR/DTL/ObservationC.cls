Class SQLTOFHIR.DTL.ObservationC Extends Ens.DataTransformDTL [ DependsOn = (SQLTOFHIR.PROD.MSG.ObservationInfoC, HS.FHIR.DTL.vSTU3.Model.Resource.Observation) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='SQLTOFHIR.PROD.MSG.ObservationInfoC' targetClass='HS.FHIR.DTL.vSTU3.Model.Resource.Observation' create='new' language='objectscript' >
<assign value='"Patient/"_source.PID' property='target.subject.reference' action='set' />
<assign value='source.ObservationCategory.Coding.System' property='target.category.(1).coding.(1).system' action='set' />
<assign value='source.ObservationCategory.Coding.Code' property='target.category.(1).coding.(1).code' action='set' />
<assign value='source.ObservationCategory.Coding.Display' property='target.category.(1).coding.(1).display' action='set' />
<assign value='source.ObservationCategory.Text' property='target.category.(1).text' action='set' />
<assign value='source.ObservationName.Coding.System' property='target.code.coding.(1).system' action='set' />
<assign value='source.ObservationName.Coding.Code' property='target.code.coding.(1).code' action='set' />
<assign value='source.ObservationName.Coding.Display' property='target.code.coding.(1).display' action='set' />
<assign value='source.ObservationName.Text' property='target.code.text' action='set' />
<assign value='source.Interpretation.Coding.System' property='target.interpretation.coding.(1).system' action='set' />
<assign value='source.Interpretation.Coding.Code' property='target.interpretation.coding.(1).code' action='set' />
<assign value='source.Interpretation.Coding.Display' property='target.interpretation.coding.(1).display' action='set' />
<assign value='source.Interpretation.Text' property='target.interpretation.text' action='set' />
<assign value='source.bodySite.Coding.System' property='target.bodySite.coding.(1).system' action='set' />
<assign value='source.bodySite.Coding.Code' property='target.bodySite.coding.(1).code' action='set' />
<assign value='source.bodySite.Coding.Display' property='target.bodySite.coding.(1).display' action='set' />
<assign value='source.Status' property='target.status' action='set' />
<assign value='source.EffectiveDateTime' property='target.effectiveDateTime' action='set' />
<foreach property='source.ComponentList()' key='k1' >
<assign value='source.ComponentList.(k1).Code.Coding.System' property='target.component.(k1).code.coding.(1).system' action='set' />
<assign value='source.ComponentList.(k1).Code.Coding.Code' property='target.component.(k1).code.coding.(1).code' action='set' />
<assign value='source.ComponentList.(k1).Code.Coding.Display' property='target.component.(k1).code.coding.(1).display' action='set' />
<assign value='source.ComponentList.(k1).Code.Text' property='target.component.(k1).code.text' action='set' />
<assign value='source.ComponentList.(k1).ValueQuantity.Value' property='target.component.(k1).valueQuantity.value' action='set' />
<assign value='source.ComponentList.(k1).ValueQuantity.Unit' property='target.component.(k1).valueQuantity.unit' action='set' />
<assign value='source.ComponentList.(k1).ValueQuantity.System' property='target.component.(k1).valueQuantity.system' action='set' />
<assign value='source.ComponentList.(k1).ValueQuantity.Code' property='target.component.(k1).valueQuantity.code' action='set' />
</foreach>
</transform>
}

}

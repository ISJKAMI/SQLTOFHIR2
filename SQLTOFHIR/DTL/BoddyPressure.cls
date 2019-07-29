Class SQLTOFHIR.DTL.BoddyPressure Extends Ens.DataTransformDTL [ DependsOn = (SQLTOFHIR.PROD.MSG.ObservationInfoC, HS.FHIR.DTL.vSTU3.Model.Resource.Observation) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='SQLTOFHIR.PROD.MSG.ObservationInfoC' targetClass='HS.FHIR.DTL.vSTU3.Model.Resource.Observation' create='new' language='objectscript' >
<assign value='"Patient/"_source.PID' property='target.subject.reference' action='set' />
<assign value='source.ObservationName.Coding.Code' property='target.code.coding.(1).code' action='set' />
<assign value='source.ObservationName.Text' property='target.code.text' action='set' />
<assign value='source.bodySite.Coding.Display' property='target.bodySite.coding.(1).display' action='set' />
<assign value='source.EffectiveDateTime' property='target.effectiveDateTime' action='set' />
<foreach property='source.ComponentList()' key='k1' >
<assign value='source.ComponentList.(k1).Code.Coding.Code' property='target.component.(k1).code.coding.(1).code' action='set' />
<assign value='source.ComponentList.(k1).Code.Text' property='target.component.(k1).code.text' action='set' />
<assign value='source.ComponentList.(k1).ValueQuantity.Value' property='target.component.(k1).valueQuantity.value' action='set' />
<assign value='source.ComponentList.(k1).ValueQuantity.Unit' property='target.component.(k1).valueQuantity.unit' action='set' />
</foreach>
</transform>
}

}

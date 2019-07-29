Class SQLTOFHIR.DTL.ObservationBundleG Extends Ens.DataTransformDTL [ DependsOn = (SQLTOFHIR.PROD.MSG.ObservationInfoBundle, HS.FHIR.DTL.vSTU3.Model.Resource.Bundle) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='SQLTOFHIR.PROD.MSG.ObservationInfoBundle' targetClass='HS.FHIR.DTL.vSTU3.Model.Resource.Bundle' create='new' language='objectscript' >
<annotation>Observation汎用DTL</annotation>
<assign value='$get(cnt,0)+1' property='cnt' action='set' />
<subtransform class='SQLTOFHIR.DTL.Patient' targetObj='target.entry.(cnt).resource' sourceObj='source.Patient' />
<foreach property='source.ObservationInfoList()' key='k1' >
<assign value='$get(cnt,0)+1' property='cnt' action='set' />
<if condition='source.ObservationInfoList.(k1).%ClassName(1)="SQLTOFHIR.PROD.MSG.ObservationInfoS"' >
<true>
<subtransform class='SQLTOFHIR.DTL.ObservationS' targetObj='target.entry.(cnt).resource' sourceObj='source.ObservationInfoList.(k1)' />
</true>
<false>
<subtransform class='SQLTOFHIR.DTL.ObservationC' targetObj='target.entry.(cnt).resource' sourceObj='source.ObservationInfoList.(k1)' />
</false>
</if>
</foreach>
</transform>
}

}

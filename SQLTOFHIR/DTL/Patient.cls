Class SQLTOFHIR.DTL.Patient Extends Ens.DataTransformDTL [ DependsOn = (SQLTOFHIR.PROD.MSG.PatientInfo, HS.FHIR.DTL.vSTU3.Model.Resource.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='SQLTOFHIR.PROD.MSG.PatientInfo' targetClass='HS.FHIR.DTL.vSTU3.Model.Resource.Patient' create='new' language='objectscript' >
<assign value='source.PID' property='target.identifier.(1).value' action='set' />
<assign value='##class(HS.FHIR.DTL.vSTU3.Model.Datatype.HumanName).%New()' property='target.name.(1)' action='set' />
<assign value='"official"' property='target.name.(1).use' action='set' />
<assign value='source.FamilyName' property='target.name.(1).family' action='set' />
<assign value='source.GivenName' property='target.name.(1).given.(1)' action='set' />
<assign value='##class(HS.FHIR.DTL.vSTU3.Model.Datatype.HumanName).%New()' property='target.name.(2)' action='set' />
<assign value='"kana"' property='target.name.(2).use' action='set' />
<assign value='source.FamilyNameKana' property='target.name.(2).family' action='set' />
<assign value='source.GivenNameKana' property='target.name.(2).given.(1)' action='set' />
<assign value='source.PostalCode' property='target.address.(1).postalCode' action='set' />
<assign value='source.Address' property='target.address.(1).text' action='set' />
<assign value='$zdate(source.DateOfBirth,3)' property='target.birthDate' action='set' />
<assign value='source.Gender' property='target.gender' action='set' />
<assign value='source.Phone' property='target.telecom.(1).value' action='set' />
</transform>
}

}

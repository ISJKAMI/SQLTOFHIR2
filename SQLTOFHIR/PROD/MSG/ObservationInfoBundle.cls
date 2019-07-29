Class SQLTOFHIR.PROD.MSG.ObservationInfoBundle Extends Ens.Response
{

Property Patient As SQLTOFHIR.PROD.MSG.PatientInfo;

Property ObservationInfoList As list Of ObservationInfoBase;

Storage Default
{
<Data name="ObservationInfoBundleDefaultData">
<Subscript>"ObservationInfoBundle"</Subscript>
<Value name="1">
<Value>Patient</Value>
</Value>
<Value name="2">
<Value>ObservationInfoList</Value>
</Value>
</Data>
<DefaultData>ObservationInfoBundleDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

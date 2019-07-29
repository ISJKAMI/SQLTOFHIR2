Class SQLTOFHIR.PROD.ObservationInfoBundle Extends Ens.Response
{

Property Patient As SQLTOFHIR.PROD.PatientInfo;

Property ObservationInfoList As list Of ObservationInfoBase;

Storage Default
{
<Data name="ObservationInfoBundleDefaultData">
<Subscript>"ObservationInfoBundle"</Subscript>
<Value name="1">
<Value>PID</Value>
</Value>
<Value name="2">
<Value>ObservationInfoList</Value>
</Value>
<Value name="3">
<Value>Patient</Value>
</Value>
</Data>
<DefaultData>ObservationInfoBundleDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

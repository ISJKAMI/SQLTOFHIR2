Class SQLTOFHIR.PROD.HeartRateInfo Extends Ens.Response
{

Property Patient As SQLTOFHIR.PROD.PatientInfo;

Property HeartRateData As list Of HeartRateBase;

Storage Default
{
<Data name="HeartRateInfoDefaultData">
<Subscript>"HeartRateInfo"</Subscript>
<Value name="1">
<Value>Patient</Value>
</Value>
<Value name="2">
<Value>HeartRateData</Value>
</Value>
</Data>
<DefaultData>HeartRateInfoDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

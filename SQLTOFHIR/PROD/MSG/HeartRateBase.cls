Class SQLTOFHIR.PROD.MSG.HeartRateBase Extends Ens.Response
{

Property HRValue As %Integer;

Property MeasurementDate As %TimeStamp;

Storage Default
{
<Data name="HeartRateBaseDefaultData">
<Subscript>"HeartRateBase"</Subscript>
<Value name="1">
<Value>HRValue</Value>
</Value>
<Value name="2">
<Value>MeasurementDate</Value>
</Value>
</Data>
<DefaultData>HeartRateBaseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

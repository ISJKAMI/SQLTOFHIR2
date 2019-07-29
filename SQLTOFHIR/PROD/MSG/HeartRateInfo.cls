Class SQLTOFHIR.PROD.MSG.HeartRateInfo Extends SQLTOFHIR.PROD.MSG.ObservationInfoBase
{

Property HRValue As SQLTOFHIR.PROD.MSG.ObservationValueSet;

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
<Value name="3">
<Value>PID</Value>
</Value>
<Value name="4">
<Value>ObservationCategory</Value>
</Value>
<Value name="5">
<Value>ObservationName</Value>
</Value>
<Value name="6">
<Value>MeasurementDateTime</Value>
</Value>
<Value name="7">
<Value>HRValue</Value>
</Value>
<Value name="8">
<Value>EffectiveDateTime</Value>
</Value>
</Data>
<DefaultData>HeartRateInfoDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

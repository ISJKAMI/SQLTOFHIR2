Class SQLTOFHIR.PROD.MSG.ObservationInfoBase Extends Ens.Response
{

Property PID As %String;

Property ObservationType As %String;

Property ObservationCategory As SQLTOFHIR.PROD.MSG.CodeableConcept;

Property ObservationName As SQLTOFHIR.PROD.MSG.CodeableConcept;

Property Interpretation As SQLTOFHIR.PROD.MSG.CodeableConcept;

Property bodySite As SQLTOFHIR.PROD.MSG.CodeableConcept;

Property Status As %String;

Property EffectiveDateTime As %String;

Storage Default
{
<Data name="ObservationInfoBaseDefaultData">
<Subscript>"ObservationInfoBase"</Subscript>
<Value name="1">
<Value>PID</Value>
</Value>
<Value name="2">
<Value>ObservationCategory</Value>
</Value>
<Value name="3">
<Value>ObservationName</Value>
</Value>
<Value name="4">
<Value>Interpretation</Value>
</Value>
<Value name="5">
<Value>bodySite</Value>
</Value>
<Value name="6">
<Value>Status</Value>
</Value>
<Value name="7">
<Value>EffectiveDateTime</Value>
</Value>
<Value name="8">
<Value>ObservationType</Value>
</Value>
</Data>
<DefaultData>ObservationInfoBaseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

Class SQLTOFHIR.PROD.ObservationInfoBase Extends Ens.Response
{

Property PID As %String;

Property ObservationCategory As SQLTOFHIR.PROD.CodeableConcept;

Property ObservationName As SQLTOFHIR.PROD.CodeableConcept;

Property Interpretation As SQLTOFHIR.PROD.CodeableConcept;

Property bodySite As SQLTOFHIR.PROD.CodeableConcept;

Property Status As %String;

Property EffectiveDateTime As %String;

Storage Default
{
<Data name="ObservationInfoBaseDefaultData">
<Subscript>"ObservationInfoBase"</Subscript>
<Value name="1">
<Value>Patient</Value>
</Value>
<Value name="2">
<Value>ObservationCategory</Value>
</Value>
<Value name="3">
<Value>ObservationName</Value>
</Value>
<Value name="4">
<Value>ValueQuantity</Value>
</Value>
<Value name="5">
<Value>PID</Value>
</Value>
<Value name="6">
<Value>Status</Value>
</Value>
<Value name="7">
<Value>EffectiveDateTime</Value>
</Value>
<Value name="8">
<Value>Interpretation</Value>
</Value>
<Value name="9">
<Value>bodySite</Value>
</Value>
</Data>
<DefaultData>ObservationInfoBaseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

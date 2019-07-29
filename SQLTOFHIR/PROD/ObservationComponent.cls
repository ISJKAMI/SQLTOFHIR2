/// Ens.Response
Class SQLTOFHIR.PROD.ObservationComponent Extends Ens.Response
{

Property Code As CodeableConcept;

Property ValueQuantity As ObservationValueSet;

Storage Default
{
<Data name="ObservationComponentDefaultData">
<Subscript>"ObservationComponent"</Subscript>
<Value name="1">
<Value>Code</Value>
</Value>
<Value name="2">
<Value>ValueQuantity</Value>
</Value>
</Data>
<DefaultData>ObservationComponentDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

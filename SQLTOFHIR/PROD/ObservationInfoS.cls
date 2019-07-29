Class SQLTOFHIR.PROD.ObservationInfoS Extends SQLTOFHIR.PROD.ObservationInfoBase
{

Property ValueQuantity As ObservationValueSet;

Storage Default
{
<Data name="ObservationInfoSDefaultData">
<Subscript>"ObservationInfoS"</Subscript>
<Value name="1">
<Value>ValueQuantity</Value>
</Value>
</Data>
<DefaultData>ObservationInfoSDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

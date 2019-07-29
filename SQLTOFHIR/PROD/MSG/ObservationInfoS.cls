Class SQLTOFHIR.PROD.MSG.ObservationInfoS Extends SQLTOFHIR.PROD.MSG.ObservationInfoBase
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

Class SQLTOFHIR.PROD.MSG.ObservationInfoC Extends SQLTOFHIR.PROD.MSG.ObservationInfoBase
{

// Property ValueQuantityList As list Of ObservationValueSet;

Property ComponentList As list Of ObservationComponent;

Storage Default
{
<Data name="ObservationInfoCDefaultData">
<Subscript>"ObservationInfoC"</Subscript>
<Value name="1">
<Value>ComponentList</Value>
</Value>
</Data>
<DefaultData>ObservationInfoCDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

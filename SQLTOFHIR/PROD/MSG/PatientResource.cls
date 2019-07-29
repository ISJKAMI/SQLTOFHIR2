Class SQLTOFHIR.PROD.MSG.PatientResource Extends Ens.Response
{

Property Payload As %Stream.GlobalCharacter;

Storage Default
{
<Data name="PatientResourceDefaultData">
<Subscript>"PatientResource"</Subscript>
<Value name="1">
<Value>Payload</Value>
</Value>
</Data>
<DefaultData>PatientResourceDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

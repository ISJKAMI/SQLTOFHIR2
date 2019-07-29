Class SQLTOFHIR.PROD.MSG.GetFHIRResourceRequest Extends Ens.Request
{

Property Pid As %String;

Property Type As %String;

Storage Default
{
<Data name="GetFHIRResourceRequestDefaultData">
<Subscript>"GetFHIRResourceRequest"</Subscript>
<Value name="1">
<Value>Pid</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
</Data>
<DefaultData>GetFHIRResourceRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

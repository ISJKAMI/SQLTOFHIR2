Class SQLTOFHIR.PROD.MSG.OperationOutcome Extends Ens.Response
{

Property severity As %String;

Property code As %String;

Property detailsText As %String(MAXLEN = 10000);

Property diagnostics As %String(MAXLEN = 10000);

Storage Default
{
<Data name="OperationOutcomeDefaultData">
<Subscript>"OperationOutcome"</Subscript>
<Value name="1">
<Value>severity</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>detailsText</Value>
</Value>
<Value name="4">
<Value>diagnostics</Value>
</Value>
</Data>
<DefaultData>OperationOutcomeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

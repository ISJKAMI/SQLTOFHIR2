Class SQLTOFHIR.SQL.PulseRate Extends (%Persistent, %Populate)
{

Property PID As %String [ InitialExpression = 1001, SqlColumnNumber = 2 ];

Property MeasurementDate As %TimeStamp [ SqlColumnNumber = 3 ];

Property PRValue As %Integer [ SqlColumnNumber = 4 ];

ForeignKey PIDForeignKey(PID) References SQLTOFHIR.SQL.Patient(PIDUniqueIndex);

Storage Default
{
<Data name="PulseRateDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PID</Value>
</Value>
<Value name="3">
<Value>MeasurementDate</Value>
</Value>
<Value name="4">
<Value>PRValue</Value>
</Value>
</Data>
<DataLocation>^SQLTOFHIR.SQL.PulseRateD</DataLocation>
<DefaultData>PulseRateDefaultData</DefaultData>
<IdLocation>^SQLTOFHIR.SQL.PulseRateD</IdLocation>
<IndexLocation>^SQLTOFHIR.SQL.PulseRateI</IndexLocation>
<StreamLocation>^SQLTOFHIR.SQL.PulseRateS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

Class SQLTOFHIR.SQL.BodyTemperature Extends %Persistent
{

Property PID As %String [ InitialExpression = 1001, SqlColumnNumber = 2 ];

Property MeasurementDate As %TimeStamp [ SqlColumnNumber = 3 ];

Property BTValue As %Numeric [ SqlColumnNumber = 4 ];

Property BTValueUnit As %String [ SqlColumnNumber = 5 ];

ForeignKey PIDForeignKey(PID) References SQLTOFHIR.SQL.Patient(PIDUniqueIndex);

Storage Default
{
<Data name="BodyTemperatureDefaultData">
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
<Value>BTValue</Value>
</Value>
<Value name="5">
<Value>BTValueUnit</Value>
</Value>
</Data>
<DataLocation>^SQLTOFHIR.SQL.BodyTemperatureD</DataLocation>
<DefaultData>BodyTemperatureDefaultData</DefaultData>
<IdLocation>^SQLTOFHIR.SQL.BodyTemperatureD</IdLocation>
<IndexLocation>^SQLTOFHIR.SQL.BodyTemperatureI</IndexLocation>
<StreamLocation>^SQLTOFHIR.SQL.BodyTemperatureS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

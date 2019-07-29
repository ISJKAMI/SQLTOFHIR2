Class SQLTOFHIR.SQL.BloodPressure Extends %Persistent
{

// 	set sql="SELECT ID, BPSysValue As BPSysValue,BPDiaValue As BPDiaValue,MeasurementDate As DateTimeValue,Arm as Arm,Result As Result FROM SQLTOFHIR_SQL.BloodPressure WHERE PID = ?"

Property PID As %String [ InitialExpression = 1001, SqlColumnNumber = 2 ];

Property MeasurementDate As %TimeStamp [ SqlColumnNumber = 3 ];

Property Arm As %String [ SqlColumnNumber = 4 ];

Property BPSysValue As %Integer [ SqlColumnNumber = 5 ];

Property BPDiaValue As %Integer [ SqlColumnNumber = 6 ];

Storage Default
{
<Data name="BloodPressureDefaultData">
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
<Value>Arm</Value>
</Value>
<Value name="5">
<Value>BPSysValue</Value>
</Value>
<Value name="6">
<Value>BPDiaValue</Value>
</Value>
<Value name="7">
<Value>Result</Value>
</Value>
</Data>
<DataLocation>^SQLTOFHIR.SQL.BloodPressureD</DataLocation>
<DefaultData>BloodPressureDefaultData</DefaultData>
<IdLocation>^SQLTOFHIR.SQL.BloodPressureD</IdLocation>
<IndexLocation>^SQLTOFHIR.SQL.BloodPressureI</IndexLocation>
<StreamLocation>^SQLTOFHIR.SQL.BloodPressureS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

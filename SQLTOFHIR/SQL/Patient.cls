Class SQLTOFHIR.SQL.Patient Extends %Persistent
{

Property PID As %String [ SqlColumnNumber = 2 ];

Property GivenName As %String [ SqlColumnNumber = 3 ];

Property FamilyName As %String [ SqlColumnNumber = 4 ];

Property GivenNameKana As %String [ SqlColumnNumber = 5 ];

Property FamilyNameKana As %String [ SqlColumnNumber = 6 ];

Property PostalCode As %String [ SqlColumnNumber = 7 ];

Property Address As %String [ SqlColumnNumber = 8 ];

Property DateOfBirth As %Date [ SqlColumnNumber = 9 ];

Property Gender As %String [ SqlColumnNumber = 10 ];

Property Phone As %String [ SqlColumnNumber = 11 ];

Index PIDUniqueIndex On PID [ Unique ];

ClassMethod testdata(pid, gname, fname, gnamek, fnamek, postal, address, dob, gender, phone)
{

	&sql(insert into SQLTOFHIR_SQL.Patient (pid,givenname,familyname,givennamekana,familynamekana,postalcode,address,dateofbirth,gender,phone)
	values (:pid,:gname,:fname,:gnamek,:fnamek,:postal,:address,:dob,:gender,:phone)
	)
}

Storage Default
{
<Data name="PatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PID</Value>
</Value>
<Value name="3">
<Value>GivenName</Value>
</Value>
<Value name="4">
<Value>FamilyName</Value>
</Value>
<Value name="5">
<Value>GivenNameKana</Value>
</Value>
<Value name="6">
<Value>FamilyNameKana</Value>
</Value>
<Value name="7">
<Value>PostalCode</Value>
</Value>
<Value name="8">
<Value>Address</Value>
</Value>
<Value name="9">
<Value>DateOfBirth</Value>
</Value>
<Value name="10">
<Value>Gender</Value>
</Value>
<Value name="11">
<Value>Phone</Value>
</Value>
</Data>
<DataLocation>^SQLTOFHIR.SQL.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<IdLocation>^SQLTOFHIR.SQL.PatientD</IdLocation>
<IndexLocation>^SQLTOFHIR.SQL.PatientI</IndexLocation>
<StreamLocation>^SQLTOFHIR.SQL.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

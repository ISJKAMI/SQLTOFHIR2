Class SQLTOFHIR.PROD.PatientInfo Extends Ens.Response
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

Storage Default
{
<Data name="PatientInfoDefaultData">
<Subscript>"PatientInfo"</Subscript>
<Value name="1">
<Value>PID</Value>
</Value>
<Value name="2">
<Value>GivenName</Value>
</Value>
<Value name="3">
<Value>FamilyName</Value>
</Value>
<Value name="4">
<Value>GivenNameKana</Value>
</Value>
<Value name="5">
<Value>FamilyNameKana</Value>
</Value>
<Value name="6">
<Value>PostalCode</Value>
</Value>
<Value name="7">
<Value>Address</Value>
</Value>
<Value name="8">
<Value>DateOfBirth</Value>
</Value>
<Value name="9">
<Value>Gender</Value>
</Value>
<Value name="10">
<Value>Phone</Value>
</Value>
</Data>
<DefaultData>PatientInfoDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

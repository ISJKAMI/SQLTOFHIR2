Class SQLTOFHIR.SQL.Prescription Extends %Persistent
{

Property PID As %String [ SqlColumnNumber = 2 ];

Property 薬剤名 As %String [ SqlColumnNumber = 3 ];

Property 薬剤コード As %String [ SqlColumnNumber = 4 ];

Property 処方日 As %String [ SqlColumnNumber = 5 ];

Property 処方1回量 As %String [ SqlColumnNumber = 6 ];

Property 処方1回量単位 As %String [ SqlColumnNumber = 7 ];

Property 処方1日回数 As %String [ SqlColumnNumber = 8 ];

Property 日数 As %String [ SqlColumnNumber = 9 ];

Property 用法 As %String [ SqlColumnNumber = 10 ];

Property 全体量 As %String [ SqlColumnNumber = 11 ];

Property 全体量単��� As %String [ SqlColumnNumber = 12 ];

Storage Default
{
<Data name="PrescriptionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PID</Value>
</Value>
<Value name="3">
<Value>薬剤名</Value>
</Value>
<Value name="4">
<Value>薬剤コード</Value>
</Value>
<Value name="5">
<Value>処方日</Value>
</Value>
<Value name="6">
<Value>処方1回量</Value>
</Value>
<Value name="7">
<Value>処方1回量単位</Value>
</Value>
<Value name="8">
<Value>処方1日回数</Value>
</Value>
<Value name="9">
<Value>日数</Value>
</Value>
<Value name="10">
<Value>用法</Value>
</Value>
<Value name="11">
<Value>全体量</Value>
</Value>
<Value name="12">
<Value>全体量単位</Value>
</Value>
</Data>
<DataLocation>^SQLTOFHIR.SQL.PrescriptionD</DataLocation>
<DefaultData>PrescriptionDefaultData</DefaultData>
<IdLocation>^SQLTOFHIR.SQL.PrescriptionD</IdLocation>
<IndexLocation>^SQLTOFHIR.SQL.PrescriptionI</IndexLocation>
<StreamLocation>^SQLTOFHIR.SQL.PrescriptionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

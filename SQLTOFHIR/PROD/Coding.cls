Class SQLTOFHIR.PROD.Coding Extends Ens.Response
{

/// Coding System URL (例："http://snomed.info/sct"）
Property System As %String(MAXLEN = 1000);

/// コード（例："271649006"）
Property Code As %String(MAXLEN = 1000);

/// 表記　（例："Systolic blood pressure"）
Property Display As %String(MAXLEN = 1000);

/// getCoding
ClassMethod getCoding(pSystem As %String = "", pCode As %String = "", pDisplay As %String = "") As Coding
{
	#dim retVal As Coding
	set retVal=..%New()
	set retVal.System=pSystem
	set retVal.Code=pCode
	set retVal.Display=pDisplay
	return retVal
}

Storage Default
{
<Data name="CodingDefaultData">
<Subscript>"Coding"</Subscript>
<Value name="1">
<Value>System</Value>
</Value>
<Value name="2">
<Value>Code</Value>
</Value>
<Value name="3">
<Value>Display</Value>
</Value>
</Data>
<DefaultData>CodingDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

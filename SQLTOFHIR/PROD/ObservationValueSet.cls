Class SQLTOFHIR.PROD.ObservationValueSet Extends Ens.Response
{

Property Value As %Numeric;

Property Unit As %String;

Property System As %String;

Property Code As %String;

/// getValueSet
ClassMethod getValueSet(pValue As %Numeric = "", pUnit As %String = "", pSystem As %String = "", pCode As %String = "") As ObservationValueSet
{
	#dim retVal As ObservationValueSet
	
	set retVal=..%New()
	set retVal.Value=pValue
	set retVal.Unit=pUnit
	set retVal.System=pSystem
	set retVal.Code=pCode
	return retVal
}

Storage Default
{
<Data name="ObservationValueSetDefaultData">
<Subscript>"ObservationValueSet"</Subscript>
<Value name="1">
<Value>Value</Value>
</Value>
<Value name="2">
<Value>Unit</Value>
</Value>
<Value name="3">
<Value>System</Value>
</Value>
<Value name="4">
<Value>Code</Value>
</Value>
</Data>
<DefaultData>ObservationValueSetDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

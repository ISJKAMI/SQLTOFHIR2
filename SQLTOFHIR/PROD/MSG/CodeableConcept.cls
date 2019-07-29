Class SQLTOFHIR.PROD.MSG.CodeableConcept Extends Ens.Response
{

/// Coding情報
Property Coding As SQLTOFHIR.PROD.MSG.Coding;

/// 表記　（例："Blood pressure systolic & diastolic"）
Property Text As %String;

/// getCodeableConcept
ClassMethod getCodeableConcept(pSystem As %String = "", pCode As %String = "", pDisplay As %String = "", pText As %String = "") As Coding
{
	#dim retVal As CodeableConcept
	set retVal=..%New()
	set retVal.Coding=##class(Coding).getCoding(pSystem,pCode,pDisplay)
	set retVal.Text=pText
	return retVal
}

Storage Default
{
<Data name="CodeableConceptDefaultData">
<Subscript>"CodeableConcept"</Subscript>
<Value name="1">
<Value>Coding</Value>
</Value>
<Value name="2">
<Value>Text</Value>
</Value>
</Data>
<DefaultData>CodeableConceptDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

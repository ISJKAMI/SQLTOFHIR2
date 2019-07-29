Class SQLTOFHIR.PROD.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="SQLTOFHIR.PROD.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="SQLTOFHIR.PROD.SQLOperation" Category="" ClassName="SQLTOFHIR.PROD.SQLOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="DSN">jdbc:IRIS://127.0.0.1:51773/SQLTOFHIR</Setting>
    <Setting Target="Adapter" Name="Credentials">LOCAL</Setting>
    <Setting Target="Adapter" Name="JDBCClasspath"></Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.intersystems.jdbc.IRISDriver</Setting>
    <Setting Target="Adapter" Name="JGService">EnsLib.JavaGateway.Service</Setting>
  </Item>
  <Item Name="SQLTOFHIR.PROD.GetFHIRResources" Category="" ClassName="SQLTOFHIR.PROD.GetFHIRResources" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SQLTOFHIR.REST.Services" Category="" ClassName="SQLTOFHIR.REST.Services" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">SQLTOFHIR.PROD.GetFHIRResources</Setting>
  </Item>
  <Item Name="EnsLib.JavaGateway.Service" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ClassPath">C:\InterSystems\IRISH20191\dev\java\lib\JDK18\intersystems-gateway-3.0.0.jar</Setting>
    <Setting Target="Host" Name="JavaHome"></Setting>
    <Setting Target="Host" Name="Address">127.0.0.1</Setting>
  </Item>
</Production>
}

}

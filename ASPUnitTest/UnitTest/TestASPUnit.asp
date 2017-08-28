<%
Option Explicit
Response.LCID = 1043 
Response.CharSet = "utf-8"
%>
<!-- #include virtual="/ASPUnitTest/include/ASPUnitRunner.asp"-->

<!--#include virtual ="/constant/CommonConstant.asp" -->
<!--#include virtual="/utils/utils.asp" -->
<!--#include virtual ="/dto/dxodto/DxoDto.asp" -->
<!--#include virtual ="/dto/dspdto/DspDto.asp" -->
<!--#include virtual="/service/service.asp" -->


<!-- #include file="TCTest.asp"-->
<!-- #include file="ServiceTest/CustomerServiceTest.asp"-->
<%
	Dim oRunner
	Set oRunner = New UnitRunner
	'oRunner.AddTestContainer New TCTest
	oRunner.AddTestContainer New CustomerServiceTest
	oRunner.Display()
%>

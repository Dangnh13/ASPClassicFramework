    <!--#include file="CustomerController.asp" -->

    <!--#include file="HomeController.asp" -->

    <%
        Public Controllers : Set Controllers = Server.CreateObject("Scripting.Dictionary")

        Controllers.Add "HomeController", ""
        Controllers.Add "CustomerController", ""

      
    %>
      
    
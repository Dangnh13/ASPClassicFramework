 <%
    class HomeController
      Dim ViewData

      private sub Class_Initialize()
        Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

      public Sub Index()
           Response.Redirect("?controller=Customer&action=list")
        End Sub

    End Class

%>
    
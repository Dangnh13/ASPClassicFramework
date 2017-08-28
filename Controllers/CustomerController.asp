 <%
    class CustomerController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

      public Sub SearchPost(args)
            Dim searchForm : set searchForm = new CustomerSearchForm
            Dim dxodto : set dxodto = new CustomerDxoDto
             If (Len(args("Name"))> 0) Then
                dxodto.Name = args("Name")
                searchForm.Name = dxodto.Name
             end if
             If (Len(args("Phone"))> 0) Then
                dxodto.Phone = args("Phone")
                 searchForm.Phone = dxodto.Phone
             end if
             If (Len(args("Status"))> 0) Then
                dxodto.Status = args("Status")
                searchForm.Status = dxodto.Status
             end if
                         
             If (Len(args("CreatedDateFrom"))> 0) Then
                dxodto.CreatedDateFrom = args("CreatedDateFrom")
                searchForm.CreatedDateFrom = dxodto.CreatedDateFrom
             end if
             If (Len(args("CreatedDateTo"))> 0) Then
                dxodto.CreatedDateTo = args("CreatedDateTo")
                searchForm.CreatedDateTo = dxodto.CreatedDateTo
             end if
            Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
            set Model = CustomerSrvc.FindAll(dxodto)
            %>   <!--#include virtual ="/webapp/views/Customer/List.asp" --> <%
        End Sub

        public Sub List()
            Dim searchForm : set searchForm = new CustomerSearchForm
            Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
            Dim dxodto : set dxodto = new CustomerDxoDto
            set Model = CustomerSrvc.FindAll(dxodto)
            %>   <!--#include virtual ="/webapp/views/Customer/List.asp" --> <%
        End Sub

        public Sub Create()
            set form = new CustomerForm
            %>   <!--#include virtual ="/webapp/views/Customer/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            dim form : set form = new CustomerForm
            If (Len(args("Name"))> 0) Then
                form.Name = args("Name")
             end if
            If (Len(args("Phone"))> 0) Then
                form.Phone = args("Phone")
            end if
            If (Len(args("Description"))> 0) Then
                form.Description = args("Description")
            end if
            Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
            With CustomerSrvc
                .name = form.Name
                .phone = form.Phone
                .description = form.Description
                .updateDatetime = Now
                .status = 1
                .createDatetime = Now
                .Save()
            End With
            Response.Redirect("?controller=Customer&action=list")
        End Sub

        public Sub Edit(vars)
            Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
            Call CustomerSrvc.Find(vars("id"))
            dim form : set form = new CustomerForm
            form.Id = CustomerSrvc.id
            form.Name = CustomerSrvc.name
            form.Description = CustomerSrvc.description
            form.Phone = CustomerSrvc.phone
            form.Status = CustomerSrvc.status
            %>   <!--#include virtual ="/webapp/views/Customer/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
           Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()

            With CustomerSrvc
                .id =  args("id")
                .name =  args("Name")
                .phone =  args("Phone")
                .description =  args("Description")
                .updateDatetime = Now
                .Save()
            End With
             Response.Redirect("?controller=Customer&action=list")
        End Sub

        public Sub Delete(vars)
            Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
            Call CustomerSrvc.Find(vars("id"))
            dim form : set form = new CustomerForm
            form.Id = CustomerSrvc.id
            form.Name = CustomerSrvc.name
            form.Description = CustomerSrvc.description
            form.Phone = CustomerSrvc.phone
            %>   <!--#include virtual ="/webapp/views/Customer/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
            With CustomerSrvc
                .id =  args("id")
                .status = 0
                .updateDatetime = Now
                .Save()
            End With
             Response.Redirect("?controller=Customer&action=list")
        End Sub


        public Sub Details(vars)
           Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
            Call CustomerSrvc.Find(vars("id"))
            dim form : set form = new CustomerForm
            form.Id = CustomerSrvc.id
            form.Name = CustomerSrvc.name
            form.Description = CustomerSrvc.description
            form.Phone = CustomerSrvc.phone
            form.Status = CustomerSrvc.status
            %>   <!--#include virtual ="/webapp/views/Customer/Details.asp" --> <%
        End Sub

        End Class

%>
    
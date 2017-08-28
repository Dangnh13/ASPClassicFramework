<link rel="stylesheet" type="text/css" href="webapp/resource/libs/dataTable/jquery.dataTables.min.css">
<link rel="stylesheet" href="webapp/resource/libs/jquery-ui-1.12.4/jquery-ui.css">
<script type="text/javascript" src="webapp/resource/libs/jquery-ui-1.12.4/jquery-1.12.4.js"></script>
<script src="webapp/resource/libs/dataTable/jquery.dataTables.min.js"></script>
<script src="webapp/resource/libs/jquery-ui-1.12.1/jquery-ui.js"></script>
    <form action="?controller=Customer&action=SearchPost" id="SearchPost" method="post">
      <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <table class="table table-striped">
                <caption>Search Criteria</caption>  
                <tr >
                    <td class=".bgField">
                        <%=Html.TextBoxExtend("Name", searchForm.Name, "Name", "form-control")%>
                    </td>
                    <td class=".bgField">
                        <%=Html.TextBoxExtend("Phone", searchForm.Phone, "Phone", "form-control")%>
                    </td>
                    <td></td>
                </tr>
                <tr >
                    <td class=".bgField">
                       Status 
                    </td>
                    <td class=".bgField"><%=eHtml.DropDownListCustom("Status", searchForm.Status, dictionary.ActiveFlag, "form-control")%></td>
                    <td></td>
                </tr>
                <tr >
                    <td class=".bgField">
                         <%=Html.TextBoxExtend("CreatedDateFrom", searchForm.CreatedDateFrom, "Created Date From", "form-control")%>
                    </td>
                    <td class=".bgField">
                         <%=Html.TextBoxExtend("CreatedDateTo", searchForm.CreatedDateTo, "Created Date To", "form-control")%>
                    </td>
                    <td></td>
                </tr>

                <tr>
                    <td colspan="2"></td>
                    <td align="right"><button type="submit" class="btn btn-primary">Search</button></td>
                </tr>
            </table>
        </div>
        <div class="col-md-3"></div>
      </div>

    </form>
      <div class="row">
        <div class="col-md-3" style="margin-left: -12px;">List Customer <%=Html.ActionLink("Create new Customer", "Customer", "Create" , "") %></div>
        <div class="col-md-9"></div>
      </div>
      <br>
      <table id="tbl_content">
          <thead>
        <tr>
          <td>
            Action
          </td>
          
          <td>
            Id
          </td>
          
          <td>
            Name
          </td>
          
          <td>
            Phone
          </td>
          
          <td>
            Description
          </td>
            <td>
            Created date
          </td>
            <td>
            Status
          </td>
            <td>
            Updated Datetime
          </td>
        </tr>
          </thead>
           <tbody>
        <%
    if  IsNothing(Model) then
        %> <tr>
          <td colspan="4">No records</td>
        </tr><%
    Else
        Dim obj
        For each obj in Model.Items
        %>
        <tr>
            <td>
                <%=Html.ActionLink("Details", "Customer", "Details" , "id=" + CStr(obj.Id)) %>|
                <%=Html.ActionLink("Edit", "Customer", "Edit" , "id=" + CStr(obj.Id)) %> |
                <%=Html.ActionLink("Delete", "Customer", "Delete" , "id=" + CStr(obj.Id)) %>
            </td>
            <td><%=Html.Encode(obj.Id) %></td>
            <td><%=Html.Encode(obj.Name) %></td>
            <td><%=Html.Encode(obj.Phone) %></td>
            <td><%=Html.Encode(obj.Description) %></td>
            <td><%=Html.Encode(obj.CreateDatetime) %></td>
            <td><%=Html.Encode(Html.ActiveFlag(obj.Status)) %></td>
            <td><%=Html.Encode(obj.UpdateDatetime) %></td>
        </tr>
          <% 
        Next
     End If
     %>
          </tbody>
      </table>

<script>
    $(document).ready(function () {
        $("#CreatedDateFrom").datepicker({ dateFormat: "yy/mm/dd" });
        $("#CreatedDateTo").datepicker({ dateFormat: "yy/mm/dd" }).val();
        $('#tbl_content').DataTable( {
            "searching": false
        } );
    });

</script>
    
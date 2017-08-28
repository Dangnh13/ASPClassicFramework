<form action="?controller=Customer&action=DeletePost" id="DeletePost" method="post" class="form-horizontal" style="width: 50%">
  
  <div class="form-group">
    <label  class="col-sm-4 control-label"></label>
    <div class="col-sm-8">
      <h2>Delete customer</h2> 
    </div>
  </div>

  <div class="form-group">
    <label for="Id" class="col-sm-4 control-label">Id</label>
    <div class="col-sm-8">
      <%=Html.Encode(form.Id)%>
        <%=Html.Hidden("id",form.Id) %>
    </div>
  </div>

  <div class="form-group">
    <label for="Name" class="col-sm-4 control-label">Customer Name</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="Name" name="Name" value="<%=Html.Encode(form.Name)%>" readonly/>
    </div>
  </div>

  <div class="form-group">
    <label for="Phone" class="col-sm-4 control-label">Phone</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="Phone" name="Phone" value="<%=Html.Encode(form.Phone)%>" readonly/>
    </div>
  </div>

  <div class="form-group">
    <label for="Description" class="col-sm-4 control-label">Description</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="Description" name="Description" value="<%=Html.Encode(form.Description)%>" readonly/>
    </div>
  </div>

   <div class="form-group">
    <label for="Status" class="col-sm-4 control-label"></label>
    <div class="col-sm-8">
      <div class="checkbox">
        <button type="submit" class="btn btn-primary">Confirm Delete</button>
        <a class="btn btn-default" href="?controller=Customer&action=List" role="button">Back to list</a>
    </div>
    </div>
  </div>
</form>     
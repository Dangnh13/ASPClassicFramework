<form action="?controller=Customer&action=CreatePost" id="CreatePost" method="post" class="form-horizontal" style="width: 50%">
  
  <div class="form-group">
    <label  class="col-sm-4 control-label"></label>
    <div class="col-sm-8">
      <h2>Create Customer</h2> 
    </div>
  </div>

  <div class="form-group">
    <label for="Id" class="col-sm-4 control-label">Id</label>
    <div class="col-sm-8">
       <%=Html.Hidden("id",0) %>
    </div>
  </div>

  <div class="form-group">
    <label for="Name" class="col-sm-4 control-label">Customer Name</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="Name" value="<%=Html.Encode(form.Name)%>" />
    </div>
  </div>

  <div class="form-group">
    <label for="Phone" class="col-sm-4 control-label">Phone</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="Phone" value="<%=Html.Encode(form.Phone)%>" />
    </div>
  </div>

  <div class="form-group">
    <label for="Description" class="col-sm-4 control-label">Description</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="Description" value="<%=Html.Encode(form.Description)%>" />
    </div>
  </div>

   <div class="form-group">
    <label for="Status" class="col-sm-4 control-label"></label>
    <div class="col-sm-8">
      <div class="checkbox">
        <button type="submit" class="btn btn-primary">Submit</button>
        <a class="btn btn-default" href="?controller=Customer&action=List" role="button">Back to list</a>
    </div>
    </div>
  </div>
</form>   

    
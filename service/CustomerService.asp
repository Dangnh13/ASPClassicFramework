<%
	Class CustomerService

        Private StrSQL, EntityManager, ObjConexao

        ' Define fields
         %><!--#include virtual ="/entity/CustomerEntity.asp" --><%

        Public Default Function Init()
            Dim Conexao : Set Conexao = Server.CreateObject("ADODB.Connection")

            Conexao.open connectionString

            Set ObjConexao = Conexao

            Set EntityManager = (new ClassEntityManager)("customer", "id", me)

            Call EntityManager.Register("id", "id", "int")
            Call EntityManager.Register("name", "name", "string")
            Call EntityManager.Register("phone", "phone", "string")
            Call EntityManager.Register("description", "description", "string")
            Call EntityManager.Register("status", "status", "string")
            Call EntityManager.Register("create_datetime", "createDatetime", "string")
            Call EntityManager.Register("update_datetime", "updateDatetime", "string")

            Set EntityManager.ObjConexao = Conexao
    
            Set Init = me
        End Function

        Public Sub Save()
            Call EntityManager.Save()
        End Sub

        Public Sub Delete()
            Call EntityManager.Delete()
        End Sub 

        Public Sub Find(pId)
            me.Id = pId
            Call EntityManager.Load()
        End Sub 

        Public Function FindAll(dxodto)
            StrSQL = _
                    " SELECT * " &_
                    " FROM customer   where 1=1 "
            If (Len(dxodto.Name)> 0) Then
                StrSQL = StrSQL & " AND name like '%' ||  ? || '%'"
            end if
             If (Len(dxodto.Phone)> 0) Then
                StrSQL = StrSQL & " AND phone like '%' || ? || '%'"
            end if
            If (Len(dxodto.Status)> 0) Then
                StrSQL = StrSQL & " AND status = ?"
            end if
            If (Len(dxodto.CreatedDateFrom)> 0) Then
                StrSQL = StrSQL & " AND CONVERT(VARCHAR(10), create_datetime, 111) >= ?"
            end if
            If (Len(dxodto.CreatedDateTo)> 0) Then
                StrSQL = StrSQL & " AND CONVERT(VARCHAR(10), create_datetime, 111)  <= ?"
            end if
             StrSQL = StrSQL & " ORDER BY ID ASC"
          Dim objCommand : set objCommand = Server.CreateObject("ADODB.command")
         
          objCommand.ActiveConnection=ObjConexao
          objCommand.NamedParameters = False
          objCommand.CommandText = StrSQL
          objCommand.CommandType = adCmdText
          
          DbAddParameters objCommand, Array(  dxodto.Name, dxodto.Phone, dxodto.Status, dxodto.CreatedDateFrom, dxodto.CreatedDateTo)
           
          Dim records : set records = objCommand.Execute
        
          if records.eof then
          
            Set FindAll = Nothing
          else
           
              Dim results, obj, record
              Set results = Server.CreateObject("Scripting.Dictionary")
              
              while not records.eof
              
                set obj = PopulateObjectFromRecord(records)
                 
                results.Add obj.Id, obj
                records.movenext
              wend
              set FindAll = results
              records.Close
          End If
          
          set records = nothing
        End Function

        private function PopulateObjectFromRecord(record)
            if record.eof then
                Set PopulateObjectFromRecord = Nothing
            else
                Dim obj
                set obj = new CustomerDspDto
                obj.Id = record("Id")
                obj.Name = record("name")
                obj.Phone = record("Phone")
                obj.Description = record("Description")
                obj.Status = record("Status")
                obj.CreateDatetime = record("create_datetime")
                obj.UpdateDatetime = record("update_datetime")
                set PopulateObjectFromRecord = obj
          end if
        end function
	End Class
%>

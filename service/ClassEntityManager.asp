<!--#include virtual ="/service/SQLFormatter.asp" -->
<%
	Class ClassEntityManager
        
        Public ObjConexao

        Private StrSQL, objRs, Identity, ParentClass
        Private Table, Fields, Values, Types
        
        Sub Class_Initialize()
            Set Fields = Server.CreateObject("Scripting.Dictionary")
            Set Values = Server.CreateObject("Scripting.Dictionary")
            Set Types  = Server.CreateObject("Scripting.Dictionary")
        End Sub
        
        Public Default Function Init(pTable, pIdentity, pParentClass)
            Table = pTable
            Identity = pIdentity
            Set ParentClass = pParentClass
            Set Init = me
        End Function
        
        Public Sub Register(pKey, pField, pType)
            If Not Fields.Exists(pKey) Then
                Call Fields.Add(pKey, pField)
                Call Types.Add(pKey, pType)
            End If
        End Sub
        
        Private Sub UpdateDictionary()
            Dim Key
            For Each Key In Fields.Keys
                Call SetValue(Key, Eval("ParentClass."& Fields( Key )))
            Next
        End Sub

        Private Sub SetValue(pField, pValue)
            If pValue = "" Then 
                Exit Sub
            End If
    
            If Values.Exists(pField) Then
                Values.Item(pField) = pValue
            Else
                Call Values.Add(pField, pValue)
            End If
        End Sub

        Public Sub Save()
            UpdateDictionary()
            If Values.Exists( Identity ) Then
                If Values.Item( Identity ) <> "" and Values.Item( Identity ) <> 0 Then
                    StrSQL = UpdateQuery()
                Else
                    StrSQL = InsertQuery() & InsertValuesQuery()
                End If
            Else
                StrSQL = InsertQuery() & InsertValuesQuery()
            End If
            
            If StrSQL = "" Then Exit Sub
            Set objRs = ObjConexao.Execute( StrSQL )

           ' If Fields.Exists( Identity ) Then
            'response.write "vao day"  & Fields( Identity ) & objRs("Id")
               ' Execute("ParentClass." & Fields( Identity ) & " = " & objRs("ID"))
            'End If
        End Sub
        
        Public Sub Delete()
            UpdateDictionary()

            StrSQL = DeleteQuery()
            If StrSQL = "" Then Exit Sub
            ObjConexao.Execute( StrSQL )
        End Sub

        Public Sub Load()
            UpdateDictionary()

            StrSQL = SelectQuery()
            If StrSQL = "" Then Exit Sub
            Set objRs = ObjConexao.Execute( StrSQL )
            If Not objRs.Eof Then
                Dim Key
                For Each Key In Fields.Keys
                    Execute("ParentClass." & Fields.Item( Key ) & " = """ & objRs( Key ) & """")
                Next
            End If
        End Sub

        'Métodos para gerar as queries
        Private Function InsertQuery()
            Dim Key, tempArray : tempArray = Array()
            For Each Key In Values.Keys
                If Key <> Identity Then
                    Redim Preserve tempArray( UBound(tempArray) + 1 )
                    tempArray( Ubound(tempArray) ) = Key
                End If
            Next
            InsertQuery = "INSERT INTO " & Table & " (" & Join(tempArray, ", ") & " ) "
        End Function

        Private Function InsertValuesQuery()
            Dim Key, tempArray : tempArray = Array()
            For Each Key In Values.Keys
                If Key <> Identity Then
                    Redim Preserve tempArray( UBound(tempArray) + 1 )
                    tempArray( Ubound(tempArray) ) = FormatType( Values.Item( Key ), Types.Item( Key ) )
                End If
            Next 
            InsertValuesQuery = " VALUES ( " & Join(tempArray, ", ") & " )  "
        End Function

        Private Function UpdateQuery()
            Dim Key, IdentityQuery, tempArray : tempArray = Array()
            For Each Key in Values.Keys
                If Key = Identity Then
                    IdentityQuery = Identity & " = " & FormatType( Values.Item( Key ), Types.Item( Key ) )
                Else
                    Redim Preserve tempArray( UBound(tempArray) + 1 )
                    tempArray( Ubound(tempArray) ) = Key & " = " & FormatType( Values.Item( Key ), Types.Item( Key ) )
                End If
            Next

            UpdateQuery = " UPDATE " & Table & _
                          " SET " & Join(tempArray, ", ") &_
                          " WHERE " & IdentityQuery
        End Function
        
        Private Function DeleteQuery()
            If Not Values.Exists( Identity ) Then Exit Function
            DeleteQuery = "DELETE FROM " & Table & " WHERE " & Identity & " = " & FormatType( Values.Item( Identity ), Types.Item( Identity ) )
        End Function

        Private Function SelectQuery()
            If Not Values.Exists( Identity ) Then Exit Function

            SelectQuery = _
                        " SELECT " & Join(Fields.Keys, ", ") & " FROM " & table &_
                        " WHERE " & Identity & " = " & FormatType( Values.Item( Identity ), Types.Item( Identity ) )
            
        End Function

        Private Function FormatType(pValue, pType)

            If UCase(pValue) = "NULL" Then 
                FormatType = pValue
                Exit Function
            End If
            Select Case LCase(pType)
            
                Case "decimal"
                    FormatType = ParseDecimalToSQL(pValue)

                Case "string"
                    
                    FormatType = "'" & pValue & "'"
                
                Case "bool"
                    FormatType = ToSqlBit(pValue)
        
                Case Else
                    FormatType = pValue
            End Select
        End Function

	End Class
%>

<%
Class CustomerServiceTest

	Public Function TestCaseNames()
		TestCaseNames = Array("ListTest1", "ListTest2", "ListTest3")
	End Function

	Public Sub SetUp()
		'Response.Write("SetUp<br>")
	End Sub

	Public Sub TearDown()
		'Response.Write("TearDown<br>")
	End Sub

    ' Test Equal
	Public Sub ListTest1(oTestResult)
        Dim dictActual : Set dictActual = Server.CreateObject("Scripting.Dictionary")
		dictActual.Add "43", Array("43", "1", "0978534865","1","1")
		dictActual.Add "44", Array("44","2","2","2","0")
		dictActual.Add "45", Array("45","343","34",null,"1")

        Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
        Dim dxodto : set dxodto = new CustomerDxoDto
        Dim Model : set Model = CustomerSrvc.FindAll(dxodto)
        Dim dictExpected : Set dictExpected = Server.CreateObject("Scripting.Dictionary")
        Dim obj
        For each obj in Model.Items
            dictExpected.add obj.Id, Array(obj.Id, obj.Name, obj.Phone, obj.Description, obj.status)
        Next
        Dim actualStr, expectedStr
        actualStr = Server.HTMLEncode(JSONEncodeDict("Data", dictActual)) 
        expectedStr = Server.HTMLEncode(JSONEncodeDict("Data", dictExpected)) 
        oTestResult.AssertEquals actualStr, expectedStr,  "Not Equal"
	End Sub

    ' Check List Size
    Public Sub ListTest2(oTestResult)
        Dim sizeActual, sizeExpected
        sizeActual = 3
        Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
        Dim dxodto : set dxodto = new CustomerDxoDto
        Dim Model : set Model = CustomerSrvc.FindAll(dxodto)
        response.write "vao day : " 
        sizeExpected = Model.Count
        oTestResult.AssertEquals sizeActual,sizeExpected,  "Not Equal"
	End Sub

    ' Check Empty list
    Public Sub ListTest3(oTestResult)
        Dim CustomerSrvc : Set CustomerSrvc = (new CustomerService)()
        Dim dxodto : set dxodto = new CustomerDxoDto
        Dim Model : set Model = CustomerSrvc.FindAll(dxodto)
        oTestResult.Assert (NOt Model Is Nothing),  "Not nothing"
	End Sub
End Class
%>
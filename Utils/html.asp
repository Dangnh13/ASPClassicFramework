<%
class cExtendedHTMLHelper

	public Function Encode (elValue)
	    if Not IsNothing(elValue) Then
			Encode = Server.HTMLEncode(elValue)
		End If
	end function 

	public Function Label (elValue, objfor, attribs)
		Label = "<label for='" + objfor + "'" + attribs + ">" + Encode(elValue) + "</label>"
	end function
	
	public Function Hidden ( elID, elValue, attribs)
	    Hidden =  "<input id='" + elID + "' name='" + elID + "' type='hidden' value='" + Encode(elValue) + "' " + attribs + " />"
	end function

	public Function TextBox (elId, elValue, attribs)
		TextBox = "<input id='" + elID + "' name='" + elID + "' type='text' value='" + Encode(elValue) + "' " + attribs + " />"
	end function

	public Function TextArea (elId, elValue, cols, rows, attribs)
		TextArea = "<textarea id='" + elID + "' name='" + elID + "' cols='" + Encode(cols) + "' rows='" + Encode(rows) + "' " + attribs + " >" & _
		 Encode(elValue) & _
		 "</textarea>"
	end function

	public Function DropDownList (elId, elValue, list , idName, valueName, attribs)
		Dim resStr, lisItem
		resStr= "<select id='" + elID + "' name='" + elID + "'>" 
		For Each listItem in List
		    Dim optValue, optText
		    optValue = Eval("listItem." + idName)
		    optText  = Eval("listItem." + valueName)
			if elValue = optValue Then
				resStr = resStr + "<option selected='selected' value='" + Encode(optValue) + attribs + "'>" + Encode(optText) + "</option>"
			else
				resStr = resStr + "<option value='" + Encode(optValue) + "'>" + Encode(optText) + "</option>"
			End If
		Next
		resStr = resStr & "</select>"
		DropDownList = resStr
	end function
    
    public Function DropDownListCustom (elId, elValue, list,styleClass)
  
        Dim resStr
		resStr= "<select id='" + elId + "' name='" + elId + "' class='" + styleClass + "'>" 
        For Each key in list
            if Encode(key) = elValue Then
                resStr = resStr + "<option selected='selected' value='" + Encode(key) + "'>" + Encode(list.item(key)) + "</option>"	
			else
				resStr = resStr + "<option value='" + Encode(key) + "'>" + Encode(list.item(key)) + "</option>"	
			End If

			
		Next
		resStr = resStr & "</select>"
		DropDownListCustom = resStr
	end function

    public Function ActionLink(linkText, linkController, linkAction , linkVars, attribs) 
		Dim strVars
      
		If IsEmpty(linkVars) or IsNull(linkVars) then
			strVars = ""
		else
			if IsArray(linkVars) then
				for each varPair in linkVars
					strVars  = strVars + "&" + varPair
				next
			else
				strVars = linkVars
			end if
		end if
      
		if (strVars<>"") then 
			strVars = "&" + strVars
		End if
   
		ActionLink = "<a href='?controller=" + Encode(linkController)+ "&action=" + Encode(linkAction)  +   Encode(strVars) + "&partial=true' " + attribs + ">" + Encode(linkText) + "</a>"
	end function

	public Function CheckBox( elId, elValue, attribs )
	    Dim checked 
	    if (elValue = 1) or (elValue = true) or (LCase(elValue) = "true") Then
			checked = "CHECKED"
		else
			checked = ""
		end If
		TextArea = "<input type='checkbox' id='" + elID + "' name='" + elID + "' " + checked + " " + attribs + " />" 
		Encode(elValue) 
	end function

end class

class cHTMLHelper

	public Function Encode (elValue)
	    if Not IsNothing(elValue) Then
			Encode = Server.HTMLEncode(elValue)
		End If
	end function 

   

	public Function Label (elValue, objfor)
		Label = "<label for='" + objfor + "'>" + Encode(elValue) + "</label>"
	end function
	
	public Function Hidden ( elID, elValue)
	    Hidden =  "<input id='" + elID + "' name='" + elID + "' type='hidden' value='" + Encode(elValue) + "' />"
	end function

	public Function TextBox (elId, elValue, placeholder)
		TextBox = "<input id='" + elID + "' name='" + elID + "' type='text' value='" + Encode(elValue) + "'" + " placeholder='" + placeholder+"' />"
	end function
	
	public Function TextBoxExtend (elId, elValue, placeholder, styleClass)
		TextBoxExtend = "<input id='" + elID + "' name='" + elID + "' type='text' value='" + Encode(elValue) + "'" + " placeholder='" + placeholder + "' class='" + styleClass + "' />"
	end function

	public Function TextBoxCustom (elId, elValue, styleClass, attribs)
		TextBoxCustom = "<input id='" + elID + "' name='" + elID + "' type='text' value='" + Encode(elValue) + "' class='" + styleClass + "'" + attribs + " />"
	end function

	public Function TextArea (elId, elValue, cols, rows)
		TextArea = "<textarea id='" + elID + "' name='" + elID + "' cols='" + Encode(cols) + "' rows='" + Encode(rows) + "'>" & _
		 Encode(elValue) & _
		 "</textarea>"
	end function

	public Function DropDownList (elId, elValue, list , idName, valueName)
		Dim resStr, lisItem
		resStr= "<select id='" + elID + "' name='" + elID + "'>" 
		For Each listItem in List
		    Dim optValue, optText
		    optValue = Eval("listItem." + idName)
		    optText  = Eval("listItem." + valueName)
			if elValue = optValue Then
				resStr = resStr + "<option selected='selected' value='" + Encode(optValue) + "'>" + Encode(optText) + "</option>"
			else
				resStr = resStr + "<option value='" + Encode(optValue) + "'>" + Encode(optText) + "</option>"
			End If
		Next
		resStr = resStr & "</select>"
		DropDownList = resStr
	end function
    
    public Function ActionLink(linkText, linkController, linkAction , linkVars) 
		Dim strVars
      
		If IsEmpty(linkVars) or IsNull(linkVars) then
			strVars = ""
		else
			if IsArray(linkVars) then
				for each varPair in linkVars
					strVars  = strVars + "&" + varPair
				next
			else
				strVars = linkVars
			end if
		end if
      
		if (strVars<>"") then 
			strVars = "&" + strVars
		End if
   
		ActionLink = "<a href='?controller=" + Encode(linkController)+ "&action=" + Encode(linkAction)  +   Encode(strVars) + "'>" + Encode(linkText) + "</a>"
	end function

	public Function CheckBox( elId, elValue)
	    Dim checked 
	    if (CStr(elValue) = "1") or (CStr(LCase(elValue)) = "true")  Then
			checked = "CHECKED"
		else
			checked = ""
		end If
		CheckBox = "<input type='checkbox' id='" + elID + "' name='" + elID + "' " + checked + " />" 
		Encode(elValue) 
	end function

	Public Sub RenderControllerAction(controller,action,vars)
		Dim controllerName
        controllerName = controller + "Controller"
        Dim controllerInstance 
        Set controllerInstance = Eval ( " new " +  controllerName)
        Dim actionCallString 
		If Not (IsNothing(vars)) then
                actionCallString = " controllerInstance." + action + "(vars)"
            Else
                actionCallString = " controllerInstance." + action + "()"
            End If
            Eval (actionCallString)
	End Sub

     public Function ActiveFlag (elValue)
	    if Not IsNothing(elValue) Then
            if elValue = "0" then
			    ActiveFlag = "InActive"
             else
                ActiveFlag = "Active"
             end if
		End If
	end function 

    
end class

public Html, eHtml
set Html = new cHTMLHelper
set eHtml = new cExtendedHTMLHelper

%>
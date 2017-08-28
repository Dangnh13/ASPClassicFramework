<!--#include file ="constant/CommonConstant.asp" -->
<!--#include file="utils/utils.asp" -->
<!--#include file ="dto/form/form.asp" -->
<!--#include file ="dto/dxodto/DxoDto.asp" -->
<!--#include file ="dto/dspdto/DspDto.asp" -->
<!--#include file="service/service.asp" -->
<!--#include file="controllers/controllers.asp" -->
<%

    Const defaultController = "Home"
    Const defaultAction = "Index"

    partial     = Request.QueryString("partial")

    If Not(IsEmpty(partial) or IsNull(partial))  Then
        If not Route () then
            result = RouteDebug ()
        End If
    else
        %> <!--#include file="webapp/views/shared/Site.htmltemplate" --> <%
    End If   

    Function ContentPlaceHolder()
        If not Route () then
            result = RouteDebug ()
        End If
    End Function

Function Route ()

    Dim controller, action , vars
    controller  = Trim (CStr(Request.QueryString("controller")))
    action      = actionClean (Trim (CStr(Request.QueryString("action"))))
    set vars        = CollectVariables()
    Route = False

    If IsEmpty(controller) or IsNull(controller) or (controller="") then
        controller = defaultController
    End If
    
    If IsEmpty(action) or IsNull(action) or (action="") then
        action = defaultAction
    End If

    Dim controllerName
    controllerName = controller + "Controller"
    if Not (Controllers.Exists(controllerName)) Then
        Response.Clear
        Response.Status="401 Unauthorized"
        Response.Write(response.Status)
        Response.End
    End if

    Dim controllerInstance 
    Set controllerInstance = Eval ( " new " +  controllerName)
    Dim actionCallString 
    If (Instr(1,action,"Post",1)>0) then
        actionCallString = " controllerInstance." + action + "(Request.Form)"
    ElseIf Not (IsNothing(vars)) then
        actionCallString = " controllerInstance." + action + "(vars)"
    Else
        actionCallString = " controllerInstance." + action + "()"
    End If
    Eval (actionCallString)
    Route = true
End Function


Function RouteDebug ()
    Dim controller, action , vars
    controller  = Request.QueryString("controller")
    action      = Request.QueryString("action")

    Response.Write(controller)
    Response.Write(action)
    
    dim key, keyValue
    for each key in Request.Querystring
        keyValue = Request.Querystring(key)
        'ignore service keys
        if InStr(1,"controller, action, partial",key,1)=0 Then
            Response.Write( key + " = " + keyValue )
        End If
    next
end function

Function CollectVariables
    dim key, keyValue
    Set results = Server.CreateObject("Scripting.Dictionary")
    dim actionMethod : set actionMethod = Request.ServerVariables("REQUEST_METHOD")
   
    for each key in Request.QueryString
        keyValue = Request.QueryString(key)
        'ignore service keys
        if InStr(1,"controller, action, partial",key,1)=0 Then
            results.Add key,keyValue 
        End If
    next
    if results.Count=0 Then
        Set CollectVariables = Nothing
    else 
        Set CollectVariables = results
    End If
End Function


Function actionClean(strtoclean)
    Dim objRegExp, outputStr
    Set objRegExp = New RegExp
    outputStr = strtoclean
    objRegExp.IgnoreCase = True
    objRegExp.Global = True
    objRegExp.Pattern = "\W"
    outputStr = objRegExp.Replace(outputStr, "")
    actionClean = outputStr
End Function

 %>

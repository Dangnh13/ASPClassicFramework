<%
Option Explicit
Response.LCID = 1043 ' Brazilian LCID (use your locale code here).
' Cold also be the LCID property of the page declaration or Session.LCID to set it to the entire session.
%>
<!--#include file="rc4.inc"-->
<!--#include file="utils.asp"-->
<%
   ':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
   ':::                                                       :::
   ':::  This script is an example of how to use the RC4      :::
   ':::  algorithm (included in rc4.inc). It can serve as     :::
   ':::  a test harness for algorithm validation, as well.    :::
   ':::                                                       :::
   ':::  Note: This test expects to be called from a FORM     :::
   ':::        POST, and should include the fields PSW (the   :::
   ':::        password) and TXT (the plaintext)              :::
   ':::                                                       :::
   ':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

   dim strSecretKey
   dim strDriver, strServer, strUid, strPwd, strDatabase
   dim encryptUID, encryptPWD
   dim jsonObj, jsonString, jsonArr, outputObj

   dim fs, f
   Set fs=Server.CreateObject("Scripting.FileSystemObject")
   Set f=fs.OpenTextFile(Server.MapPath("systems.config"), 1)

   dim jsonConfig
   do while f.AtEndOfStream = false
       jsonConfig = jsonConfig & f.ReadLine
   loop

   f.Close
   Set f=Nothing
   Set fs=Nothing

   set jsonObj = new JSONobject
   set jsonArr = new jsonArray

   set outputObj = jsonObj.parse(jsonConfig)

   strSecretKey = jsonObj.value("strSecretKey")
   strDriver = jsonObj.value("strDriver")
   strServer = jsonObj.value("strServer")
   strUid = jsonObj.value("strUid")
   strPwd = jsonObj.value("strPwd")
   strDatabase = jsonObj.value("strDatabase")

%>

<html>
    <body>
        <h3>RC4 Test Harness</h3>
        <br>
        <b>SecretKey:</b> <%=strSecretKey%>
        <br>
        <b>strDriver:</b> <%=strDriver%>
        <br>
        <b>strServer:</b> <%=strServer%>
        <br>
        <b>strDatabase:</b> <%=strDatabase%>
        <br>
        <br>
        <b>UID:</b> <%=strUid%>
        <br>
        <%
            encryptUID = EnDeCrypt(strUid, strSecretKey)
        %>
        <b>Encrypted UID:</b> <%=server.urlencode(encryptUID)%>
        <%
            strUid = EnDeCrypt(encryptUID, strSecretKey)
        %>
        <br>
        <b>Decrypted UID:</b> <%=strUid%><br>

        <br>
        <b>PWD:</b> <%=strPwd%>
        <br>
        <%
            encryptPWD = EnDeCrypt(strPwd, strSecretKey)
        %>
        <b>Encrypted PWD:</b> <%=server.urlencode(encryptPWD)%>
        <%
            strPwd = EnDeCrypt(encryptPWD, strSecretKey)
        %>
        <br>
        <b>Decrypted PWD:</b> <%=strPwd%><br>
    </body>
</html>

    
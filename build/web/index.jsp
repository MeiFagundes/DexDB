<%-- 
    Document   : index
    Created on : 17/09/2018, 12:41:53
    Author     : Mei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DexDB</title>
        <script src="PokeScript.js" type="text/javascript"></script>
    </head>
    <body onload="changeInputType('id')">
        <h1>DexDB</h1>
        Search Pokemon By:<br>
        <select id="inputType" onchange="inputType_onchange()">
            <option value="id" selected>Id</option>
            <option value="name">Name</option>
        </select><br>
        
        <span>Value to be searched:<br>
            <div id="inputDataDiv"></div>
        </span>
        <button type="button" onclick="retrieveData()">Search Pokemon</button>
        <div id="data"></div>
    </body>
</html>

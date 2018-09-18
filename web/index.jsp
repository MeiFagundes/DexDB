<%-- 
    Document   : index
    Created on : 17/09/2018, 12:41:53
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>DexDB JSP</h1>
        <a href="PokeServlet?inputType=name&inputData=Bulbasaur">Search by name</a><br>
        <a href="PokeServlet?inputType=id&inputData=1">Search by id</a><br>
        <a href="PokeServlet?inputType=wrong&inputData=1000" class="btn">Search with wrong parameters test</a>
    </body>
</html>

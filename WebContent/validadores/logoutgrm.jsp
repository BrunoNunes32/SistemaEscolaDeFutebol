<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Deslogando</title>
</head>
<body>



<%
	String sessao = (String) session.getAttribute("grm"); 

	if(sessao!=null){
		session.removeAttribute("grm");
	}

	response.sendRedirect("../grm/login.jsp");


%>


</body>
</html>
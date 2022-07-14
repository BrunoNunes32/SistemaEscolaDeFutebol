<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="Validacoes.LoginAluno" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Validação de Login</title>
</head>
<body>

<%
	String sessao = (String) session.getAttribute("aluno");	

	if(sessao==null){

	
		String usuario = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		if(usuario!=null && senha!=null){
			LoginAluno valida = new LoginAluno(usuario,senha);
			
			int resultado = valida.valida_login();
			
			if(resultado==1){
				session.setAttribute("aluno", usuario);
				response.sendRedirect("../aluno/index.jsp");
			}else if(resultado==0){
				out.print("<script language='javascript'>alert('Login ou senha incorretos!');window.location.href = '../aluno/login.jsp';</script>");
			}else{
				out.print("<script language='javascript'>alert('Login ou senha incorretos!');window.location.href = '../aluno/login.jsp';</script>");
			}
			
			
		}else{
			out.print("<script language='javascript'>alert('Preencha os dois campos!');window.location.href = '../aluno/login.jsp';</script>");
		}

	}else{
		response.sendRedirect("../aluno/index.jsp");
	}






%>



</body>
</html>
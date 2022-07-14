<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@page import="Validacoes.LoginFuncionario" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Validação de Login</title>
</head>
<body>

<%
	String sessao = (String) session.getAttribute("grm");	

	if(sessao==null){

	
		String usuario = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		if(usuario!=null && senha!=null){
			LoginFuncionario valida = new LoginFuncionario(usuario,senha);
			
			int resultado = valida.valida_login();
			
			if(resultado==1){
				session.setAttribute("grm", usuario);
				response.sendRedirect("../grm/index.jsp");
			}else if(resultado==0){
				out.print("<script language='javascript'>alert('Login ou senha incorretos!');window.location.href = '../grm/login.jsp';</script>");
			}else{
				out.print("<script language='javascript'>alert('Houve um problema nos nossos servidores,tente novamente mais tarde!');window.location.href = '../grm/login.jsp';</script>");
			}
			
			
		}else{
			out.print("<script language='javascript'>alert('Preencha os dois campos!');window.location.href = '../grm/login.jsp';</script>");
		}

	}else{
		response.sendRedirect("../grm/index.jsp");
	}
%>






</body>
</html>
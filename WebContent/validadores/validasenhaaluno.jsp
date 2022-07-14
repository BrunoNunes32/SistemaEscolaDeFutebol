<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Validacoes.LoginAluno"%>
    
 
 <%
	String sessao = (String) session.getAttribute("aluno");

	if(sessao==null){
		response.sendRedirect("../aluno/login.jsp");
	}

	
	
	String senha = request.getParameter("senha");
	String confsenha = request.getParameter("confsenha");
	
	
	if(senha==null || confsenha==null){
	
		out.print("<script language='javascript'> location.href='../aluno/login.jsp'; </script>");
		if(true){return;}

	}else if(!senha.equals(confsenha)){
		out.print("<script language='javascript'> alert('Campo de confirmação deve ser igual a senha!'); location.href='../aluno/novasenha.jsp'; </script>");
		if(true){return;}
	}else{
		String res = LoginAluno.altera_senha(sessao, senha);
		
		if(res.equals("sucesso")){
			out.print("<script language='javascript'> alert('Senha alterada com sucesso!'); location.href='../aluno/login.jsp'; </script>");
			if(true){return;}
		}else{
			out.print("<script language='javascript'> alert('Campo senha excedeu o limite!'); location.href='../aluno/novasenha.jsp'; </script>");
			if(true){return;}
			
		}
				
	}

%>    
 
 
 
 
 
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Validacoes.LoginFuncionario" %>
    

<%
	String sessao = (String) session.getAttribute("grm");

	if(sessao==null){
		response.sendRedirect("../../grm/login.jsp");
	}



%>    
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Excluindo</title>
</head>
<body>

<%
	String res = LoginFuncionario.deleta_func(sessao);

	if(res.equals("sucesso")){
		out.print("<script language='javascript'>alert('Perfil excluído com sucesso!'); location.href='../logoutgrm.jsp';</script>");
		if(true){return;}
	}else{
		out.print("<script language='javascript'>alert('Falha ao excluir perfil!'); location.href='../../grm/index.jsp';</script>");
		if(true){return;}
	}


%>





</body>
</html>
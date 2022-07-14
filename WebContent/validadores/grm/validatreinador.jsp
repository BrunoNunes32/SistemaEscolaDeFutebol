<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Treinador" import="Validacoes.LoginTreinador"%>
    
    
<%
 	String sessao = (String) session.getAttribute("grm");
 	
 	if(sessao==null){
 		response.sendRedirect("../../grm/login.jsp");
 	}
 
 
 
 %>
     
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Salvando</title>
</head>
<body>



<%

String cpf = request.getParameter("cpf");

String nome = request.getParameter("nome");

String dt_nasc = request.getParameter("dt_nasc");

String rg = request.getParameter("rg");

String sexo = request.getParameter("sexo");

String senha = request.getParameter("senha");

if(cpf==null || nome==null || dt_nasc==null || rg==null || sexo==null || senha==null){
	out.print("<script language='javascript'>location.href='../../grm/treinadores.jsp'; </script>");
	if(true){return;}
}else if(rg.length()!=9){
	out.print("<script language='javascript'>alert('Digite um rg válido! (9 dígitos)');location.href='../../grm/novotreinador.jsp'; </script>");
	if(true){return;}
}else if(cpf.length()!=11){
	out.print("<script language='javascript'>alert('Digite um cpf válido! (11 dígitos)');location.href='../../grm/novotreinador.jsp'; </script>");
	if(true){return;}
}else if (senha.length()>30){
	out.print("<script language='javascript'>alert('Digite uma senha válida! (até 30 dígitos)');location.href='../../grm/novotreinador.jsp'; </script>");
	if(true){return;}
}else{
	
	Treinador tr = new Treinador(nome,dt_nasc,rg,cpf,sexo);
	
	
	String res = tr.cadastra_treinador();
	
	if(res.equals("Cadastro realizado com sucesso!")){
		LoginTreinador lt = new LoginTreinador(cpf,senha);
		
		lt.cadastra_usuario();
		
		out.print("<script language='javascript'>alert('Treinador cadastrado com sucesso!');location.href='../../grm/treinadores.jsp'; </script>");
		if(true){return;}
	}else if(res.equals("Cadastro existente!")){
		out.print("<script language='javascript'>alert('Cadastro com este cpf já existe!');location.href='../../grm/novotreinador.jsp'; </script>");
		if(true){return;}
	}else{
		out.print("<script language='javascript'>alert('Algum campo excedeu o limite de caracteres ou a data possui um formato inválido');location.href='../../grm/novotreinador.jsp'; </script>");
		if(true){return;}
		
	}
}

%>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Models.Treinador" import="Models.Avaliacao" import='Validacoes.Data'%>

<%
	String sessao = (String) session.getAttribute("treinador");
	if(sessao==null){
		response.sendRedirect("../treinador/login.jsp");
	}


%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>adicionando avalia��o</title>
</head>
<body>
<% 
	try{

	String treinador = sessao;
	String nome = request.getParameter("nome");
	double nota = Double.valueOf(request.getParameter("nota")).doubleValue();
	String dt_aplicacao = request.getParameter("dt_aplicacao");
	
	if(nome==null){
		response.sendRedirect("../treinador/novaava.jsp");
	}else{
		
		Data data = new Data();
		
		data.setDataanalise(dt_aplicacao);
		
		if(data.comparativo().equals("menor")){
			out.print("<script language='javascript'>alert('A avalia��o adicionada deve ser aplicada hoje ou em uma data futura!');window.location.href = '../treinador/novaava.jsp';</script>");
		}else{
		
		
		
		
		 Avaliacao ava = new Avaliacao(nome,nota,dt_aplicacao,Treinador.getTreina(sessao));
		 String res = ava.defAvaliacao();
		
		 if(res.equals("Avalia��o n�o pode ser registrada por algum dado inv�lido")){
			 out.print("<script language='javascript'>alert('Falha ao adicionar avalia��o por algum campo exceder o limite de caracteres ou n�meros!');window.location.href = '../treinador/novaava.jsp';</script>");
		 }else{
			 out.print("<script language='javascript'>alert('Avalia��o cadastrada com sucesso!');window.location.href = '../treinador/avaliacoes.jsp';</script>");
		 }
		
		}
		
	}
	
	}catch (Exception e){
		response.sendRedirect("../treinador/novaava.jsp");
	}





%>

</body>
</html>
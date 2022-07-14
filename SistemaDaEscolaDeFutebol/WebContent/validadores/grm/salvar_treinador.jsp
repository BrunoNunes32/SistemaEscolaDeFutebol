<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Treinador"%>
    
    
<%
	String sessao = (String) session.getAttribute("grm");

	if(sessao==null){
		response.sendRedirect("login.jsp");
	}
				
	
	String treinador = request.getParameter("treinador");
	
	Treinador treina = Treinador.getTreina(treinador);
	
	if(treina==null){
		out.print("<script language='javascript'> location.href='../../grm/treinadores.jsp'; </script>");
		if(true){return;}
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

String nome = request.getParameter("nome");

String dt_nasc = request.getParameter("dt_nasc");

String rg = request.getParameter("rg");

String sexo = request.getParameter("sexo");

if(nome==null || dt_nasc==null || rg==null || sexo==null){
	out.print("<script language='javascript'>location.href='treinadores.jsp'; </script>");
	if(true){return;}
}else if(rg.length()!=9){
	out.print("<script language='javascript'>alert('Digite um rg válido! (9 dígitos)');location.href='../../grm/treinadores.jsp'; </script>");
	if(true){return;}
}else{
	
	Treinador tr = new Treinador(nome,dt_nasc,rg,treinador,sexo);
	
	
	String res = tr.altera_treina();
	
	if(res.equals("sucesso")){
		out.print("<script language='javascript'>alert('Treinador atualizado com sucesso!');location.href='../../grm/treinadores.jsp'; </script>");
		if(true){return;}
	}else{
		out.print("<script language='javascript'>alert('Algum campo excedeu o limite de caracteres ou a data possui um formato inválido'); location.href='../../grm/alterartreinador.jsp?treinador="+treinador+"'; </script>");
		if(true){return;}
	}
	
	
	
}

%>



</body>
</html>
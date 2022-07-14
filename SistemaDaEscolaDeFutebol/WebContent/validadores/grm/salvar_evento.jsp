<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Evento" import="Validacoes.Data"%>
    
    
    
<%
String sessao = (String) session.getAttribute("grm");

if(sessao==null){
	response.sendRedirect("../../grm/login.jsp");
}

int evento;
Evento eve;

try{
	
	evento =  Integer.parseInt(request.getParameter("evento"));

	eve = Evento.getEvento(evento);
	
	if(eve==null){
		out.print("<script language='javascript'> location.href='../../grm/eventos.jsp' </script>");
		if(true){return;}
	}
	
}catch(Exception e){
	out.print("<script language='javascript'> location.href='../../grm/eventos.jsp' </script>");
	if(true){return;}
}


%>    
    
    
    
    
<!DOCTYPE html>
<html lang='pt-br'>
<head>
<meta charset="utf-8">
<title>Salvando</title>


</head>
<body>

<%

String nome_evento = request.getParameter("nome");
String turno_evento = request.getParameter("turno");
String data_inicio = request.getParameter("inicio");
String data_termino = request.getParameter("fim");

if(eve.getNome().equals("Período de Matrícula")){
	nome_evento = "Período de Matrícula";
}



if(data_inicio==null || nome_evento==null){
	out.print("<script language='javascript'> location.href='../../grm/eventos.jsp' </script>");
	if(true){return;}
}else{
	if(turno_evento==null || turno_evento.equals("--//--")){
		turno_evento = null;
	}
	
	if(data_termino==null || data_termino.equals("")){
		data_termino = null;
	}
	
	
	
	
	if(data_termino!=null){
		String res_data = Data.entre_datas(data_inicio, data_termino);
		
		if(res_data.equals("maior") || res_data.equals("igual")){
			out.print("<script language='javascript'>alert('A data de término(quando existe) deve ser maior que a data de início!'); location.href='../../grm/alterarevento.jsp?evento="+evento+"'; </script>");
			if(true){return;}
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	Evento ev = new Evento(nome_evento,turno_evento,data_inicio,data_termino);
	ev.setId(evento);
	
	String res = ev.altera_evento();
	
	if(res.equals("sucesso")){
		out.print("<script language='javascript'>alert('Evento alterado com sucesso!'); location.href='../../grm/eventos.jsp'; </script>");
		
	}else{
		out.print("<script language='javascript'>alert('Algum campo foi preenchido de forma incorreta (dado inválido ou limite excedido) !'); location.href='../../grm/alterarevento.jsp?evento="+evento+"'; </script>");
	}
	
}

%>


</body>
</html>
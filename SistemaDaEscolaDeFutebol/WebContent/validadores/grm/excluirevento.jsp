<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="Models.Evento"%>

    
  
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
	
	if(eve==null || eve.getNome().equals("Período de Matrícula")){
		out.print("<script language='javascript'> location.href='../../grm/eventos.jsp' </script>");
		if(true){return;}
	}
	
}catch(Exception e){
	out.print("<script language='javascript'> location.href='../../grm/eventos.jsp' </script>");
	if(true){return;}
}


%>    
      
       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Excluindo</title>
</head>
<body>



<%
	String res = Evento.deleta_evento(evento);
	if(res.equals("sucesso")){
		out.print("<script language='javascript'>alert('Evento excluído com sucesso!'); ;window.location.href='../../grm/eventos.jsp';</script>");
	}else{
		out.print("<script language='javascript'>alert('Houve algum erro ao excluir um evento!'); location.href='../../grm/eventos.jsp'; </script>");
}




%>









</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Turno" %>


<%
String sessao = (String) session.getAttribute("grm");

if(sessao==null){
	response.sendRedirect("../../grm/login.jsp");
}


String turno = request.getParameter("turno");

Turno tur = Turno.getTurno(turno);

if(tur==null){
	out.print("<script language='javascript'>location.href='../../grm/turnos.jsp'</script>");
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
	String res = Turno.deleta_turno(turno);

	if(res.equals("sucesso")){
		out.print("<script language='javascript'>alert('Turno excluído com sucesso!'); ;window.location.href='../../grm/turnos.jsp';</script>");
	}else{
		out.print("<script language='javascript'>alert('Algumas informações que incluem o turno podem ter sido alteradas,menos o próprio turno!'); location.href='../../grm/turnos.jsp'; </script>");
}




%>


</body>
</html>
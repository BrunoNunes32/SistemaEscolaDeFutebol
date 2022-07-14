<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Turno"%>


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
<title>Cadastrando</title>
</head>
<body>


<%

String nome = request.getParameter("turno");
String horini = request.getParameter("horini");
String horfim = request.getParameter("horfim");


if(nome==null || horini==null || horfim==null){
	out.print("<script language='javascript'>location.href='../../grm/turnos.jsp'</script>");
	if(true){return;}
}else{
		Turno tu = new Turno(nome,horini,horfim,0);
		
		String res = tu.cadastra_turno();
		
		if(res.equals("Turno cadastrado com sucesso!")){
			
			out.print("<script language='javascript'> alert('Turno cadastrado com sucesso!');location.href='../../grm/turnos.jsp';</script>");
			if(true){return;}
		}else if(res.equals("Turno existente!")){
			out.print("<script language='javascript'> alert('Já existe um turno com este nome!');location.href='../../grm/novoturno.jsp';</script>");
			if(true){return;}
		}else{
			out.print("<script language='javascript'> alert('Algum dado passado foi inválido ou excedeu o limite de tamanho!');location.href='../../grm/novoturno.jsp';</script>");
			if(true){return;}	
		}
		
	}




%>



</body>
</html>
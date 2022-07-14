<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Turno"%>


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
<html lang='pt-br'>
<head>
<meta charset="utf-8">
<title>Salvando</title>
</head>
<body>


<%

String nome = turno;
String horini = request.getParameter("horini");
String horfim = request.getParameter("horfim");
String qtd_alunos = request.getParameter("qtd_alunos");

if(nome==null || horini==null || horfim==null || qtd_alunos==null){
	out.print("<script language='javascript'>location.href='../../grm/turnos.jsp'</script>");
	if(true){return;}
}else{
	try{
		int quantidade = Integer.parseInt(qtd_alunos);
		
		Turno tu = new Turno(nome,horini,horfim,quantidade);
		
		String res = tu.altera_turno();
		
		if(res.equals("sucesso")){
			
			out.print("<script language='javascript'> alert('Turno alterado com sucesso!');location.href='../../grm/turnos.jsp';</script>");
		}else{
			out.print("<script language='javascript'> alert('Algum dado passado foi inválido ou excedeu o limite de tamanho!');location.href='../../grm/alterarturno.jsp?turno="+turno+"';</script>");
		}
		
		
		
	}catch(Exception e){
		out.print("<script language='javascript'> alert('A quantidade deve ser númerica!');location.href='../../grm/alterarturno.jsp?turno="+turno+"';</script>");
	}
	
	
	
}



%>


</body>
</html>
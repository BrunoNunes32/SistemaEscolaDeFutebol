<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="Models.Aluno" import="Models.Treinador" import="Models.Turno"%>
    



<%
 		String sessao = (String) session.getAttribute("grm");
 		String aluno = request.getParameter("aluno");
 		
 		Aluno alu = Aluno.dadosAluno(aluno);
 		
 		if(sessao==null){
 			response.sendRedirect("../../grm/login.jsp");
 		}
 		
 		
 		
 		if(alu==null || alu.getTreinador()==null){
 			out.print("<script language='javascript'>window.location.href='../../grm/alunos.jsp'</script>");
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
	String res = Aluno.deleta_aluno(aluno);

	if(res.equals("sucesso")){
		Turno turno = alu.getTurno();
		
		if(turno!=null){
			Turno.adRemovQtd("remove", turno.getTurno());
		}
		
		out.print("<script language='javascript'>alert('Aluno excluído com sucesso!'); ;window.location.href='../../grm/alunos.jsp';</script>");
	}else{
		out.print("<script language='javascript'>alert('Erro no banco de dados!'); ;window.location.href='../../grm/alunos.jsp';</script>");
	}

%>





</body>
</html>
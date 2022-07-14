<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="Models.Aluno" import="Models.Treinador" import="Models.Turno"%>
    
    
 


<%
 		String sessao = (String) session.getAttribute("grm");
 		String aluno = request.getParameter("aluno");
 		
 		Aluno alu = Aluno.dadosAluno(aluno);
 		
 		if(sessao==null){
 			response.sendRedirect("../../grm/login.jsp");
 		}
 		
 		
 		
 		if(alu==null || alu.getTreinador()!=null){
 			out.print("<script language='javascript'>window.location.href='../../grm/alunos.jsp'</script>");
 			if(true){return;}
 		}
 
 %>   

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Excluindo</title>
</head>
<body>

<%
	String res = Aluno.deleta_aluno(aluno);

	if(res.equals("sucesso")){
		out.print("<script language='javascript'>alert('Cadastro pendente excluído com sucesso!'); ;window.location.href='../../grm/matriculaspe.jsp';</script>");
	}else{
		out.print("<script language='javascript'>alert('Cadastro pendente já foi excluído!'); ;window.location.href='../../grm/alunos.jsp';</script>");
	}

%>

</body>
</html>
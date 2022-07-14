<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Treinador"%>
    
    
    
    
    
    <%
 		String sessao = (String) session.getAttribute("grm");
 		String treinador = request.getParameter("treinador");
 		
 		Treinador treina = Treinador.getTreina(treinador);
 		
 		if(sessao==null){
 			response.sendRedirect("../../grm/login.jsp");
 		}
 		
 		
 		
 		if(treina==null){
 			out.print("<script language='javascript'>window.location.href='../../grm/alunos.jsp'</script>");
 			if(true){return;}
 		}
 
 %>   
    
     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>excluindo</title>
</head>
<body>

	

<%
	String res = Treinador.deleta_treina(treinador);

	if(res.equals("sucesso")){
		out.print("<script language='javascript'>alert('Cadastro excluído com sucesso!'); ;window.location.href='../../grm/treinadores.jsp';</script>");
	}else{
		out.print("<script language='javascript'>alert('Avaliações e desempenhos relacionados ao treinador foram eliminados,menos o próprio,pois há alunos associados a ele(a)'); location.href='../../grm/treinadores.jsp'; </script>");
	}

%>









</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import='Models.Treinador'%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Atualizando</title>
</head>
<body>

<%	
	String sessao = (String) session.getAttribute("treinador");
	String nome = request.getParameter("nome");	
	String dt_nasc = request.getParameter("dt_nasc");	
	String rg = request.getParameter("rg");		
	String sexo = request.getParameter("sexo");	
	

	
	if(sessao==null ||(rg==null && dt_nasc==null) ){
		response.sendRedirect("../treinador/login.jsp");
	}else if(rg.length()!=9){
		out.print("<script language='javascript'>alert('Digite um RG válido! (9 dígitos)');location.href='../treinador'</script>");	
		
	}else{
		Treinador treina = new Treinador(nome,dt_nasc,rg,sessao,sexo);
		String res = treina.salva_treinador();
		
		if(res.equals("Cadastro atualizado com sucesso!")){
				out.print("<script language='javascript'>alert('Dados salvos com sucesso!');location.href='../treinador'</script>");
		}else{
			out.print("<script language='javascript'>alert('Houve um erro,tente novamente mais tarde!');location.href='../treinador'</script>");
		}
			
			
	}
%>

</body>
</html>
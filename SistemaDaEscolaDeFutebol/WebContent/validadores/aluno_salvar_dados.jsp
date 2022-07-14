<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  
<%@ page import='Models.Responsavel' import='Models.Aluno'%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Atualizando</title>
</head>
<body>

<%	
	String sessao = (String) session.getAttribute("aluno");

	String nome = request.getParameter("nome");	
	String dt_nasc = request.getParameter("dt_nasc");	
	String rg = request.getParameter("rg");		
	String sexo = request.getParameter("sexo");	
	String nome_resp = request.getParameter("nome_resp");	
	String dt_nasc_resp = request.getParameter("dt_nasc_resp");	
	String rg_resp = request.getParameter("rg_resp");	
	
	String sexo_resp = request.getParameter("sexo_resp");	
	String telcel = request.getParameter("telcel");	

	
	if(sessao==null ||(dt_nasc==null || dt_nasc_resp==null || rg==null || rg_resp==null) ){
		response.sendRedirect("../aluno/login.jsp");
	}else if(rg.length()!=9){
		out.print("<script language='javascript'>alert('Digite um RG válido! (9 dígitos)');location.href='../aluno/login.jsp'</script>");	
		
	}else if(rg_resp.length()!=9){
		out.print("<script language='javascript'>alert('Digite um RG válido para o responsável! (9 dígitos)');location.href='../aluno/login.jsp'</script>");	
		
	}else{
		String cpf_resp = Aluno.dadosAluno(sessao).getResponsavel().getCpf();
		
		Responsavel resp = new Responsavel(nome_resp,dt_nasc_resp,rg_resp,cpf_resp,sexo_resp,telcel);
		String res_resp = resp.salva_responsavel();
		
		if(res_resp.equals("Cadastro atualizado com sucesso!")){
			Aluno aluno = new Aluno(nome,dt_nasc,rg,sessao,sexo,resp,Aluno.dadosAluno(sessao).getDt_matricula());
			
			String res_aluno = aluno.salva_aluno();
			
			if(res_aluno.equals("Cadastro atualizado com sucesso!")){
					out.print("<script language='javascript'>alert('Dados salvos com sucesso!');location.href='../aluno/login.jsp'</script>");
			}else{
					out.print("<script language='javascript'>alert('Houve um erro,tente novamente mais tarde!');location.href='../aluno/login.jsp'</script>");
				}
			
		}else{
			out.print("<script language='javascript'>alert('Telefone/Celular aceita até 11 números!');location.href='../aluno/login.jsp'</script>");
		}
			
	}
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="Models.Aluno" import="Models.Responsavel" import = "Validacoes.LoginAluno" import="Validacoes.Data" import="Models.Evento" import="java.util.ArrayList"%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Matriculando</title>
</head>
<body>

<%

	String nome = request.getParameter("nome");	
	String dt_nasc = request.getParameter("dt_nasc");	
	String rg = request.getParameter("rg");	
	String cpf = request.getParameter("cpf");	
	String sexo = request.getParameter("sexo");	
	String nome_resp = request.getParameter("nome_resp");	
	String dt_nasc_resp = request.getParameter("dt_nasc_resp");	
	String rg_resp = request.getParameter("rg_resp");	
	String cpf_resp = request.getParameter("cpf_resp");	
	String sexo_resp = request.getParameter("sexo_resp");	
	String telcel = request.getParameter("telcel");	
	String senha = request.getParameter("senha");
	String dt_compa = request.getParameter("dt_compa");
	
	ArrayList<Evento> eventos = Evento.eventos();
	
	int tamanho = eventos.size();
	
	if(tamanho==0){
		response.sendRedirect("../aluno/login.jsp");
	}
	
	Evento matri = null;
	
	for(Evento ev: eventos){
		if(ev.getNome().equals("Período de Matrícula")){
			matri = ev;
		}
		
	}
	
		if(matri!=null){
			Data dt = new Data();
			
			dt.setDataanalise(matri.getData_termino());
			
			String r2 = dt.comparativo();
					
			
			if(r2.equals("menor")){
				out.print("<script language='javascript'>location.href='../aluno'</script>");	
				if(true){return;}
			}
		
	
		}else{
			out.print("<script language='javascript'>location.href='../aluno'</script>");	
			if(true){return;}
		}
	
	
	if(nome==null || cpf_resp==null || cpf==null ||  rg==null || rg_resp==null || senha==null){
		out.print("<script language='javascript'>location.href='../aluno/index.jsp'</script>");	
	}else if(cpf.length()!=11){
		out.print("<script language='javascript'>alert('Digite um cpf válido! (11 dígitos)');location.href='../aluno/matricula.jsp'</script>");	
		
	}else if(cpf_resp.length()!=11){
		out.print("<script language='javascript'>alert('Digite um cpf válido para o responsável! (11 dígitos)');location.href='../aluno/matricula.jsp'</script>");	
		
	}else if(rg.length()!=9){
		out.print("<script language='javascript'>alert('Digite um RG válido! (9 dígitos)');location.href='../aluno/matricula.jsp'</script>");	
		
	}else if(rg_resp.length()!=9){
		out.print("<script language='javascript'>alert('Digite um RG válido para o responsável! (9 dígitos)');location.href='../aluno/matricula.jsp'</script>");	
		
	}else if(senha.length()>30){
		out.print("<script language='javascript'>alert('Digite uma senha válida! (até 30 dígitos)');location.href='../aluno/matricula.jsp'</script>");	
		
	}else{
		String res1 = Data.entre_datas(dt_compa, matri.getData_ini());
		String res2 = Data.entre_datas(dt_compa, matri.getData_termino());
		
		Data data = new Data();
		data.setDataanalise(matri.getData_ini());
		
		String data1 = data.diames();
		
		data.setDataanalise(matri.getData_termino());
		String data2 = data.diames();
		
		
		
		if(!((res1.equals("maior") || res1.equals("igual")) && (res2.equals("menor") || res2.equals("igual")))){
			
			out.print("<script language='javascript'>alert('A data de comparecimento deve estar entre "+data1+" e "+data2+"');location.href='../aluno/matricula.jsp'</script>");	
			if(true){return;}
			
		}
		
		Responsavel resp = new Responsavel(nome_resp,dt_nasc_resp,rg_resp,cpf_resp,sexo_resp,telcel);
		String res_resp = resp.cadastra_responsavel();
		
		if(res_resp.equals("") || res_resp.equals("sucesso")){
					
			Aluno aluno = new Aluno(nome,dt_nasc,rg,cpf,sexo,resp,dt_compa);
			
			String res_aluno = aluno.cadastra_aluno();
			
			if(res_aluno.equals("Cadastro realizado com sucesso!")){
				LoginAluno la = new LoginAluno(cpf,senha);
				
				String res_la = la.cadastra_usuario();
				
				if(res_la.equals("Cadastro realizado com sucesso!")){
					out.print("<script language='javascript'>alert('Cadastro realizado com sucesso!');location.href='../aluno/login.jsp'</script>");
				}else{
					out.print("<script language='javascript'>alert('"+res_la+"');location.href='../aluno/matricula.jsp'</script>");
				}
	
			}else{
				out.print("<script language='javascript'>alert('"+res_aluno+"');location.href='../aluno/matricula.jsp'</script>");
				
			}
			
			
			
			
		}else if(res_resp.equals("erro")){
			out.print("<script language='javascript'>alert('Algum campo relativo ao responsável foi preenchido de forma incorreta!');location.href='../aluno/matricula.jsp'</script>");
		}else{
			out.print("<script language='javascript'>alert('Informações falsas relativas ao responsável com este CPF!');location.href='../aluno/matricula.jsp'</script>");
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}

	







%>

</body>
</html>
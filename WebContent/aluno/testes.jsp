<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import='Models.Aluno' %>
<%@ page import="Models.Responsavel" %>
<%@ page import="Models.Turno"  %>
<%@ page import="Models.Avaliacao" %>
<%@ page import="Models.Treinador" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Models.Desempenho" %>
<%@ page import="Models.Dados_medicos" %>
<%@ page import="Validacoes.LoginAluno"  %>
<%@ page import="Validacoes.LoginFuncionario"  %>
<%@ page import="Validacoes.LoginTreinador"  %>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Página Inicial</title>
</head>
<body>

<table border=1 width=20>

<% 

	/*Responsavel responsa = new Responsavel("José","1970-12-21","123456789","01987654321","M",123456789);
	Aluno aluno = new Aluno("Eduardo","2000-11-14","123456789","01987654313","M",responsa);
	
	responsa.cadastra_responsavel();
	
	int resultAluno = aluno.cadastra_aluno();
	if(resultAluno==1){
	out.print("<script language='javascript'>alert('Cadastro realizado com sucesso!');</script>");
			
	}else{
		out.print("<script language='javascript'>alert('Cadastro já existetente!');</script>");
	}*/
	
	/*Avaliacao ava = new Avaliacao("Treino Final",10.0,"2020-09-24");
	
	String res = ava.defAvaliacao();
	
	out.print("<script language='javascript'>alert('"+res+"');</script>");*/
	
	
	

	/*ArrayList<Avaliacao> avas = Avaliacao.dadosAva("Treino Final");
	
	
	out.println("<tr><td>Id_ava</td><td>Nome_ava</td><td>Nota_max</td><td>Dt_Aplicacao</td></tr>");
	
	for(int i=0;i<avas.size();i++){
		out.println("<tr>");
		out.println("<td>"+avas.get(i).id+"</td>");
		out.println("<td>"+avas.get(i).getNome()+"</td>");
		out.println("<td>"+avas.get(i).getNota_max()+"</td>");
		out.println("<td>"+avas.get(i).getDt_aplicacao()+"</td>");
			
		out.println("</tr>");
		
			
		}*/
	
	
	
	/*Desempenho des = new Desempenho("01987654313",6,8.5);
	String res = des.defDesempenho();
	out.print("<script language='javascript'>alert('"+res+"');</script>");
	
	ArrayList<Desempenho> avas = Desempenho.avaliacoes_realizadas("01987654313");
	
	
	out.println("<tr><td>Cpf_aluno</td><td>Id_ava</td><td>Nota</td></tr>");
	
	for(int i=0;i<avas.size();i++){
		out.println("<tr>");
		out.println("<td>"+avas.get(i).getAluno()+"</td>");
		out.println("<td>"+avas.get(i).getAvaliacao()+"</td>");
		out.println("<td>"+avas.get(i).getNota()+"</td>");
		
			
		out.println("</tr>");
		
			
		}*/
	
	/* String resultado = Aluno.finaliza_cadastro("01987654313","12345678911", "noite", "2020-05-18");
	
	
	out.print("<script language='javascript'>alert('"+resultado+"');</script>");*/
	
	/*Aluno alu = Aluno.dadosAluno("01987654313");
	
	if(alu!=null){
		out.println("<tr>");
		out.println("<td>"+alu.getCpf()+"</td>");
		out.println("<td>"+alu.getNome()+"</td>");
		out.println("<td>"+alu.getRg()+"</td>");
		out.println("<td>"+alu.getDt_matricula()+"</td>");
		out.println("<td>"+alu.getDt_nasc()+"</td>");
		out.println("<td>"+alu.getSexo()+"</td>");
		out.println("<td>"+alu.getResponsavel().getNome()+"</td>");
		out.println("<td>"+alu.getTreinador().getNome()+"</td>");
		out.println("<td>"+alu.getTurno().getTurno()+"</td>");
			
		out.println("</tr>");
		
		
	}*/
	
	
	/* Dados_medicos dc =  new Dados_medicos("01987654313",1.80,65.0,"O+","muitas","poucas","não");
	String res = dc.setDados_medicos();
	
	
	out.print("<script language='javascript'>alert('"+res+"');</script>");*/
	
	/* out.println("<tr><td>Aluno(cpf)</td><td>altura</td><td>peso</td><td>tipo sanguíneo</td><td>doenças crônicas</td><td>alergias</td><td>medicamentos</td></tr>");
	
	Dados_medicos dados = Dados_medicos.getDados_medicos("01987654313");
	
	if(dados!=null){		
		out.println("<tr>");
		out.println("<td>"+dados.getAluno()+"</td>");
		out.println("<td>"+dados.getAltura()+"</td>");
		out.println("<td>"+dados.getPeso()+"</td>");
		out.println("<td>"+dados.getTipo_sanguineo()+"</td>");
		out.println("<td>"+dados.getDoencas_cronicas()+"</td>");
		out.println("<td>"+dados.getAlergias()+"</td>");
		out.println("<td>"+dados.getMedicamentos()+"</td>");
		out.println("</tr>");
		
	}*/
		
	
	/* Responsavel responsa = new Responsavel("José","1970-12-21","123456789","01987654321","M",123456789);
	Aluno aluno = new Aluno("Jaime","2000-11-14","123456789","01987654310","M",responsa);
	
	responsa.cadastra_responsavel();
	
	String resultAluno = aluno.cadastra_aluno();
	if(resultAluno.equals("Cadastro realizado com sucesso!")){
		LoginAluno cadastro = new LoginAluno(aluno.getCpf(),"1234");
		String res = cadastro.cadastra_usuario();
		out.print("<script language='javascript'>alert('"+res+"');</script>");
			
	}else{
		out.print("<script language='javascript'>alert('"+resultAluno+"');</script>");
	}*/
	
	
	/* Treinador treina = new Treinador("Ramelão","1982-05-19","123456789","22927154310","M");
	
	String resultTreina = treina.cadastra_treinador();
	if(resultTreina.equals("Cadastro realizado com sucesso!")){
		LoginTreinador cadastro = new LoginTreinador(treina.getCpf(),"123");
		String res = cadastro.cadastra_usuario();
		out.print("<script language='javascript'>alert('"+res+"');</script>");
			
	}else{
		out.print("<script language='javascript'>alert('"+resultTreina+"');</script>");
	} */
	
	
	
	/*LoginFuncionario func = new LoginFuncionario("12345678911","olaporra");
	
	String resultFunc = func.cadastra_usuario();
	
	
	if(resultFunc.equals("Cadastro realizado com sucesso!")){
		//redireciona para a página de cadastro novamente
		out.print("<script language='javascript'>alert('"+resultFunc+"');</script>");
		
	}else{
		//redireciona para a página inicial
		out.print("<script language='javascript'>alert('Cadastro já existente!');</script>");
		
	} */
	
	
	/*ArrayList<Aluno> alunos = Aluno.alunos();
	
	int tamanho = alunos.size();
	if(tamanho!=0){
		for(Aluno alu: alunos){
			out.println("<tr>");
			out.println("<td>"+alu.getCpf()+"</td>");
			out.println("<td>"+alu.getNome()+"</td>");
			out.println("<td>"+alu.getRg()+"</td>");
			out.println("<td>"+alu.getDt_matricula()+"</td>");
			out.println("<td>"+alu.getDt_nasc()+"</td>");
			out.println("<td>"+alu.getSexo()+"</td>");
			out.println("<td>"+alu.getResponsavel().getNome()+"</td>");
			out.println("<td>"+alu.getTreinador().getNome()+"</td>");
			out.println("<td>"+alu.getTurno().getTurno()+"</td>");
				
			out.println("</tr>");
		}
		
	}	*/
	
	/*String res = Aluno.deleta_aluno("11111111111");
	
	out.print("<script language='javascript'>alert('"+res+"');</script>");*/
	
	

%>


</table>




</body>
</html>
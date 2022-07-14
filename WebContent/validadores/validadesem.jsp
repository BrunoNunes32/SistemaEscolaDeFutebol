<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Desempenho" import="Models.Avaliacao" import="Models.Aluno"%>
    
    
    
<%
	String sessao = (String) session.getAttribute("treinador");
	if(sessao==null){
		response.sendRedirect("../treinador/login.jsp");
	}


%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>adicionando avalia��o</title>
</head>
<body>
<% 

String treinador = sessao;

String aluno = request.getParameter("aluno");

try{
	if(aluno==null || Aluno.dadosAluno(aluno)==null || Aluno.dadosAluno(aluno).getTreinador()==null || !Aluno.dadosAluno(aluno).getTreinador().getCpf().equals(sessao)){
		out.print("<script language='javascript'>location.href = '../treinador/turma.jsp'; </script>");
		if(true){return;}
	}else{
		
		double nota = Double.valueOf(request.getParameter("nota")).doubleValue();
		int id = Integer.parseInt(request.getParameter("id"));
		
		Avaliacao ava = Avaliacao.getAva(id, sessao);
		
		if(ava==null){
			out.print("<script language='javascript'>alert('Avalia��o inexistente');  ;location.href = '../treinador/turma.jsp'; </script>");
			if(true){return;}
			
		}else if(nota<0 || nota>ava.getNota_max()){
			out.print("<script language='javascript'>alert('Digite uma nota v�lida para tal avalia��o!');window.location.href = '../treinador/novodesempenho.jsp?aluno="+aluno+"';</script>");
		}else{
		
			
		 Desempenho des = new Desempenho(aluno,Avaliacao.getAva(id, sessao),nota);
		 String res = des.defDesempenho();
		
		 if(res.equals("Aluno avaliado com sucesso!")){
			 out.print("<script language='javascript'>alert('"+res+"');window.location.href = '../treinador/desempenho.jsp?aluno="+aluno+"';</script>");
		 }else if(res.equals("O aluno especificado j� realizou tal teste avaliativo!")){
			 out.print("<script language='javascript'>alert('"+res+"');window.location.href = '../treinador/novodesempenho.jsp?aluno="+aluno+"';</script>");
		 }else{
			 
			out.print("<script language='javascript'>alert('"+res+"');window.location.href = '../treinador/novodesempenho.jsp?aluno="+aluno+"';</script>");
		 }
		
		}
	
	}
	
}catch(Exception e){
	out.print("<script language='javascript'>alert('Voc� n�o digitou uma nota num�rica ou n�o escolheu uma avalia��o (ou porque n�o existem avalia��es ou porque voc� tentou avaliar antes do dia da aplica��o!)');window.location.href = '../treinador/novodesempenho.jsp?aluno"+aluno+"';</script>");
}







%>

</body>
</html>
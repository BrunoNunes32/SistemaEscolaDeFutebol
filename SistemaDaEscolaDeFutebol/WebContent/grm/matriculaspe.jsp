<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import='java.util.ArrayList'  import="Models.Aluno" import="Validacoes.Data" import="Models.Evento" import="java.util.Date"%>
    

<%	
	String sessao = (String) session.getAttribute("grm");
	
	if(sessao==null){
		response.sendRedirect("login.jsp");
	}
	
%>    
    
    
    
    
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<title>Matrículas Pendentes</title>
	<meta charset=utf-8>
	<meta name=description content="">
	<meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <title>soccer club</title>
    <link rel="shortcut icon" href=favicon.ico>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script>

</head>

<body>

<h4><a href='alunos.jsp' style='margin-left:20px;'><- Voltar</a></h4>

<div style="margin-top:150px;text-align:center;margin-left:5px;">
			        
			   
			       	<% 
			       		Data data = new Data();
			       		
			       	
			       	
			       		ArrayList<Evento> eventos = Evento.eventos();	
			       		
			       		Evento matri = null;
			       		
			       		for(Evento ev: eventos){
			       			if(ev.getNome().equals("Período de Matrícula")){
			       				matri = ev;
			       			}
			       			
			       		}
			       		
			       		if(matri==null){
			       			out.print("<h4 style='margin-top:-80px;'>Período de matrículas ainda não foi definido</h4>");
			       			if(true){return;}
			       		}
			       	
			       	
			       	ArrayList<Aluno> alunos = Aluno.matriculas_pe();
			       	
			       	int tamanho = alunos.size();
			       	
			       	if(tamanho==0){
			       		out.print("<h4 style='margin-top:-80px;'>Não há mátriculas pendentes</h4>");
			       	}else{
			       		out.print("<h4 style='margin-top:-80px;'>Matrículas Pendentes</h4>");
			       		
				       	for(Aluno alu: alunos){
				       		
				       		out.print("<table class='table-bordered' style='height:60px;margin-top:20px;margin-bottom:100px;'>"+
							        "<tr style='border: 2px black solid'><td style='width:200px;'><strong>Cpf</strong></td><td style='width:545px'><strong>Nome</strong></td>"+
							        "<td style='width:165px'><strong>Matri.presencial</strong></td><td style='width:105px'><strong>Dt.nasc</strong></td><td style='width:125px'><strong>Sexo</strong></td>"+
							        "<td style='width:215px'><strong>Fin.matricula</strong></td></tr>"
							        );
				       		
				       		String cpf = alu.getCpf();
				       		String nome = alu.getNome();
				       		String dt_matri = alu.getDt_matricula();
				       		String dt_nasc = alu.getDt_nasc();
				       		String sexo = alu.getSexo();
				       		
				       		
	
				       		
				       		out.print("<tr>");
				       		out.print("<td>"+cpf+"</td>");
				       		out.print("<td>"+nome+"</td>");
				       		out.print("<td>"+dt_matri+"</td>");
				       		out.print("<td>"+dt_nasc+"</td>");
				       		out.print("<td>"+sexo+"</td>");
				       		out.print("<td><a href='finalimatri.jsp?aluno="+cpf+"'>Ir &raquo;</td>");
				       	
				       		out.print("</tr>");   
				       		
				       		out.print("</table>");
				       	}
				       	
				       
			       	
			       	}
			       	
			       	%>
			        
			        
			       
        
</div>

</body>
</html>
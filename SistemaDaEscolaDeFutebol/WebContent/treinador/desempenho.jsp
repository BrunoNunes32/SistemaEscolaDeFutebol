<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Aluno" import="Models.Desempenho" import="java.util.ArrayList" import="Models.Treinador"%>
    
 <%
 
 	String sessao = (String) session.getAttribute("treinador");
 	String aluno = request.getParameter("aluno");
 	
 	Aluno alu = Aluno.dadosAluno(aluno);
 	
 	
 	
 	if(sessao==null){
 		response.sendRedirect("login.jsp");
 	}else if(alu==null || alu.getTreinador()==null || !alu.getTreinador().getCpf().equals(sessao)){
 		response.sendRedirect("turma.jsp");
 	}
 	
Treinador tr = Treinador.getTreina(sessao);
	
	if(tr==null){  	
  			out.println("<script language='javascript'>location.href='../validadores/logouttreinador.jsp'  </script>");
  			if(true){return;}
	}
 	
 	
 %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Desempenho </title>
<meta charset=utf-8>
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>soccer club</title>
    <link rel="shortcut icon" href=favicon.ico>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script>
    
</head>
<body>

<h4><a href='turma.jsp' style='margin-left:20px;'><- Voltar</a></h4>


<div class="wrapper" style="margin-left:250px;">

<section>
<%
	

	ArrayList<Desempenho> desps = Desempenho.avaliacoes_realizadas(aluno);
	
	int tamanho = desps.size();

	if(tamanho==0){
		out.print("<h4 style='margin-left:200px;'>Aluno não realizou nenhuma avaliação</h4><br/><br/>");
	}else{
		
		
		for(int i=0;i<tamanho;i++){
			out.print("<table class='table-bordered' style='text-align:center;'>" );
			out.print("<tr><td colspan='2'><h4 style='font-size:45px;width:800px;'>"+desps.get(i).getAvaliacao().id+" - "+desps.get(i).getAvaliacao().getNome()+"</h4></td></tr>");
			out.print("<tr><td><strong style='font-size:20px;'>Nota do Aluno</strong></td><td><i style='font-size:25px;'>"+desps.get(i).getNota()+"</i></td></tr>");
			out.print("<tr><td><strong style='font-size:20px;'>Nota Máxima</strong></td><td><i style='font-size:25px;'>"+desps.get(i).getAvaliacao().getNota_max()+"</i></td></tr>");
			out.print("<tr><td><strong style='font-size:20px;'>Data de Aplicação</strong></td><td><i style='font-size:25px;'>"+desps.get(i).getAvaliacao().getDt_aplicacao()+"</i></td></tr>");
			out.print("</table><br/><br/><br/>");
			
			
			
		}	
		
	}
	

	out.print("<a class= 'btn' style='margin-left:200px;' href='novodesempenho.jsp?aluno="+aluno+"'>Adicionar nova avaliação</a>");




%>

</section>
</div>






</body>
</html>
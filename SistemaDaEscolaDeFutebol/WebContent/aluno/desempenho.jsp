<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="Models.Aluno" import="Models.Desempenho" import="java.util.ArrayList"   %>
    
    
    
<%
 
 	String sessao = (String) session.getAttribute("aluno");
 	
 	
 	Aluno alu = Aluno.dadosAluno(sessao);
 	
 	
 	
 	if(sessao==null || alu==null || alu.getTreinador()==null){
 		response.sendRedirect("login.jsp");
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

<h4><a href='login.jsp' style='margin-left:20px;'><- Voltar</a></h4>


<div class="wrapper" style="margin-left:250px;">

<section>
<%
	

	ArrayList<Desempenho> desps = Desempenho.avaliacoes_realizadas(sessao);
	
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
	





%>

</section>
</div>






</body>
</html>
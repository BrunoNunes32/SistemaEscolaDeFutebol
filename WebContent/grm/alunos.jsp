<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Aluno" import="java.util.ArrayList"%>
    
  
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
	<title>Alunos</title>
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

<!--[if lt IE 10]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
    <div class=wrapper>
        <header class=header-main>
            <div class=header-upper>
                <div class=container>
                    <div class=row>
                        <!-- <ul>
                            <li><a href="#">Área do Aluno</a></li>
                        </ul> -->
                    </div>
                </div>
            </div>
            <div class="header-lower clearfix">
                <div class=container>
                    <div class=row>
                        <h1 class=logo><a href=index.jsp><img src=images/logo.png alt=image></a></h1>

                        <div class=menubar>
                            <nav class=navbar>
                                <div class=nav-wrapper>
                                    <div class=navbar-header>
                                        <button type=button class=navbar-toggle><span class=sr-only>Toggle
                                                navigation</span>
                                            <span class=icon-bar></span></button>
                                    </div>
                                    <div class=nav-menu>
                                        <ul class="nav navbar-nav menu-bar">
                                            <li><a href=index.jsp>Home <span></span> <span></span>
                                                    <span></span> <span></span></a></li>
                                  
                                            <li><a href=alunos.jsp class=active>Alunos<span></span> <span></span>
                                                    <span></span>
                                                    <span></span></a></li>
                                            <li><a href=treinadores.jsp>Treinadores <span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                            <li><a href=turnos.jsp>Turnos <span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                            <li><a href=eventos.jsp>Eventos <span></span> <span></span> <span></span>
                                                    <span></span></a></li>        
                                             
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </div>
                        <div class=social><a href=https://www.facebook.com/templatespoint.net class=facebook
                                target=_blank><i class="fa fa-facebook"></i></a> <a href=https://twitter.com/itobuztech
                                class=twitter target=_blank><i class="fa fa-twitter"></i></a> <a
                                href=https://www.instagram.com class=instagram target=_blank><i
                                    class="fa fa-instagram"></i></a></div>
                          
                                   
                    </div>
                    			
                 
                    
                </div>
            </div>
            
        </header>

      
      <div style="margin-top:150px;text-align:center;margin-left:16px;">
			        
			   
			       	<% 
			       	
			       	ArrayList<Aluno> alunos = Aluno.alunos();
			       	
			       	int tamanho = alunos.size();
			       	
			       	if(tamanho==0){
			       		out.print("<h4>Não há alunos matriculados</h4>");
			       	}else{
			       		out.print("<h4>Alunos Matriculados</h4>");
			       		out.print("<table class='table-bordered' style='height:220px;margin-top:20px;'>"+
						        "<tr style='border: 2px black solid'><td style='width:200px;'><strong>Cpf</strong></td><td style='width:545px'><strong>Nome</strong></td>"+
						        "<td style='width:165px'><strong>Dt.nasc</strong></td><td style='width:55px'><strong>Sexo</strong></td><td style='width:155px'><strong>Outras infos</strong></td>"+
						        "<td style='width:215px'><strong>RG</strong></td></tr>"
						        );
				       	for(Aluno alu: alunos){
				       		
				       		String cpf = alu.getCpf();
				       		String nome = alu.getNome();
				       		String dt_nasc = alu.getDt_nasc();
				       		String sexo = alu.getSexo();
				       		String rg = alu.getRg();
				       		
	
				       		
				       		out.print("<tr>");
				       		out.print("<td>"+cpf+"</td>");
				       		out.print("<td>"+nome+"</td>");
				       		out.print("<td>"+dt_nasc+"</td>");
				       		out.print("<td>"+sexo+"</td>");
				       		out.print("<td><a href='alteraraluno.jsp?aluno="+cpf+"'>Ver &raquo;</td>");
				       		out.print("<td>"+rg+"</td>");
				       		out.print("</tr>");   		
				       	}
				       	
				       	out.print("</table>");
			       	
			       	}
			       	
			       	%>
			        
			        <a style='margin-top:50px;margin-left:-100px;font-size:15px;padding:10px 35px;position:absolute' class='btn' href='matriculaspe.jsp'>Matrículas Pendentes</a>
			       
        
        		</div>
       
      
      
      
      
      
      
      
      
      
      
      
      
      
      
       
</div>
</body>
</html>
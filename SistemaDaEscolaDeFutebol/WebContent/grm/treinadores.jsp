<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Treinador" import="java.util.ArrayList"%>
    
    
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
	<title>Treinadores</title>
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
                                  
                                            <li><a href=alunos.jsp>Alunos<span></span> <span></span>
                                                    <span></span>
                                                    <span></span></a></li>
                                            <li><a href=treinadores.jsp class=active>Treinadores <span></span> <span></span> <span></span>
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
			       	
			       	ArrayList<Treinador> treinadores = Treinador.treinadores();
			       	
			       	int tamanho = treinadores.size();
			       	
			       	if(tamanho==0){
			       		out.print("<h4>Não há treinadores cadastrados</h4>");
			       	}else{
			       		out.print("<h4>Treinadores Cadastrados</h4>");
			       		out.print("<table class='table-bordered' style='height:120px;margin-top:20px;margin-left:60px;'>"+
						        "<tr style='border: 2px black solid'><td style='width:200px;'><strong>Cpf</strong></td><td style='width:545px'><strong>Nome</strong></td>"+
						        "<td style='width:165px'><strong>Dt.nasc</strong></td><td style='width:55px'><strong>Sexo</strong></td>"+
						        "<td style='width:215px'><strong>Outras infos</strong></td></tr>"
						        );
				       	for(Treinador treina: treinadores){
				       		
				       		String cpf = treina.getCpf();
				       		String nome = treina.getNome();
				       		String dt_nasc = treina.getDt_nasc();
				       		String sexo = treina.getSexo();
				       		
	
				       		
				       		out.print("<tr>");
				       		out.print("<td>"+cpf+"</td>");
				       		out.print("<td>"+nome+"</td>");
				       		out.print("<td>"+dt_nasc+"</td>");
				       		out.print("<td>"+sexo+"</td>");
				       		out.print("<td><a href='alterartreinador.jsp?treinador="+cpf+"'>Ver &raquo;</td>");
				       		out.print("</tr>");   		
				       	}
				       	
				       	out.print("</table>");
			       	
			       	}
			       	
			       	%>
			        
			        <a style='margin-top:50px;margin-left:-100px;font-size:15px;padding:10px 35px;position:absolute' class='btn' href='novotreinador.jsp'>Novo Treinador</a>
			       
        
        		</div>

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
       
</div>
</body>
</html>
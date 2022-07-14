<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "Models.Avaliacao" import="java.util.ArrayList" import="Models.Treinador"%>    
 
   
 <% 
	String sessao = (String) session.getAttribute("treinador");
	if(sessao==null){
		response.sendRedirect("login.jsp");
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
	<title>Página Inicial</title>
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
                                  
                                            <li><a href=turma.jsp >Minha Turma<span></span> <span></span>
                                                    <span></span>
                                                    <span></span></a></li>
                                            <li><a href=avaliacoes.jsp class=active >Avaliações <span></span> <span></span> <span></span>
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
        
        <div style="margin-top:150px;text-align:center;margin-left:280px;">
        	
			        <% 
			        	ArrayList<Avaliacao> avas = Avaliacao.dadosAva(sessao); 
			        	int tamanho = avas.size();
			        	if(tamanho==0){
			        		
			        		out.print("<h4 style='margin-left:-250px;'>Não existe avaliações cadastradas</h4>");
			        		
			        		
			        		
			        		
			        	}else{
			        		out.print("<table class='table-bordered' style='height:220px;'>"+
			        			"<tr style='border: 2px black solid'><td style='width:105px;'><strong>Id</strong></td><td style='width:405px'><strong>Nome</strong></td>"+
			    			    "<td style='width:165px'><strong>Nota máxima</strong></td><td style='width:155px'><strong>Data de aplicação</strong></td></tr>"
			        		);
			        		
			        		for(Avaliacao ava: avas){
			        			int id = ava.id;
					       		String  nome = ava.getNome();
					       		String dt_aplicacao = ava.getDt_aplicacao();
					       		double nota = ava.getNota_max();
					       		
					       		
					       		out.print("<tr>");
					       		out.print("<td>"+id+"</td>");
					       		out.print("<td>"+nome+"</td>");
					       		out.print("<td>"+nota+"</td>");
					       		out.print("<td>"+dt_aplicacao+"</td>");
					       		out.print("</tr>");
					       				
			        		}
			        		out.print("</table>");
			        		
			        		
			        		
			        	}
			        
			        	out.print("<br/><br/>");
		        		out.print("<a href='novaava.jsp' class='btn' style='margin-left:-250px;'>Adicionar nova avaliação</a>");
			        
			        %>
			              	
         
         </div>
      </div>
        
        
        
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="Models.Turno" import="java.util.ArrayList" %>
    

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
	<title>Turnos</title>
	<meta name=description content="">
	<meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
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
                                            <li><a href=treinadores.jsp>Treinadores <span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                            <li><a href=turnos.jsp class=active >Turnos <span></span> <span></span> <span></span>
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
			       	
			       	ArrayList<Turno> turnos = Turno.turnos();
			       	
			       	int tamanho = turnos.size();
			       	
			       	if(tamanho==0){
			       		out.print("<h4>Não há turnos cadastrados</h4>");
			       	}else{
			       		out.print("<h4>Turnos Estabelecidos</h4>");
			       		out.print("<table class='table-bordered' style='height:120px;margin-top:20px;margin-left:290px;'>"+
						        "<tr style='border: 2px black solid'><td style='width:200px;'><strong>Turno</strong></td><td style='width:165px'><strong>Horário de início</strong></td>"+
						        "<td style='width:165px'><strong>Horário de término</strong></td><td style='width:55px'><strong>Quantidade de alunos</strong></td>"+
						        "<td style='width:125px'><strong>Alterar</strong></td></tr>"
						        );
				       	for(Turno tur: turnos){
				       		
				       		String turno = tur.getTurno();
				       		String horini = tur.getInicio_aulas();
				       		String horfim = tur.getFim_aulas();
				       		int qtd_alunos = tur.getQtd_alunos();
				       		
	
				       		
				       		out.print("<tr>");
				       		out.print("<td>"+turno+"</td>");
				       		out.print("<td>"+horini+"</td>");
				       		out.print("<td>"+horfim+"</td>");
				       		out.print("<td>"+qtd_alunos+"</td>");
				       		out.print("<td><a href='alterarturno.jsp?turno="+turno+"'>Ir &raquo;</td>");
				       		out.print("</tr>");   		
				       	}
				       	
				       	out.print("</table>");
			       	
			       	}
			       	
			       	%>
			        
			        <a style='margin-top:50px;margin-left:-100px;font-size:15px;padding:10px 35px;position:absolute' class='btn' href='novoturno.jsp'>Novo Turno</a>
			       
        
        		</div>
        

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
       
</div>
</body>
</html>
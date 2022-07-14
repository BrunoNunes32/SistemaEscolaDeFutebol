<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.ArrayList" import="Models.Evento" %>
 
 
<%
String sessao = (String) session.getAttribute("grm");

if(sessao==null){
	response.sendRedirect("login.jsp");
}

%> 
    
    
    
<!DOCTYPE html>
<html lang='pt-br'>
<head>
	<title>Eventos</title>
	<meta charset=utf-8>
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
                                            <li><a href=turnos.jsp>Turnos <span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                            <li><a href=eventos.jsp class=active >Eventos <span></span> <span></span> <span></span>
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
        
        <% 
        	ArrayList<Evento> eventos = Evento.eventos();
        
        	int tamanho = eventos.size();
        	
        	if(tamanho!=0){
        		
        		out.print("<div style='margin-top:150px;text-align:center;margin-left:16px;'>");
        		out.print("<h4>Eventos da escola</h4>");
	       		out.print("<table class='table-bordered' style='height:120px;margin-top:20px;margin-left:60px;'>"+
				        "<tr style='border: 2px black solid'><td style='width:545px;'><strong>Nome</strong></td><td style='width:200px'><strong>Turno</strong></td>"+
				        "<td style='width:165px'><strong>Data de início</strong></td><td style='width:165px'><strong>Data de término</strong></td>"+
				        "<td style='width:65px'><strong>Alterar</strong></td></tr>"
				        );
		       	for(Evento eve: eventos){
		       		
		       		int id = eve.getId();
		       		String nome = eve.getNome();
		       		String turno = eve.getTurno();
		       		String data_ini = eve.getData_ini();
		       		String data_termino = eve.getData_termino();
		       		
		       		if(turno==null){
		       			turno = "--//--";
		       		}
		       		
		       		if(data_termino==null){
		       			data_termino = "--//--";
		       		}
		       		

		       		
		       		out.print("<tr>");
		       		out.print("<td>"+nome+"</td>");
		       		out.print("<td>"+turno+"</td>");
		       		out.print("<td>"+data_ini+"</td>");
		       		out.print("<td>"+data_termino+"</td>");
		       		out.print("<td><a href='alterarevento.jsp?evento="+id+"'>Ir &raquo;</td>");
		       		out.print("</tr>");   		
		       	}
		       	
		       	out.print("</table>");
        		
		       	
		       	out.print("<a style='margin-top:50px;margin-left:-100px;font-size:15px;padding:10px 35px;position:absolute' class='btn' href='novoevento.jsp'>Novo Evento</a>");
		       	
        		out.print("</div>");
        		
        		if(true){return;}        		
        	}
          
        %>
        
        <section class="register_wrapper clearfix" style="margin-top:-50px;">
            <div class=container>
                <div class=row>
                    <div class=register_form >
				                           <h2 style='margin-left:100px;' class=heading>Defina o período de matrícula</h2>

				                            <form action = '../validadores/grm/validaevento.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                               
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for=''>Início do período de matrícula</label></div> 
				                                 
				                               <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='inicio' placeholder=''
				                                        required='' data-parsley-required-message='Informe a data de início'></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for=''>Término do período de matrícula</label></div> 
				                                 
				                               <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='fim' placeholder=''
				                                        required='' data-parsley-required-message='Informe a data de Término'></div>
				                                        
				                            
				                                <div class=form-group><input type=hidden class='form-control' name='matricula' value='bamerindus' placeholder=''
				                                        required='' data-parsley-required-message=''></div>
				                                        
				                                <div class=form-group style='margin-left:100px;'>
				                                    <button type=submit class='btn btn-red' id=send>Definir</button>
				                                </div>
				                                
				                            </form>
				                        
           
                    </div>
                </div>
            </div>


        </section>
        
        
        
        
        
        
        
        

            
       
</div>
</body>
</html>
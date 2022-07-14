<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
                                            <li><a href=index.jsp class=active>Home <span></span> <span></span>
                                                    <span></span> <span></span></a></li>
                                  
                                            <li><a href=alunos.jsp>Alunos<span></span> <span></span>
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
                         <a style='margin-top:130px;margin-left:-20px;font-size:15px;padding:10px 35px;position:absolute' class='btn' href='../validadores/logoutgrm.jsp'>Sair</a>
                                   
                    </div>
                    			
                 
                    
                </div>
            </div>
            
           
            
        </header>
       
</div>



<h4 style='margin-left:500px;margin-top:200px;margin-bottom:50px;font-size:40px;'>Seja bem vindo,<%out.print(sessao); %></h4>

<p style='width:500px;margin-left:500px;;font-style: italic;'>
Você está na área gerencial do site Chute Certo,portanto detém o controle sobre todos os dados da organização!
</p>

<a style='margin-top:80px;margin-left:620px;font-size:15px;padding:10px 35px;position:absolute;background:red;'
 class='btn btn-red' href='../validadores/grm/excluirgrm.jsp'>Excluir Perfil</a>


















</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!doctype html>
<html class=no-js lang="">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<head>
    <meta charset=utf-8>
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>soccer club</title>
    <link rel="shortcut icon" href=favicon.ico>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script> </head>
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
                            <li><a href="#">�rea do Aluno</a></li>
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
                                            <li><a href=sobre.jsp>Sobre n�s <span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                            <li><a href=galeria.jsp>Galeria <span></span> <span></span> <span></span>
                                                    <span></span></a>
                                            </li>
                                             <%
                                        
                                        	String sessao = (String) session.getAttribute("aluno");
                                        	
                                        	if(sessao==null){ 
                                        	
                                        	out.print("<li><a href='matricula.jsp'>Matr�cula <span></span> <span></span> <span></span>"+
                                        	"<span></span></a></li>");
                                        	}
                                        	
                                        	%>
                                            <li><a href=treinamento.jsp class=active>Treinamento <span></span>
                                                    <span></span>
                                                    <span></span>
                                                    <span></span></a></li>
                                            <li><a href=contato.jsp>Contato<span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                            <li><a href=login.jsp class="popup-login">�rea do Aluno<span></span>
                                                    <span></span> <span></span>
                                                    <span></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </div>
                        <div class=social><a href=https://www.facebook.com/templatespoint.net class=facebook
                                target=_blank><i class="fa fa-facebook"></i></a> <a href=https://twitter.com/itobuztech
                                class=twitter target=_blank><i class="fa fa-twitter"></i></a> <a
                                href=https://www.instagram.com/ class=instagram target=_blank><i
                                    class="fa fa-instagram"></i></a></div>
                    </div>
                </div>
            </div>
        </header>


        <div class=innerbannerwrap>
            <div class=content></div>
            <div class=innerbanner>
                <h2 class=bannerHeadline>Treinamento<span></span></h2>
            </div>
        </div>
        <section class=innerpage_all_wrap>
            <div class=container>
                <div class=row>
                    <h2 class="heading small"><span>Treinamentos T�ticos:</span></h2>
                    <p class="headParagraph">1. T�cnica Individual</p>
                    <p class="headParagraph">2. T�cnica Ofensiva</p>
                    <p class="headParagraph">3. T�cnica Defensiva</p><br>
                    <p class="headParagraph">Os alunos da escola de futebol Chute Certo est�o em contato di�rio com o
                        ensino dos fundamentos do futebol. Esses
                        fundamentos s�o transmitidos de maneira pr�tica atrav�s de li��es especificas para cada tipo de
                        lance.</p><br>
                    <p class="headParagraph">1. Condu��o </p>
                    <p class="headParagraph">2. Passe</p>
                    <p class="headParagraph">3. Recep��o</p>
                    <p class="headParagraph">4. Chute</p>
                    <p class="headParagraph">5. Cabeceio</p>
                    <p class="headParagraph">6. Saque Lateral</p>
                    <p class="headParagraph">7. Goleiros</p><br>
                    <p class="headParagraph">As li��es s�o passadas de forma did�ticas. No primeiro est�gio os alunos
                        aprendem para que serve cada movimento, assim
                        como seus pontos fortes e pontos fracos e suas varia��es. O pr�ximo passo � a execu��o, onde os
                        alunos ter�o o primeiro contato pr�tico com
                        o movimento. Logo depois parte-se para os exerc�cios de aprimoramento desta t�cnica e mais �
                        frente � trabalhada a evolu��o atrav�s de
                        situa��es mais complexas.</p>
                </div>
        </section>
        <footer>
            <div class=footer-type02>
                <div class=container>
                    <div class=row><a href=index.jsp class=footer-logo><img src=images/logo.png alt=image></a>

                        <div class=footer-container>
                            <ul class=clearfix>
                                <li><a href=https://www.facebook.com/TEMPLATESPOINT.NET class=bigsocial-link><i
                                            class="fa fa-facebook"></i></a></li>
                                <li><a href=https://twitter.com/ class=bigsocial-link target=_blank><i
                                            class="fa fa-twitter"></i></a></li>
                                <li><a href=https://www.instagram.com/ class=bigsocial-link target=_blank><i
                                            class="fa fa-instagram"></i></a></li>
                            </ul>
                            <div class=footer-appstore>

                            </div>
                        </div>
                    </div>
                </div>
        </footer>
    </div>
    <script src=js/vendor/vendor.js> </script> <script src=js/main.js> </script> </body> </html>
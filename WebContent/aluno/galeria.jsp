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
                                            <li><a href=sobre.jsp>Sobre nós <span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                            <li><a href=galeria.jsp class=active>Galeria <span></span> <span></span>
                                                    <span></span>
                                                    <span></span></a>
                                            </li>
                                             <%
                                        
                                        	String sessao = (String) session.getAttribute("aluno");
                                        	
                                        	if(sessao==null){ 
                                        	
                                        	out.print("<li><a href='matricula.jsp'>Matrícula <span></span> <span></span> <span></span>"+
                                        	"<span></span></a></li>");
                                        	}
                                        	
                                        %>
                                            <li><a href=treinamento.jsp>Treinamento <span></span> <span></span>
                                                    <span></span>
                                                    <span></span></a></li>
                                            <li><a href=contato.jsp>Contato <span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                            <li><a href=login.jsp class="popup-login">Área do Aluno<span></span>
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
                <h2 class=bannerHeadline>Galeria<span></span></h2>
            </div>
        </div>
        <section class=innerpage_all_wrap>
            <div class=container>
                <div class=row>
                    <div class=galleryPage>
                        <div class="galleryListwrap clearfix">
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria1.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria2.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                        </div>
                        <div class="galleryListwrap clearfix">
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria3.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria4.jpg)> < />
                                <div class="gallery-info gallery-info01">
                                    tur maiores facere cumque.</p>
                                </div>
                            </div>
                        </div>
                        <div class="galleryListwrap clearfix">
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria5.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria6.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                        </div>
                        <div class="galleryListwrap clearfix">
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria7.png)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria8.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                        </div>
                        <div class="galleryListwrap clearfix">
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria9.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria10.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                        </div>
                        <div class="galleryListwrap clearfix">
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria11.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria12.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                        </div>
                        <div class="galleryListwrap clearfix">
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria13.1.jpeg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                            <div class=gallery-list>
                                <div class=image_g style=background:url(images/gallery/galeria13.2.jpg)> </div> <div
                                    class="gallery-info gallery-info01">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div class=footer-type02>
                <div class=container>
                    <div class=row><a href=index.jsp class=footer-logo><img src=images/logo.png alt=image></a>

                        <div class=footer-container>
                            <ul class=clearfix>
                                <li><a href=https://www.facebook.com/templatespoint.net class=bigsocial-link><i
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
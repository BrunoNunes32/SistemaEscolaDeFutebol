<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
<!doctype html>
<html class=no-js lang="">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<head>
    <meta charset=utf-8>
    <meta name=description content="">
    <meta name="viewport"
        content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
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
                        <h1 class=logo><a href=index.jsp><img src='images/logo.png' alt=image></a></h1>

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
                                            <li><a href=sobre.jsp>Sobre nós <span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                            <li><a href=galeria.jsp>Galeria <span></span> <span></span> <span></span>
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
        <div class=banner id=layerSlider style="width: 100%;">
            <div class=ls-slide data-ls="transition3d: 33,15; slidedelay: 8000 ; durationin:0;">
                <img src=images/banner/bg2.jpg class=ls-bg alt="Slide background">

                <h2 class="ls-l bannertext layercontent03" data-ls="offsetxin:left; rotatexin:90 ; durationin: 3500;">
                    Escola de</h2>

                <h2 class="ls-l bannertext01 italic01 layercontent04"
                    data-ls="offsetxin:left; scalexin:9; durationin: 4000;">Futebol</h2>
                <h4 class="ls-l bannertext02 layercontent05" data-ls="offsetxin:left; rotatexin:90 ; durationin: 4500;">
                    Matricule-se</h4>
            </div>
        </div>
        <section class="booking bg-smallwhite">
            <div class=container>
                <div class=booking-fig>
                    <h2>Escola de Futebol</h2>
                </div>
                <div class=booking-content><a href="sobre.jsp" class="btn btn-white">Sobre Nós</a>
                		
                		<%   
                			if(sessao==null){
                
                        	out.print("<a href='matricula.jsp' class='btn btn-red'>Matrícula</a>");
                        	
                			}
                        
                        %>    
                   </div>
                        
            </div>
        </section>
        <section class=latestResult>
            <div class=container>
                <div class=row>
                    <h2 class=heading>resultado <span>recente</span></h2>

                    <div class="result clearfix">
                        <div class=result-details>
                            <div class=content>
                                <h4>Chute Certo </h4>
                                <p>Ganhou</p>
                            </div>
                            <div class=figure>
                                <div class=team-logo>
                                    <div style=background:url(images/team-logo/logo01.png) class=teamLogoImg></div>
                                </div>
                            </div>
                        </div>
                        <div class=result-count>
                            <div class=count-number><span class=lose-team>3</span> <span>-</span> <span
                                    class=win-team>1</span></div>
                            <div class=dateTime>
                                <div class=dateTime-container><span class=date>28 de Maio de 2020</span> <span
                                        class=time>15:30pm</span></div>
                                <div class=country-wrap><span class=field>Arena Paulista</span><br><span
                                        class=country>(São Paulo)</span>
                                </div>
                            </div>
                        </div>
                        <div class=result-details>
                            <div class="content contentresult">
                                <h4>Clube Atlante

                                </h4>

                                <p>Perdeu</p>
                            </div>
                            <div class="figure figresult">
                                <div class=team-logo>
                                    <div style=background:url(images/team-logo/logo02.png) class=teamLogoImg></div>
                                </div>
                            </div>
                        </div>
                        <div class=center><a href="contato.jsp"
                                class="btn btn-red score-btn">Contato</a></div>
                    </div>
                </div>
            </div>
        </section>

        <section class="players homeplayer">
            <div class=container>
                <div class=row>
                    <h2 class=heading>Melhores <span>Alunos</span></h2><br><br>

                    <div class="wrapplayer clearfix"><a class="prv prev-player"></a> <a class="nxt next-player"></a>
                        <ul class="slideHeroes clearfix">
                            <li><a href="#">
                                    <div class=playerFig>
                                        <div class=playerpic>
                                            <div style=background:url(images/player/player01.jpg) class=bgimg></div>
                                        </div>
                                        <ul class="playerDetails clearfix">
                                            <li><span>Rafael Faria</span> <span><img src=images/icons/tShirt.png
                                                        alt=image></span></li>
                                            <li class=playinfodetails>15 anos </li>
                                            <li class=playerInfo><span>Ataque</span> <span><i
                                                        class="fa fa-heart"></i>150</span></li>
                                        </ul>
                                    </div>
                                </a></li>
                            <li><a href="#">
                                    <div class=playerFig>
                                        <div class=playerpic>
                                            <div style=background:url(images/player/player02.jpg) class=bgimg></div>
                                        </div>
                                        <ul class="playerDetails clearfix">
                                            <li><span>Marcelo Gomez</span> <span><img src=images/icons/tShirt.png
                                                        alt=image></span></li>
                                            <li class=playinfodetails>13 anos</li>
                                            <li class=playerInfo><span>Defesa</span> <span><i
                                                        class="fa fa-heart"></i>34</span></li>
                                        </ul>
                                    </div>
                                </a></li>
                            <li><a href="#">
                                    <div class=playerFig>
                                        <div class=playerpic>
                                            <div style=background:url(images/player/player03.jpg) class=bgimg></div>
                                        </div>
                                        <ul class="playerDetails clearfix">
                                            <li><span>Alex Almeida</span> <span><img src=images/icons/tShirt.png
                                                        alt=image></span></li>
                                            <li class=playinfodetails>12 anos</li>
                                            <li class=playerInfo><span>Lateral</span> <span><i
                                                        class="fa fa-heart"></i>45</span>
                                            </li>
                                        </ul>
                                    </div>
                                </a></li>
                            <li><a href="#">
                                    <div class=playerFig>
                                        <div class=playerpic>
                                            <div style=background:url(images/player/player04.jpg) class=bgimg></div>
                                        </div>
                                        <ul class="playerDetails clearfix">
                                            <li><span>Carlos Rodrigues</span> <span><img src=images/icons/tShirt.png
                                                        alt=image></span></li>
                                            <li class=playinfodetails>10 anos</li>
                                            <li class=playerInfo><span>Meio de campo</span> <span><i
                                                        class="fa fa-heart"></i>45</span>
                                            </li>
                                        </ul>
                                    </div>
                                </a></li>
                            <li><a href="#">
                                    <div class=playerFig>
                                        <div class=playerpic>
                                            <div style=background:url(images/player/player05.jpg) class=bgimg></div>
                                        </div>
                                        <ul class="playerDetails clearfix">
                                            <li><span>Danilo Costa</span> <span><img src=images/icons/tShirt.png
                                                        alt=image></span></li>
                                            <li class=playinfodetails>14 anos</li>
                                            <li class=playerInfo><span>Goleiro</span> <span><i
                                                        class="fa fa-heart"></i>78</span>
                                            </li>
                                        </ul>
                                    </div>
                                </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section class=gallery>
            <div class=container>
                <div class=row>
                    <h2 class=heading>Venha fazer parte do nosso time</h2>
                    <p class=headParagraph>O nosso compromisso é ensinar as habilidades do futebol e formar cidadãos
                        através do esporte. Assim, vamos tornar o mundo um lugar melhor.Treinamentos que visam o
                        aprendizado e o aperfeiçoamento na prática deste esporte, bem como suas regras e fundamentos
                        (passe, chute, condução de bola, cabeceio, posicionamento etc.)
                    </p>
                </div>
            </div>
            <div class=galleryWrapper>
                <div class=grid>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria14.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>União</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria15.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Ataque</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria16.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Pronto pra jogar</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria17.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Observar</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria18.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Estrutura</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria19.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Agilidade</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria20.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Treinamento</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria21.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Ensinamento</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria22.jpg alt=image>

                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Tática</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria23.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Olho na bola</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=grid_item>
                        <div class=gallery_dtl><img src=images/gallery/galeria24.jpg alt=image>
                            <div class=gallery_info>
                                <div class=galleryinfo_wrap>
                                    <p class=uppercase>Drible</p>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=gutter></div>
                </div>
            </div>
            <br>
            <a href="http://127.0.0.1:5501/galeria.html" class="btn btn-red">veja mais</a>
        </section>
        <section class=awards>
            <div class=container>
                <div class=row>
                    <h2 class=heading>Nossas Conquistas</h2> <br></br>
                    <div class="wrapper-container clearfix"><a class="prv awards_prev"></a> <a
                            class="nxt awards_next"></a>
                        <ul class="awards-wrap clearfix">
                            <li><a href=achivement_details.html><img src=images/awards/awards01.png alt=image>
                                    <ul class=awards-info>
                                        <li>FPF 2014</li>
                                        <li> Campeão</li>
                                    </ul>
                                </a></li>
                            <li><a href=achivement_details.html><img src=images/awards/awards02.png alt=image>
                                    <ul class=awards-info>
                                        <li>FPF 2015</li>
                                        <li> Campeão</li>
                                    </ul>
                                </a></li>
                            <li><a href=achivement_details.html><img src=images/awards/awards03.png alt=image>
                                    <ul class=awards-info>
                                        <li>FPF 2016</li>
                                        <li> Campeão</li>
                                    </ul>
                                </a></li>
                            <li><a href=#><img src=images/awards/awards04.png alt=image>
                                    <ul class=awards-info>
                                        <li>FPF 2018</li>
                                        <li> Campeão</li>
                                    </ul>
                                </a></li>
                            <li><a href=achivement_details.html><img src=images/awards/awards02.png alt=image>
                                    <ul class=awards-info>
                                        <li>FPF 2020</li>
                                        <li> Campeão</li>
                                    </ul>
                                </a></li>
                        </ul>
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

                        </div>

                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script src=js/vendor/vendor.js> </script> <script src=js/main.js> </script> </body> </html>
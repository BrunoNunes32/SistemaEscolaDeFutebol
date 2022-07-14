<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
    
    
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
                                            <li><a href=sobre.jsp class=active>Sobre nós <span></span> <span></span>
                                                    <span></span>
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
        <div class=innerbannerwrap>
            <div class=innerbanner>
                <h2 class=bannerHeadline>Sobre Nós <span></span></h2>
            </div>
        </div>
        <section class="matchSchedule countryclub">
            <div class=container>
                <div class=row>
                    <h2 class="heading small"><span>Missão</span></h2>
                    <p class="headParagraph">Desenvolver o lado psicomotor através de um jogo e técnicas de treinamentos
                        avançadas, utilizando uma metodologia especialmente elaborada para isto.</p>
                    <p class="headParagraph"> - Aceitar e conhecer as regras de jogo.</p>
                    <p class="headParagraph"> - Conscientizar as crianças e jovens que a maior vitória não esta em
                        ganhar partidas e sim em manifestar se maior potencial físico, técnico, tático e humano.</p>
                    <p class="headParagraph"> - Utilizar estratégias pedagógicas para o crescimento natural das crianças
                        e jovens.</p>
                    <p class="headParagraph"> - Fazer novas amizades que lhes permitam desfrutar deste esporte com elas.
                    </p>
                    <p class="headParagraph"> - Formar pessoas e transmitir valores.</p>
                    <p class="headParagraph"> - Ser uma Escola de Futebol modelo baseada no trabalho planificado,
                        organizado e metodológico.</p>
                </div>
                <div class=row>
                    <h2 class="heading small"><span>Visão</span></h2>
                    <p class="headParagraph">Ser uma Escola de Futebol onde as crianças e jovens se formem integralmente
                        em um clima de diversão, entusiasmo e progresso constante.</p>
                </div>
                <div class=row>
                    <h2 class="heading small"><span>Valores</span></h2>
                    <p class="headParagraph">É tarefa desta escola de futebol, formar pessoas e transmitir valores.</p>
                    <p class="headParagraph">O respeito pelo arbitro, pelos adversários e aos próprios companheiros, são
                        fatores fundamentais, assim como a educação, a camaradagem e a não violência, praticados após as
                        partidas.</p>
                    <p class="headParagraph"> Através dos intercâmbios com diferentes escolas do país, acampamentos de
                        verão e clinicas de futebol, nós procuramos reforçar o sentimento de comunhão que é tão
                        importante neste esporte de equipe.</p>
                    <p class="headParagraph"> Companheirismo – respeito, colaboração e tolerância com os seus
                        companheiros.</p>
                    <p class="headParagraph">Sacrifício – sem ele é impossível alcançar nossos objetivos.</p>
                    <p class="headParagraph">Superação – aprender a jogar, a ganhar e perder, a cair e levantar, e
                        divertir-se.</p>
                    <p class="headParagraph">Hombridade e Respeito – bom comportamento dentro e fora do campo e ser
                        sempre cordial com estas e outras instituições.</p>
                    </p>
                </div>
                <div class=row>
                    <h2 class="heading small"><span>Metodologia</span></h2>
                    <p class="headParagraph">A escola de futebol Chute Certo segue uma linha pedagógica, onde as idades
                        das crianças e jovens são respeitadas naturalmente.</p>
                    <p class="headParagraph">Neste processo é fundamental a participação de formador capacitado para
                        aplicar sensivelmente os conceitos futebolísticos
                        programados em cada uma das idades. </p>
                    <p class="headParagraph">O primeiro passo é organizar o campo como um ambiente de aula, onde a
                        alegria, a diversão e a ordem são os pontos principais. </p>
                    <p class="headParagraph">Devemos entender que a aprendizagem, consiste em um processo de assimilação
                        lento, gradual e complexo, no qual, a criança
                        deve estabelecer uma intensa atividade mental que permita assimilar e compreender o que é
                        passado, por meio de atividades metodológicas cuidadosamente
                        selecionadas e pensadas à longo prazo. </p>
                    <p class="headParagraph"> Nossa intenção é estimular a aprendizagem das técnicas na medida em que os
                        garotos e jovens estejam preparados física
                        e psicologicamente para executá-las. Sem obrigá-los a executar movimentos praticamente
                        “impossíveis” de se reproduzir, pelo ponto de vista de
                        sua maturidade neurológica. </p>
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
                        <div class=footer-appstore>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script src=js/vendor/vendor.js> </script> <script src=js/main.js> </script> </body> </html>
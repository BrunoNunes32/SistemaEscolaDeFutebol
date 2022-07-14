<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Evento" import="java.util.ArrayList" import="Validacoes.Data" import="java.util.Date"%>
    
    
    
    
    
<%
	String sessao = (String) session.getAttribute("aluno");

	ArrayList<Evento> eventos = Evento.eventos();
	
	int tamanho = eventos.size();

	


	if(sessao!=null){
		response.sendRedirect("index.jsp");
	}

%>
    
    
<!doctype html>
<html class=no-js lang="en-us">
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
                                            <li><a href=galeria.jsp>Galeria <span></span> <span></span> <span></span>
                                                    <span></span></a>
                                            </li>
                                            <li><a href=matricula.jsp class=active>Matrícula <span></span>
                                                    <span></span>
                                                    <span></span>
                                                    <span></span></a></li>
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
        
        <% 
                     					
                     		if(tamanho==0){
                     			out.print("<h4 style='margin-left:460px;margin-top:160px;'>Período de inscrições ainda não foi definido</h4>");	
                     			if(true){return;}
                     		}else{
                     			Evento matri = null;
                     			
                     			for(Evento ev: eventos){
                     				if(ev.getNome().equals("Período de Matrícula")){
                     					matri = ev;
                     				}
                     				
                     			}
                     			
                     			if(matri!=null){
                     			             			
                     			Data data = new Data();
                     			
                     			data.setDataanalise(matri.getData_termino());
                     			
                     			String res2 = data.comparativo();
                     			
                     			if(res2.equals("menor")){
                     				out.print("<h4 style='margin-left:460px;margin-top:160px;'>Período de inscrições foi encerrado!</h4>");	
                         			if(true){return;}
                     			}
                     			
                     			}else{
                     				out.print("<h4 style='margin-left:460px;margin-top:160px;'>Houve um problema com nossos servidores,tenha calma!</h4>");
                     				if(true){return;}
                     			}
                     			
                     			
                     			
                     			
                     			
                     			
                     			
                     			
                     			
                     		}
                     					
         %>
        
        
        <div class=innerbannerwrap>
            <div class=content></div>
            <div class=innerbanner>
                <h2 class=bannerHeadline>Matrícula<span></span></h2>
            </div>
        </div>
        <section class="register_wrapper clearfix">
            <div class=container>
                <div class=row>
                    <div class=register_form >
                    
                    
                     			
                     											<!--  Formulário do Aluno-->
                     					
                     					
                     											
				                       <div class=login_form>+
				                           <h2 class=heading>Formulário de Matrícula</h2>
				                            <form action = '../validadores/validamatricula.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                                <div class=form-group><input type=text class='form-control' name='nome' placeholder='Nome'
				                                        required='' data-parsley-required-message='Informe nome'></div>
				                                        
				                                 <div class=form-group style='margin-bottom:0px;'><label for='dt_nasc'>Data de nascimento</label></div>
				                                        
				                                <div class=form-group><input type=date class='form-control' name='dt_nasc' placeholder='Data de nascimento.Ex: 2000-11-14'
				                                        required='' data-parsley-required-message='Informe data de nascimento'></div>
				                                        
				                                <div class=form-group><input type=text class='form-control' name='rg' placeholder='RG'
				                                        required='' data-parsley-required-message='Informe Rg'></div>
				                                        
				                                <div class=form-group><input type=text class='form-control' name='cpf' placeholder='Cpf'
				                                        required='' data-parsley-required-message='Informe cpf'></div>
				                                        
				                                        
				                                <div class=form-group><Strong style='margin-right: 25px;'>Sexo:</Strong><select name="sexo"><option value="M">Masculino</option> 
				                                		<option value="F">Feminino</option> </select><br/><br/>
				                                		
				                                					<!-- Formulário do Responsável -->
				                                     
				                               <div class=form-group><input type=text class='form-control' name='nome_resp' placeholder='Nome do responsável'
				                                        required='' data-parsley-required-message='Informe nome do responsável'></div>
				                                   
				                                 
				                                 <div class=form-group style='margin-bottom:0px;'><label for='dt_nasc_resp'>Data de nascimento do responsável</label></div>
				                                        
				                                <div class=form-group><input type=date class='form-control' name='dt_nasc_resp' placeholder='Data de nascimento do responsável'
				                                        required='' data-parsley-required-message='Informe data de nascimento do responsável'></div>
				                                        
				                                <div class=form-group><input type=text class='form-control' name='rg_resp' placeholder='RG do responsável'
				                                        required='' data-parsley-required-message='Informe Rg do responsável'></div>
				                                        
				                                <div class=form-group><input type=text class='form-control' name='cpf_resp' placeholder='Cpf do responsável'
				                                        required='' data-parsley-required-message='Informe cpf'></div>
				                                        
				                               
				                                <div class=form-group><Strong style='margin-right: 25px;'>Sexo do responsavel:</Strong><select name="sexo_resp"><option value="M">Masculino</option> 
				                                		<option value="F">Feminino</option> </select><br/><br/>
				                                        
				                                <div class=form-group><input type=text class='form-control' name='telcel' placeholder='Telefone/celular'
				                                        required='' data-parsley-required-message='Informe o telefone/celular'></div>
				                                        
				                               <div class=form-group style='margin-bottom:0px;'><label for='dt_compa'>Data de comparecimento</label></div>
				                                        
				                               <div class=form-group><input type=date class='form-control' name='dt_compa' placeholder='Data de comparecimento'
				                                        required='' data-parsley-required-message='Informe a data de comparecimento'></div>
				                                    
				                                        
				                                <div class=form-group><input type='password' class='form-control' name='senha'
				                                        placeholder='Senha' required=''
				                                        data-parsley-required-message='informe a senha desejada'>
				                                </div>
				                                <div class=form-group>
				                                    <button type=submit class='btn btn-red' id=send>Matricular</button>
				                                </div>
				                                
				                            </form>
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
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script src=js/vendor/vendor.js> </script> <script src=js/main.js> </script> </body> </html>
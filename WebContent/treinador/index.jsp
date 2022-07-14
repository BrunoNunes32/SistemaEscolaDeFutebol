<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@ page import="Models.Treinador" %>

    
<% 
	String sessao = (String) session.getAttribute("treinador");
	if(sessao==null){
		response.sendRedirect("login.jsp");
		while(true){return;}
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
                                            <li><a href=index.jsp class=active>Home <span></span> <span></span>
                                                    <span></span> <span></span></a></li>
                                  
                                            <li><a href=turma.jsp>Minha Turma<span></span> <span></span>
                                                    <span></span>
                                                    <span></span></a></li>
                                            <li><a href=avaliacoes.jsp>Avaliações <span></span> <span></span> <span></span>
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
                                     <a style='margin-left:-20px;;font-size:15px;margin-top:135px;padding:10px 35px;position:absolute;' class='btn' href='../validadores/logouttreinador.jsp'>Sair</a>
                                   
                    </div>
                    			<% 
                    				Treinador treina = Treinador.getTreina(sessao);
                    				
                    			%>
                    				
                    
                    
                </div>
            </div>
            
        </header>
        
        
        
        <section class="register_wrapper clearfix"" style="margin-top:75px;">
       
            <div class="container" style="margin-top:-120px;">
                <div class=row>
                    <div class=register_form >
           					
           				<% 
           					
           				
           					String nome = treina.getNome();	
           					String dt_nasc = treina.getDt_nasc();
           					String cpf = treina.getCpf();
           					String rg = treina.getRg();
           					String sexo = treina.getSexo();
           					
           					
           				
           				
           				%>	
           					                											
				                           <h2 class="heading small" style="margin-left:60px;"><span>Treinador</span></h2><br>
				                            <form action = '../validadores/treinador_salvar_dados.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                            	<div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for='nome'>Nome</label></div>
				                            
				                                <div class=form-group><input style="width:450px;height:30px;" type='text' class='form-control' name='nome' placeholder='Nome'
				                                        required='' data-parsley-required-message='Informe nome' disabled value='<% out.print(nome); %>'></div>
				                                        
				                                 <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for='dt_nasc'>Data de nascimento</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='dt_nasc' placeholder='Data de nascimento.Ex: 2000-11-14'
				                                        required='' data-parsley-required-message='Informe data de nascimento' value='<% out.print(dt_nasc); %>'></div>
				                                  
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for='rg'>RG</label></div>
				                                  
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='rg' placeholder='RG'
				                                        required='' data-parsley-required-message='Informe Rg' value='<% out.print(rg); %>'></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for=cpf>Cpf</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='cpf' placeholder='Cpf'
				                                        required='' data-parsley-required-message='Informe cpf' disabled value='<% out.print(cpf); %>'></div>
				                                        
				                                        
				                                <div class=form-group><Strong style='margin-right: 25px;color:black;'>Sexo:</Strong><select disabled name="sexo">
				                                		<%
				                                			if(sexo.equals("M")){
				                                				out.print("<option value='M'>Masculino</option> selected");
				                                			}else{
				                                				out.print("<option value='F'>Feminino</option> selected");
				                                			}
				                                			
				                                			
				            
				                                		%>	
				                                	
				                                	                		
				                                </select><br/></div>
				                                		
				                                 <div class=form-group>
				                                    <button type='submit' class='btn-small01 btn-red' style='margin-left:50px' id='send'> Salvar</button>
				                                    <a style='margin-left:210px;;font-size:15px;margin-top:-40px;padding:9px 35px;position:absolute;' class='btn' href='novasenha.jsp'>Alterar Senha</a>
				                                </div>
				                                		
				                                
				                            </form>
				                        
           
                    </div>
                </div>
            </div>


        </section>

</div>


</body>
</html>
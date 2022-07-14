<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="Models.Aluno" import="Models.Responsavel" import="Validacoes.Data" import="Models.Avaliacao" import="java.util.ArrayList" import="Models.Turno" 
import="Models.Treinador" import="Models.Evento" import="Models.Dados_medicos"
%>
    
    
<!doctype html>
<html class=no-js lang="pt-br">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<head>
    <meta charset=utf-8>
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>soccer club</title>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script>
        
    
</head>


<style>
.sair{
	color:white;
	font-size:20px;

}

.sair:hover{
	text-decoration: underline;
	text-decoration-color: rgba(255,0,0,0.4);
	color:white;
	
}

table, th, td {
			border: 1px solid black;
			border-collapse: collapse;
			font-family: sans-serif;
		}

		th, td {
			padding: 8px;
			font-weight:bold;
		}
		
		.outrasinfos td{
			width:100px;
			text-align:center;
		
		}





</style>
    
    
    
<body>
    <!--[if lt IE 10]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
    <header class="header-main error-menu">
        <div class="header-lower clearfix">
            <div class=container>
                <div class=row>
                    <div class=menubar>
                        <nav class=navbar>
                            <div class=nav-wrapper>
                                <div class=navbar-header>
                                    <button type=button class=navbar-toggle><span class=sr-only>Toggle navigation</span>
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
                                        <li><a href=contato.jsp>Contato<span></span> <span></span> <span></span>
                                                <span></span></a></li>
                                        <li><a href=login.jsp class="active">Área do Aluno<span></span>
                                                <span></span> <span></span>
                                                <span></span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    
    <div class=loginWrapper style="position:relative">
        <div class=loginHolderWrap>
            <div class=loginHolder>
                <h1><a href=index.jsp><img src=images/logo.png alt=image></a></h1>

                <div class=container>
                    <div class=row>
                    	<%	
   		            			if(sessao==null){
				                    out.println(
				                        "<div class='login_form'>"+
				                           "<h2 class='heading'>Área do Aluno</h2>"+
				                            "<form action = '../validadores/validalogin.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>"+
				                                "<div class='form-group'><input type='text' class='form-control' name='login' placeholder='Cpf'"+
				                                        "required='' data-parsley-required-message='Informe usuario'></div>"+
				                                "<div class='form-group'><input type='password' class='form-control' name='senha'"+
				                                        "placeholder='Senha' required='' "+
				                                        "data-parsley-required-message='Por favor informe a senha'>"+
				                                "</div>"+
				                                "<div class='form-group'>"+
				                                    "<button type=submit class='btn btn-red' id='send'>Login</button>"+
				                                "</div>"+
				                                "<div class='form-message'></div>"+
				                            "</form>"+
				                        "</div>");
				                    if(true){return;}
				                    
				                    
				                
                    			}
                    				Aluno aluno = Aluno.dadosAluno(sessao);
                    				
                    				if(aluno==null){      
                    					
                              			out.println("<script language='javascript'>location.href='../validadores/logout.jsp'  </script>");
                              			if(true){return;}
                                    		
                                    }
                      	
                    				
                    				
                    				out.print("<h2 style='color:white;margin-bottom:30px;'>"+aluno.getNome()+"</h2>");
                    				out.print("<a class='sair' href='../validadores/logout.jsp'>Sair</a>");
                       %> 
                       
                        
                    </div>
                </div>
            </div>
        </div>
       </div>
       
       <%
    	if(aluno.getTreinador()!=null){
   
    				out.print("<h2 style='margin-top:40px;margin-left:100px;position:absolute;'>Calendário</h2>");
       				out.print("<div class='infos' style='float:left;position:absolute;margin-top:150px;margin-left:10px;'>");
       
					
				
				
					//Avaliacoes
				
					String treinador = aluno.getTreinador().getCpf();
					
					Treinador treina = Treinador.getTreina(treinador);
					
					ArrayList<Avaliacao> avas = Avaliacao.dadosAva(treinador);
					
					
					
					Data data = new Data();
					
					String data_atual = data.diames();
					
					
					//Eventos
					ArrayList<Evento> eventos = Evento.eventos();
					
					
					
					
					
					//Eventos de hoje
					
					out.print("<form><table style='width:350px'>"+
							"<caption font-style='sans-serif' style='font-size:19px;'>Atividades e/ou eventos de hoje - "+data_atual+"</caption>"+
							"<tr style='text-align:center;'>"+
								"<td>Eventos</td></tr>");
					
		
					for(Evento ev: eventos){
						data.setDataanalise(ev.getData_ini());
						
						if(data.comparativo().equals("igual") && (ev.getTurno()==null || (aluno.getTurno()!=null &&  ev.getTurno().equals(aluno.getTurno().getTurno())))){
							if(ev.getData_termino()!=null){
								data.setDataanalise(ev.getData_termino());
								if(data.comparativo().equals("maior") || data.comparativo().equals("igual")){
									data.setDataanalise(ev.getData_ini());
									
									String dtini = data.diames();
									
									data.setDataanalise(ev.getData_termino());
									
									String dtfim = data.diames();
									
									
									out.print("<tr><td style='font-style: italic;'>- "+ev.getNome()+" - "+dtini+" - "+dtfim+"</td></tr>");
								}
							}else if (data.comparativo().equals("igual")){
							
							
								out.print("<tr><td style='font-style: italic;'>- "+ev.getNome()+"</td></tr>");
							}
						}
					}
					
					
					
					
					
					
					
					out.print("</table><br>");
					
					
					out.print("<table style='width:350px'>"+
							"<tr style='text-align:center;'>"+
								"<td>Atividades</td></tr>");
					
					//Aqui estará o conteúdo
					for(Avaliacao ava: avas){
						data.setDataanalise(ava.getDt_aplicacao());
					
						if(data.comparativo().equals("igual")){
							
					
							out.print("<tr><td style='font-style: italic;'>- "+ava.getNome()+"</td></tr>");
					
						}
					
					}
					
					out.print("</table>");
					
					out.print("</form><br><br>");
					
					
					
					
				
				
					out.print("<form><table style='width:350px'>"+
							"<caption font-style='sans-serif' style='font-size:20px;'>Atividades e/ou eventos futuros</caption>"+
							"<tr style='text-align:center;'>"+
								"<td>Eventos</td></tr>");
					
					for(Evento ev: eventos){
					
						data.setDataanalise(ev.getData_ini());
						
						if(data.comparativo().equals("maior") && (ev.getTurno()==null || (aluno.getTurno()!=null && ev.getTurno().equals(aluno.getTurno().getTurno())))){
							out.print("<tr><td style='font-style: italic;'>- "+ev.getNome()+" - "+data.diames()+"</td></tr>");
						}
					}
					
					
					
					
					out.print("</table><br>");
					
					
					out.print("<table style='width:350px'>"+
							"<tr style='text-align:center;'>"+
								"<td>Atividades</td></tr>");
					
					//Aqui estará o conteúdo
					for(Avaliacao ava: avas){
						data.setDataanalise(ava.getDt_aplicacao());
					
						if(data.comparativo().equals("maior")){
							
							String dataava = data.diames();
					
							out.print("<tr><td style='font-style: italic;'>- "+ava.getNome()+" - "+dataava+"</td></tr>");
					
						}
					
					}
					
					
					
					out.print("</table>");
					
					out.print("</form><br><br>");
					
    	
    				out.print("</div>");
    				
    				if(aluno.getTurno()!=null){
    				
    				Turno turno = Turno.getTurno(aluno.getTurno().getTurno());
    				Dados_medicos dm = Dados_medicos.getDados_medicos(sessao);
    				
    				
    				
    				
       				out.print("<div class='infos' style='float:right;position:absolute;margin-top:150px;margin-left:870px;'>");
       				
       				out.print("<h2 style='margin-top:40px;margin-left:100px;position:absolute;width:200px;'>Outras infos</h2>");
       				
       				out.print("<form><table class='outrasinfos' style='width:350px;margin-top:100px;margin-left:'>"+
							"<tr style='text-align:center;'>"+
								"<td>Treinador</td><td>Turno</td><td>Horário de início</td><td>Horário de término</td></tr>");
       				
			
					
					out.print("<tr><td style='font-style: italic;'>"+treina.getNome()+"</td><td style='font-style: italic;'>"+turno.getTurno()+"</td><td style='font-style: italic;'>"+turno.getInicio_aulas()+"</td><td style='font-style: italic;'>"+turno.getFim_aulas()+"</td></tr>");
					
			
					out.print("</table><br>");
					
					out.print("</form>");
					
					out.print("<form><table class='outrasinfos' style='width:350px;margin-top:100px'>"+
							"<tr style='text-align:center;'>"+
								"<td>Altura</td><td>Peso</td><td>Tipo sanguíneo</td><td>Doenças Crônicas</td><td>Alergias</td><td>Medicamentos</td></tr>");
       				
			
					
					out.print("<tr><td style='font-style: italic;'>"+dm.getAltura()+"</td><td style='font-style: italic;'>"+dm.getPeso()+"</td><td style='font-style: italic;'>"+dm.getTipo_sanguineo()+"</td><td style='font-style: italic;'>"+dm.getDoencas_cronicas()+"</td><td>"+dm.getAlergias()+"</td><td>"+dm.getMedicamentos()+"</td></tr>");
					
			
					out.print("</table><br>");
					
					out.print("</form>");
					
					
					

					
					
					
					
					out.print("</div>");
					
					
    				}
       				
      
				
    				}else{
    					Data dt = new Data();
    					dt.setDataanalise(aluno.getDt_matricula());
    					String data = dt.diames();
    					
    					
    					
           				out.print("<div class='infos' style='float:left;position:absolute;margin-top:100px;margin-left:30px;border: 1px black solid;'>");
           				out.print("<h2 style='margin-top:0px;margin-left:60px;position:absolute;'>Outras infos</h2>");
           				out.print("<p style='margin-top:50px;'>Data de matrícula presencial: "+data+"</p>");
    					out.print("</div>");
    					
    					
    					
    					
    					
    					
    					
    				}
				%>
				
				

       	
       
       
       
        <section class="register_wrapper clearfix" style="margin-top:-200px;margin-left:-250px;">
            <div class="container">
            	
                <div class=row>
                
                    <div class=register_form >
                    	
           					
           				<% 
           					Responsavel resp = Responsavel.getResponsa(aluno.getResponsavel().getCpf());
           					
           					String nome_al = aluno.getNome();	
           					String dt_nasc_al = aluno.getDt_nasc();
           					String cpf_al = aluno.getCpf();
           					String rg_al = aluno.getRg();
           					String sexo_al = aluno.getSexo();
           					
           					String nome_re = resp.getNome();	
           					String dt_nasc_re = resp.getDt_nasc();
           					String cpf_re = resp.getCpf();
           					String rg_re = resp.getRg();
           					String sexo_re = resp.getSexo();
           					String telcel = resp.getTelefone();
           					
           				
           				
           				%>	
           					
           					
                     											<!--  Formulário do Aluno-->
                     											
				                           <h2 class="heading small" style="margin-left:60px;"><span>Aluno</span></h2><br>
				                            <form action = '../validadores/aluno_salvar_dados.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                            	<div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for='nome'>Nome</label></div>
				                            
				                                <div class=form-group><input style="width:450px;height:30px;" type='text' class='form-control' name='nome' placeholder='Nome'
				                                        required='' data-parsley-required-message='Informe nome' disabled value='<% out.print(nome_al); %>'></div>
				                                        
				                                 <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for='dt_nasc'>Data de nascimento</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='dt_nasc' placeholder='Data de nascimento.Ex: 2000-11-14'
				                                        required='' data-parsley-required-message='Informe data de nascimento' value='<% out.print(dt_nasc_al); %>'></div>
				                                  
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for='rg'>RG</label></div>
				                                  
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='rg' placeholder='RG'
				                                        required='' data-parsley-required-message='Informe Rg' value='<% out.print(rg_al); %>'></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for=cpf>Cpf</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='cpf' placeholder='Cpf'
				                                        required='' data-parsley-required-message='Informe cpf' disabled value='<% out.print(cpf_al); %>'></div>
				                                        
				                                        
				                                <div class=form-group><Strong style='margin-right: 25px;color:black;'>Sexo:</Strong><select disabled name="sexo">
				                                		<%
				                                			if(sexo_al.equals("M")){
				                                				out.print("<option value='M'>Masculino</option> selected");
				                                			}else{
				                                				out.print("<option value='F'>Feminino</option> selected");
				                                			}
				                                			
				                                			
				            
				                                		%>	
				                                	
				                                	                		
				                                </select><br/><br/><br/><br/></div>
				                                		
				                                					<!-- Formulário do Responsável -->
				                                	
				                      				
				                                <h2 class="heading small" style="margin-left:60px;"><span>Responsável</span></h2><br><br>
				                                     
				                                     
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for='nome_resp'>Nome do responsável</label></div> 
				                                 
				                               <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='nome_resp' placeholder='Nome do responsável'
				                                        required='' data-parsley-required-message='Informe nome do responsável' disabled value='<% out.print(nome_re); %>'></div>
				                                   
				                                <div class=form-group style='margin-bottom:0px;margin-left:80px;'><label style="color:#114769" for='dt_nasc_resp'>Data de nascimento do responsável</label></div>
				                             
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='dt_nasc_resp' placeholder='Data de nascimento do responsável'
				                                        required='' data-parsley-required-message='Informe data de nascimento do responsável' value='<% out.print(dt_nasc_re); %>'></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for='rg_resp'>RG do responsável</label></div>        
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='rg_resp' placeholder='RG do responsável'
				                                        required='' data-parsley-required-message='Informe Rg do responsável' value='<% out.print(rg_re); %>'></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for='cpf_resp'>Cpf do responsável</label></div>        
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='cpf_resp' placeholder='Cpf do responsável'
				                                        required='' data-parsley-required-message='Informe cpf' disabled value='<% out.print(cpf_re); %>'></div>
				                                      
				                  
				                               
				                                <div class=form-group><Strong style='margin-right: 25px;color:black;'>Sexo do responsável:</Strong><select disabled class= 'sele' name="sexo_resp">
				                                
				                                		<%
				                                			if(sexo_re.equals("M")){
				                                				out.print("<option value='M'>Masculino</option> selected");
				                                			}else{
				                                				out.print("<option value='F'>Feminino</option> selected");
				                                			}
				                                			
				                                			
				            
				                                		%>	
				                                	
				                                		
				                                		</select><br/><br/>
				                                		
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for='telcel'>Telefone/celular do responsável</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='telcel' placeholder='Telefone/celular'
				                                        required='' data-parsley-required-message='Informe o telefone/celular' value='<% out.print(telcel); %>'></div>
				                                    
				                                  
				                                <div class=form-group>
				                                	<%
				                                	
				                                	if(aluno.getTreinador()!=null){
				        			                                
				                                	out.print("<button type='submit' class='btn-small01 btn-red' style='margin-left:45px;float:left;' id='send'> Salvar</button>"+
				                                    "<a class='btn' style='font-size:15px; margin-left:65px;margin-top:0px;position:absolute;padding:8.5px 20px;' href='desempenho.jsp'>Meu desempenho</a>");
				                                	
				                                	}else{
				                                		out.print("<button type='submit' class='btn-small01 btn-red' style='margin-left:125px;float:left;' id='send'> Salvar</button>");
				                                		
				                                	}
				                                	
				                                	out.print("<a style='margin-left:-60px;;font-size:15px;margin-top:70px;padding:9px 35px;position:absolute;' href='novasenha.jsp'>Alterar Senha</a>");
				                                	
				                                	%>
				                                	
				                                	
				                                	
				                                	
				                                	
				                                    
				                                 </div>
				                                
				                            </form>
				                        
           
                    </div>
                </div>
            </div>


        </section>
        <footer>
            <div class=footer-type02 style="margin-top:-150px;">
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
       
  
       
       
       
       
	
        <script src=js/vendor/vendor.js> </script> <script src=js/main.js> </script> </body> </html>
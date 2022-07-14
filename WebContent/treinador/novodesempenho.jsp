<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Aluno" import="Models.Avaliacao" import="java.util.ArrayList" import="Validacoes.Data" import="Models.Treinador"%>
    
<%

	String sessao = (String) session.getAttribute("treinador");
	String aluno = request.getParameter("aluno");
	
	Aluno alu = Aluno.dadosAluno(aluno);
	
	
	
	if(sessao==null){
		response.sendRedirect("login.jsp");
	}else if(alu==null || alu.getTreinador()==null || !alu.getTreinador().getCpf().equals(sessao)){
		response.sendRedirect("turma.jsp");
	}
	
	Treinador tr = Treinador.getTreina(sessao);
	

%>
    
    
    
<!DOCTYPE html>
<html>
<head>

	<title>Adicionar nova avaliação</title>
	<meta charset=utf-8>
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>soccer club</title>
    <link rel="shortcut icon" href=favicon.ico>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script>


</head>
<body>

<div class=wrapper>

<h4><a href='desempenho.jsp?aluno=<%out.print(aluno); %>' style='margin-left:20px;'><- Voltar</a></h4>

<section class="register_wrapper clearfix" style="margin-top:-150px;">
            <div class=container>
                <div class=row>
                    <div class=register_form >
                    						<%
                    							ArrayList<Avaliacao> avs = Avaliacao.dadosAva(sessao);
                    							int tamanho = avs.size();
                    							
                    							if(tamanho==0){
                    								out.print("<h4 style='margin-left:350px;'>Não há avaliações disponíveis</h4>");
                    								if(true){return;}
                    							}else{
                    								int confirma = 0;
                    								int possui = 0;
                    								
                    								for(Avaliacao avali:avs){
                    									Data dt = new Data();
                    									dt.setDataanalise(avali.getDt_aplicacao());
                    									
                    									if(dt.comparativo().equals("maior")){
                    										confirma = 1;
                    										
                    									}else{
                    										possui = 1;
                    									}
                    							      

                    								}
                    								
                    								if(confirma==1 && possui==0){
                    									out.print("<h4 style='margin-left:350px;'>Avaliações não podem ser avaliadas hoje</h4>");
                        								if(true){return;}
                    								}
                    								
                    								
                    								
                    								
                    							}
                    						
                    						%>
                    
				                           <h2 class=heading>Nova Avaliação</h2>

				                            <form action = '../validadores/validadesem.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                               <div class=form-group><Strong style='margin-right: 25px;'>Avaliação: </Strong><select name="id"> 
				                                	<%
				                                	ArrayList<Avaliacao> avas = Avaliacao.dadosAva(sessao);
				                                	
				                                	int tam = avas.size();
				                                	
				                                	if(tam>0){
				                                		for(Avaliacao av: avas){
				                                			Data data = new Data();
				                                			
				                                			data.setDataanalise(av.getDt_aplicacao());
				                                			
				                                			if(data.comparativo().equals("menor") || data.comparativo().equals("igual")){
				                                				out.print("<option value='"+av.id+"'>"+av.id+" - "+av.getNome()+"</option>");
				                                			}
				                                		}
				                                	}
				                                	
				                                	
				                                	%>
				                                	
				                                </select><br/><br/></div>
				                                <div class=form-group><input type=text class='form-control' name='nota' placeholder='Nota do aluno'
				                                        required='' data-parsley-required-message='Informe a nota'></div>
				                                        
				                            
				                                <div class=form-group><input type=hidden class='form-control' name='aluno' placeholder=''
				                                        required='' data-parsley-required-message='' value='<% out.print(aluno); %>'></div>
				                                        
				                                <div class=form-group>
				                                    <button type=submit class='btn btn-red' id=send>Adicionar</button>
				                                </div>
				                                
				                            </form>
				                        
           
                    </div>
                </div>
            </div>


        </section>
</div>









</body>
</html>
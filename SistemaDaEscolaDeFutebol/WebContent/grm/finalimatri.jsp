<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="Models.Aluno" import="Models.Treinador" import="Models.Turno"%>
    
    
 <%
 		String sessao = (String) session.getAttribute("grm");
 		String aluno = request.getParameter("aluno");
 		
 		Aluno alu = Aluno.dadosAluno(aluno);
 		
 		if(sessao==null){
 			response.sendRedirect("login.jsp");
 		}
 		
 		
 		
 		if(alu==null || alu.getTreinador()!=null){
 			out.print("<script language='javascript'>window.location.href='alunos.jsp'</script>");
 			if(true){return;}
 		}
 
 %>   
    
    
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<title>Finalizar matrícula</title>
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

	<h4><a href='matriculaspe.jsp' style='margin-left:20px;'><- Voltar</a></h4>
	
	<div style="margin-top:100px;text-align:center;margin-left:16px;">
	
	<%
		ArrayList<Treinador> treina = Treinador.treinadores();
		ArrayList<Turno> turnos = Turno.turnos();
		
		int tamanhoTr = treina.size();
		int tamanhoTu = turnos.size();
		
		if(tamanhoTr==0 || tamanhoTu==0){
			out.print("<h4>Matrícula não pode ser finalizada pois não há turnos e/ou treinadores cadastrados!</h4>");
			if(true){return;}
		}
		
	%>
	
	</div>
	
	
	<section class="register_wrapper clearfix" style="margin-top:-250px;margin-left:430px;">
            <div class="container">
            	
                <div class=row>
                
                    <div class=register_form >
	
														<!-- Formulário do Responsável -->
				                                	
				                      				
				                                <h2 class='heading small' style='margin-left:-730px;'><span>Dados Escolares</span></h2><br><br>
				                                
				                                
				                                <form action='../validadores/grm/validamatricula.jsp?aluno=<% out.print(aluno);%>' method='post'>
				                                
				                                <div class=form-group><Strong style='margin-right: 25px;color:black;'>Treinador:</Strong><select required class= 'sele' name='treinador'>
				                                	<%
				                                	for(Treinador tr: treina){
				                                		out.print("<option value='"+tr.getCpf()+"'>"+tr.getCpf()+" - "+tr.getNome()+"</option>");
				                    	          	}
				                                	
				                                	%>	
				                                </select><br/><br/></div>
				                                
				                                <div class=form-group><Strong style='margin-right: 50px;color:black;'>Turno:</Strong><select required class= 'sele' name="turno">
				                                	<%
				                                	for(Turno tu: turnos){
				                                		out.print("<option value='"+tu.getTurno()+"'>"+tu.getTurno()+"</option>");
				                    	          	}
				                                	
				                                	%>	
				                                </select><br/><br/></div>
				                                
				                                <h2 class='heading small' style='margin-left:-730px;'><span>Dados Médicos</span></h2><br><br>
				                                     
				                                     
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for='nome_resp'>Altura</label></div> 
				                                 
				                               <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='altura' placeholder='Altura do Aluno'
				                                        required='' data-parsley-required-message='Informe a altura do aluno' ></div>
				                                   
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style='color:#114769' for='dt_nasc_resp'>Peso</label></div>
				                             
				                                        
				                                <div class=form-group><input style='width:450px;height:30px;' type=text class='form-control' name='peso' placeholder='Data de nascimento do responsável'
				                                        required='' data-parsley-required-message='Informe o peso do aluno' ></div>
				                                        
				                                      
				                                        
				                                <div class=form-group><Strong style='margin-right: 50px;color:black;'>Tipo Sanguíneo:</Strong><select required class= 'sele' name="tipo_s">
				                                	<option value='O-'>O-</option>
				                                	<option value='O+'>O+</option>
				                                	<option value='A-'>A-</option>
				                                	<option value='A+'>A+</option>
				                                	<option value='B-'>B-</option>
				                                	<option value='B+'>B+</option>
				                                	<option value='AB-'>AB-</option>
				                                	<option value='AB+'>AB+</option>
				                                	
				                                </select><br/><br/></div>
				                                
				                                <div class=form-group><Strong style='margin-right: 30px;color:black;'>Doenças Crônicas:</Strong><select required='' class= 'sele' name="doencas_c">
				                                	<option value='nenhuma'>Nenhuma</option>
				                                	<option value='poucas'>Poucas</option>
				                                	<option value='muitas'>Muitas</option>
				                              
				                                </select><br/><br/></div>
				                                
				                                <div class=form-group><Strong style='margin-right: 95px;color:black;'>Alergias:</Strong><select required class= 'sele' name="alergias">
				                                	<option value='nenhuma'>Nenhuma</option>
				                                	<option value='poucas'>Poucas</option>
				                                	<option value='muitas'>Muitas</option>
				                              
				                                </select><br/><br/></div>
				                                
				                                <div class=form-group><Strong style='margin-right: 20px;color:black;'>Toma medicamentos:</Strong><select required class= 'sele' name="medicamentos">
				                                	<option value='sim'>Sim</option>
				                                	<option value='não'>Não</option>
				                                	
				                              
				                                </select><br/><br/></div>
				                               
				                           
	
												<button type='submit' class='btn-small01 btn-red' style='margin-left:85px;float:left;' id='send'> Salvar</button>
												<a href='../validadores/grm/excluirpe.jsp?aluno=<% out.print(aluno); %>' class='btn-small01 btn-red' style='margin-left:265px;background:red;' id='send'> Excluir</a>
												
												</form>
	
	
	
	
	
				</div>
				</div>
				</div>
				
				</section>
	
	

</body>

</html>
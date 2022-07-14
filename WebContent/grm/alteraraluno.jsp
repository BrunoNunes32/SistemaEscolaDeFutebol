<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Aluno" import="Models.Responsavel" 
    import="Models.Dados_medicos" import="Models.Treinador" import="Models.Turno" import="java.util.ArrayList"%>
    
    
    <%
 		String sessao = (String) session.getAttribute("grm");
 		String alu = request.getParameter("aluno");
 		
 		Aluno aluno = Aluno.dadosAluno(alu);
 		
 		if(sessao==null){
 			response.sendRedirect("login.jsp");
 		}
 		
 		
 		
 		if(aluno==null || aluno.getTreinador()==null){
 			out.print("<script language='javascript'>window.location.href='alunos.jsp'</script>");
 			if(true){return;}
 		}
 
 %>   
    
        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

	<meta charset="utf-8">
	<title>Alterar aluno</title>
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

<h4><a href='alunos.jsp' style='margin-left:20px;'><- Voltar</a></h4>
	
	<div style="margin-top:100px;text-align:center;margin-left:16px;">
	
	<%
		ArrayList<Treinador> treina = Treinador.treinadores();
		ArrayList<Turno> turnos = Turno.turnos();
		
		Dados_medicos dm = Dados_medicos.getDados_medicos(alu);
		
		Responsavel resp = aluno.getResponsavel();
		
			String nome_re = resp.getNome();	
			String dt_nasc_re = resp.getDt_nasc();
			String cpf_re = resp.getCpf();
			String rg_re = resp.getRg();
			String sexo_re = resp.getSexo();
			String telcel = resp.getTelefone();
		
		
	%>
	
	</div>
	
	
	<section class="register_wrapper clearfix" style="margin-top:-250px;margin-left:430px;">
            <div class="container">
            	
                <div class=row>
                
                    <div class=register_form >
	
														<!-- Formulário do Responsável -->
												 <h2 class="heading small" style="margin-left:-730px;"><span>Responsável</span></h2><br><br>
				                                     
				                                     
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for='nome_resp'>Nome do responsável</label></div> 
				                                 
				                               <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='nome_resp' placeholder='Nome do responsável'
				                                        required='' data-parsley-required-message='Informe nome do responsável' disabled value='<% out.print(nome_re); %>'></div>
				                                   
				                                <div class=form-group style='margin-bottom:0px;margin-left:80px;'><label style="color:#114769" for='dt_nasc_resp'>Data de nascimento do responsável</label></div>
				                             
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' disabled name='dt_nasc_resp' placeholder='Data de nascimento do responsável'
				                                        required='' data-parsley-required-message='Informe data de nascimento do responsável' value='<% out.print(dt_nasc_re); %>'></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for='rg_resp'>RG do responsável</label></div>        
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' disabled name='rg_resp' placeholder='RG do responsável'
				                                        required='' data-parsley-required-message='Informe Rg do responsável' value='<% out.print(rg_re); %>'></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769"  for='cpf_resp'>Cpf do responsável</label></div>        
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' disabled name='cpf_resp' placeholder='Cpf do responsável'
				                                        required='' data-parsley-required-message='Informe cpf' disabled value='<% out.print(cpf_re); %>'></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769"  for='cpf_resp'>Tel/Cel do responsável</label></div>        
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' disabled name='telcel' placeholder='Cpf do responsável'
				                                        required='' data-parsley-required-message='Informe cpf' disabled value='<%=telcel %>'></div>
														
														
														
														
														
														
														
														
														
														
														
														
														
				                                	
				                      				
				                                <h2 class='heading small' style='margin-left:-730px;'><span>Dados Escolares</span></h2><br><br>
				                                
				                                
				                                <form action='../validadores/grm/salva_aluno.jsp?aluno=<% out.print(alu);%>' method='post'>
				                                
				                                
				                                <div class=form-group style='margin-bottom:0px;margin-left:160px;'><label style="color:#114769" for='nome_resp'>Data de matrícula</label></div> 
				                                 
				                               <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='dt_matricula' placeholder='Data de matrícula'
				                                        required='' data-parsley-required-message='' disabled value='<% out.print(aluno.getDt_matricula()); %>'></div>
				                                
				                                <div class=form-group><Strong style='margin-right: 25px;color:black;'>Treinador:</Strong><select required class= 'sele' name='treinador'>
				                                	<%
				                                	for(Treinador tr: treina){
				                                		if(tr.getCpf().equals(aluno.getTreinador().getCpf())){
				                                			out.print("<option selected value='"+tr.getCpf()+"'>"+tr.getCpf()+" - "+tr.getNome()+"</option>");
				                                		}else{
				     
				                                			out.print("<option value='"+tr.getCpf()+"'>"+tr.getCpf()+" - "+tr.getNome()+"</option>");
				                    	          			
				                                		}
				                                		
				                                	}
				                                	
				                                	%>	
				                                </select><br/><br/></div>
				                                
				                                <div class=form-group><Strong style='margin-right: 50px;color:black;'>Turno:</Strong><select class= 'sele' name="turno">
				                                	<%
				                                	for(Turno tu: turnos){
				                                		if(aluno.getTurno()!=null && tu.getTurno().equals(aluno.getTurno().getTurno())){
				                                			out.print("<option selected value='"+tu.getTurno()+"'>"+tu.getTurno()+"</option>");
				                                			
				                                		}else{
				                                		
				                                		
				                                			out.print("<option value='"+tu.getTurno()+"'>"+tu.getTurno()+"</option>");
				                                		
				                                		}
				                    	          	}
				                                	
				                                	%>	
				                                </select><br/><br/></div>
				                                
				                                <h2 class='heading small' style='margin-left:-730px;'><span>Dados Médicos</span></h2><br><br>
				                                     
				                                     
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for='nome_resp'>Altura</label></div> 
				                                 
				                               <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' value='<%out.print(dm.getAltura()); %>'  name='altura' placeholder='Altura do Aluno'
				                                        required='' data-parsley-required-message='Informe a altura do aluno' ></div>
				                                   
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style='color:#114769' for='dt_nasc_resp'>Peso</label></div>
				                             
				                                        
				                                <div class=form-group><input style='width:450px;height:30px;' type=text class='form-control' value='<%out.print(dm.getPeso()); %>' name='peso' placeholder='Data de nascimento do responsável'
				                                        required='' data-parsley-required-message='Informe o peso do aluno' ></div>
				                                        
				                                      
				                                        
				                                <div class=form-group><Strong style='margin-right: 50px;color:black;'>Tipo Sanguíneo:</Strong><select required class= 'sele' name="tipo_s">
				                                	
				                                	<option selected value='<% out.print(dm.getTipo_sanguineo());%>'><%out.print(dm.getTipo_sanguineo()); %></option>
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
				                                	<option selected value='<% out.print(dm.getDoencas_cronicas());%>'><%out.print(dm.getDoencas_cronicas()); %></option>
				                                	<option value='nenhuma'>Nenhuma</option>
				                                	<option value='poucas'>Poucas</option>
				                                	<option value='muitas'>Muitas</option>
				                              
				                                </select><br/><br/></div>
				                                
				                                <div class=form-group><Strong style='margin-right: 95px;color:black;'>Alergias:</Strong><select required class= 'sele' name="alergias">
				                                	<option selected value='<% out.print(dm.getAlergias());%>'><%out.print(dm.getAlergias()); %></option>
				                                	<option value='nenhuma'>Nenhuma</option>
				                                	<option value='poucas'>Poucas</option>
				                                	<option value='muitas'>Muitas</option>
				                              
				                                </select><br/><br/></div>
				                                
				                                <div class=form-group><Strong style='margin-right: 20px;color:black;'>Toma medicamentos:</Strong><select required class= 'sele' name="medicamentos">
				                                	<option selected value='<% out.print(dm.getMedicamentos());%>'><%out.print(dm.getMedicamentos()); %></option>
				                                	<option value='sim'>Sim</option>
				                                	<option value='não'>Não</option>
				                                	
				                              
				                                </select><br/><br/></div>
				                               
				                           
	
												<button type='submit' class='btn-small01 btn-red' style='margin-left:85px;float:left;' id='send'> Salvar</button>
												<a href='../validadores/grm/excluiralu.jsp?aluno=<% out.print(alu); %>' class='btn-small01 btn-red' style='margin-left:265px;background:red;' id='send'> Excluir</a>
												
												</form>
	
	
	
	
	
				</div>
				</div>
				</div>
				
				</section>
	





</body>
</html>
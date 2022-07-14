<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 
 
 <%
 	String sessao = (String) session.getAttribute("grm");
 	
 	if(sessao==null){
 		response.sendRedirect("login.jsp");
 	}
 
 
 
 %>
 
 
 
<!DOCTYPE html>
<html>
<head>

	<title>Novo Treinador</title>

	<meta charset="utf-8">	
	<meta name=description content="">
	<meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="shortcut icon" href=favicon.ico>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script>


</head>
<body>

<h4><a href='treinadores.jsp' style='margin-left:20px;'><- Voltar</a></h4>
           					                											
				                           <h2 class="heading small" style="margin-left:60px;"><span>Treinador</span></h2><br>
				                            <form action = '../validadores/grm/validatreinador.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                            	 <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for=cpf>Cpf</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='cpf' placeholder='Cpf'
				                                        required='' data-parsley-required-message='Informe cpf'></div>
				                            	
				                            	
				                            	<div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for='nome'>Nome</label></div>
				                            
				                                <div class=form-group><input style="width:450px;height:30px;" type='text' class='form-control' name='nome' placeholder='Nome'
				                                        required='' data-parsley-required-message='Informe nome'></div>
				                                        
				                                 <div class=form-group style='margin-bottom:0px;margin-left:120px;'><label style="color:#114769" for='dt_nasc'>Data de nascimento</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='dt_nasc' placeholder='Data de nascimento.Ex: 2000-11-14'
				                                        required='' data-parsley-required-message='Informe data de nascimento'></div>
				                                  
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for='rg'>RG</label></div>
				                                  
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='rg' placeholder='RG'
				                                        required='' data-parsley-required-message='Informe Rg'></div>
				                                        
				                               
				                                        
				                                        
				                                <div class=form-group><Strong style='margin-right: 25px;color:black;'>Sexo:</Strong><select name="sexo">
				                                		<%
				                                				out.print("<option value='M'>Masculino</option>");
				                                				out.print("<option value='F'>Feminino</option>");
				                                			
				                                		%>	
				                                	
				                                	                		
				                                </select><br/></div>
				                                
				                                <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for='rg'>Senha</label></div>
				                                  
				                                <div class=form-group><input style="width:450px;height:30px;" type=password class='form-control' name='senha' placeholder='Senha'
				                                        required='' data-parsley-required-message='Informe a Senha'></div>
				                                		
				                                 <div class=form-group>
				                                    <button type='submit' class='btn-small01 btn-red' style='margin-left:125px;float:left;' id='send'> Cadastrar</button>
				                                </div>
				                                		
				                                
				                            </form>
				                        
           
       

   







</body>
</html>
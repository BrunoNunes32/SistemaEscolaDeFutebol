<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String sessao = (String) session.getAttribute("grm");

if(sessao==null){
	response.sendRedirect("login.jsp");
}

%>



    
<!DOCTYPE html>
<html lang='pt-br'>
<head>

	<title>Novo turno</title>

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

<h4><a href='turnos.jsp' style='margin-left:20px;'><- Voltar</a></h4>


           					                											
				                           <h2 class="heading small" style="margin-left:60px;"><span>Turno</span></h2><br>
				                            <form action = '../validadores/grm/validarturno.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                            
				                            	 <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for=cpf>Nome</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='turno' placeholder='Turno'
				                                        required='' data-parsley-required-message='Informe o nome do turno' ></div>
				                            	
				                            	
				                            	<div class=form-group style='margin-bottom:0px;margin-left:150px;'><label style="color:#114769" for='nome'>Horário de Início</label></div>
				                            
				                                <div class=form-group><input style="width:450px;height:30px;" type='time' class='form-control' name='horini' placeholder='Horário de Início'
				                                        required='' data-parsley-required-message='Informe o horário de início'  ></div>
				                                        
				                                 <div class=form-group style='margin-bottom:0px;margin-left:140px;'><label style="color:#114769" for='dt_nasc'>Horário de Término</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=time class='form-control' name='horfim' placeholder='Horário de Término'
				                                        required='' data-parsley-required-message='Informe o horário de término' ></div>
				                                  
				                                
				                                  
				                                
				                                 <div class=form-group>
				                                    <button type='submit' class='btn-small01 btn-red' style='margin-left:125px;float:left;' id='send'> Cadastrar</button>
												
				                                </div>
				                                		
				                                
				                            </form>
				                        
           
       

   







</body>
</html>
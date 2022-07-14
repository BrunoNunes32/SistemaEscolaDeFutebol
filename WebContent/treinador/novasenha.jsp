<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Models.Treinador"%>
    
    
<%
	String sessao = (String) session.getAttribute("treinador");
	
	if(sessao==null || Treinador.getTreina(sessao)==null){
		response.sendRedirect("index.jsp");
	}


%>

    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar senha</title>

	<meta name=description content="">
	<meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="shortcut icon" href=favicon.ico>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script>


</head>
<body>


<h4><a href='index.jsp' style='margin-left:20px;'><- Voltar</a></h4>


           					                											
				                           <h2 class="heading small" style="margin-left:80px;margin-bottom:-10px;"><span>Nova Senha</span></h2><br>
				                            <form action = '../validadores/validasenhatreina.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                            
				                            	 <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for=cpf>Senha</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=password class='form-control' name='senha' placeholder='Digite a nova senha'
				                                        required='' data-parsley-required-message='Informe a nova senha' ></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:150px;'><label style="color:#114769" for=cpf>Confirme a Senha</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=password class='form-control' name='confsenha' placeholder='Confirme a nova senha'
				                                        required='' data-parsley-required-message='Informe a confirmação de senha' ></div>
				                            	
				                            	
				                            	
				                                 <div class=form-group>
				                                    <button type='submit' class='btn-small01 btn-red' style='margin-left:125px;float:left;' id='send'> Salvar</button>
												
				                                </div>
				                                		
				                                
				                            </form>
				                        






	




</body>
</html>
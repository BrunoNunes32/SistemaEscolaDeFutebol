<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="Models.Treinador" %>
    



<html>

<head>
	<meta charset=utf-8>
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>soccer club</title>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script>



</head>



<body>


<div class=loginWrapper>
        <div class=loginHolderWrap>
            <div class=loginHolder>
                <h1><a href=index.jsp><img src=images/logo.png alt=image></a></h1>

                <div class=container>
                    <div class=row>
                    	<%		
                    			String sessao = (String) session.getAttribute("treinador");		
                    	            	
                    			
   		            			if(sessao==null){
  
				                    out.println(
				                        "<div class=login_form>"+
				                           "<h2 class=heading>Área do Treinador</h2>"+
				                            "<form action = '../validadores/validalogintreinador.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>"+
				                                "<div class=form-group><input type=text class='form-control' name='login' placeholder='Cpf'"+
				                                        "required='' data-parsley-required-message='Informe usuario'></div>"+
				                                "<div class=form-group><input type='password' class='form-control' name='senha'"+
				                                        "placeholder='Senha' required='' "+
				                                        "data-parsley-required-message='Por favor informe a senha'>"+
				                                "</div>"+
				                                "<div class=form-group>"+
				                                    "<button type=submit class='btn btn-red' id=send>Login</button>"+
				                                "</div>"+
				                                "<div class=form-message></div>"+
				                            "</form>"+
				                        "</div>");
                    			}else{
                    				response.sendRedirect("index.jsp");
                    				
                    				
                    				
                    				
                    			}
                        
                       %> 
                        
                    </div>
                </div>
            </div>
        </div>
       </div>
        <script src=js/vendor/vendor.js> </script> <script src=js/main.js> </script> 
        
  </body> 
        
</html>
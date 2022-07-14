<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="Validacoes.LoginFuncionario" %>
    


<%
String sessao = (String) session.getAttribute("grm");

if(sessao!=null){
	response.sendRedirect("index.jsp");
}

%>





    
<!DOCTYPE html>
<html>
<head>


<meta charset=utf-8>
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>Login</title>
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
                				ArrayList<LoginFuncionario> funcs = LoginFuncionario.funcionarios();
                    	
                    			int tamanho = funcs.size();
                    	
                    	
                    			if(tamanho!=0){
                    	
          			
				                    out.println(
				                        "<div class=login_form>"+
				                           "<h2 class=heading>Área Gerencial</h2>"+
				                            "<form action = '../validadores/validalogingrm.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>"+
				                                "<div class=form-group><input type=text class='form-control' name='login' placeholder='Usuário'"+
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
                    				 out.println(
     				                        "<div class=login_form>"+
     				                           "<h2 class=heading>Área Gerencial</h2>"+
     				                            "<form action = '../validadores/grm/validagrm.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>"+
     				                                "<div class=form-group><input type=text class='form-control' name='login' placeholder='Novo usuário'"+
     				                                        "required='' data-parsley-required-message='Informe usuario'></div>"+
     				                                "<div class=form-group><input type='password' class='form-control' name='senha'"+
     				                                        "placeholder='Nova senha' required='' "+
     				                                        "data-parsley-required-message='Por favor informe a senha'>"+
     				                                "</div>"+
     				                                "<div class=form-group>"+
     				                                    "<button type=submit class='btn btn-red' id=send>Cadastrar</button>"+
     				                                "</div>"+
     				                                "<div class=form-message></div>"+
     				                            "</form>"+
     				                        "</div>");
                    				
                    			}
         
                       %> 
                        
                    </div>
                </div>
            </div>
        </div>
        <script src=js/vendor/vendor.js> </script> <script src=js/main.js> </script> 








</div>




</body>
</html>
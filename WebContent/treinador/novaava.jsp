<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Treinador"%>
    
<% String sessao = (String) session.getAttribute("treinador");if(sessao==null){response.sendRedirect("login.jsp");} 

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

<h4><a href='avaliacoes.jsp' style='margin-left:20px;'><- Voltar</a></h4>

<section class="register_wrapper clearfix" style="margin-top:-150px;">
            <div class=container>
                <div class=row>
                    <div class=register_form >
				                           <h2 class=heading>Nova Avaliação</h2>

				                            <form action = '../validadores/validaava.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                                <div class=form-group><input type=text class='form-control' name='nome' placeholder='Nome da avaliação'
				                                        required='' data-parsley-required-message='Informe o nome'></div>
				                                <div class=form-group><input type=text class='form-control' name='nota' placeholder='nota máxima'
				                                        required='' data-parsley-required-message='Informe a nota'></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;'><label for='dt_aplicacao'>Data de aplicação</label></div>
				                                <div class=form-group><input type=date class='form-control' name='dt_aplicacao' placeholder=''
				                                        required='' data-parsley-required-message='Informe a data de aplicação '></div>
				                                        
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
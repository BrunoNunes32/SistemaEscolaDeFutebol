<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Turno" import="java.util.ArrayList"%>
    
    
<%
String sessao = (String) session.getAttribute("grm");

if(sessao==null){
	response.sendRedirect("login.jsp");
}

ArrayList<Turno> turnos = Turno.turnos();


%>



    
<!DOCTYPE html>
<html lang='pt-br'>
<head>

	<title>Novo Evento</title>

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

<h4><a href='eventos.jsp' style='margin-left:20px;'><- Voltar</a></h4>


           					                											
				                           <h2 class="heading small" style="margin-left:60px;"><span>Evento</span></h2><br>
				                            <form action = '../validadores/grm/validaevento.jsp' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                            
				                            	 <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for=cpf>Nome</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='nome' placeholder='Nome'
				                                        required='' data-parsley-required-message='Informe o nome do turno' ></div>
				                            	
				                            	
				                            	 <div class=form-group><Strong style='margin-right: 25px;color:black;'>Turno (opcional):</Strong><select  required class= 'sele' name="turno">
				                            	 	<option value='--//--'>--//--</option>
				                                	<%
				                                	for(Turno tu: turnos){
				                                		out.print("<option value='"+tu.getTurno()+"'>"+tu.getTurno()+"</option>");
				                    	          	}
				                                	
				                                	%>	
				                                </select><br/><br/></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:140px;'><label style="color:#114769" for='dt_nasc'>Data inicial do evento</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='inicio' placeholder='Data inicial do evento'
				                                        required='' data-parsley-required-message='digite data inicial do evento' ></div>
				                                        
				                                
				                                  
				                                 <div class=form-group style='margin-bottom:0px;margin-left:140px;'><label style="color:#114769" for='dt_nasc'>Data final do evento (opcional)</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='fim' placeholder='Data Final do evento (opcional)'
				                                         ></div>
				                                  
				                                
				                                 <div class=form-group>
				                                    <button type='submit' class='btn-small01 btn-red' style='margin-left:125px;float:left;' id='send'> Cadastrar</button>
												
				                                </div>
				                                		
				                                
				                            </form>
				                        
           
       

   







</body>
</html>
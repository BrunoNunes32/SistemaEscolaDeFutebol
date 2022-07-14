<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Models.Evento" import="Models.Turno" import="java.util.ArrayList"%>
    

<%
String sessao = (String) session.getAttribute("grm");

if(sessao==null){
	response.sendRedirect("login.jsp");
}

int evento;
Evento eve;

try{
	
	evento =  Integer.parseInt(request.getParameter("evento"));

	eve = Evento.getEvento(evento);
	
	if(eve==null){
		out.print("<script language='javascript'> location.href='eventos.jsp' </script>");
		if(true){return;}
	}
	
}catch(Exception e){
	out.print("<script language='javascript'> location.href='eventos.jsp' </script>");
	if(true){return;}
}


ArrayList<Turno> turnos = Turno.turnos();



%>
    
    
<!DOCTYPE html>
<html lang='pt-br'>
<head>

	<meta charset="utf-8">
	<title>Alterar evento</title>
	<meta name=description content="">
	<meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="shortcut icon" href=favicon.ico>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script>

</head>
<body>

<%

String nome = eve.getNome();
String data_ini = eve.getData_ini();
String data_fim = eve.getData_termino();
String turno = eve.getTurno();



%>

<h4><a href='eventos.jsp' style='margin-left:20px;'><- Voltar</a></h4>


           					                											
				                           <h2 class="heading small" style="margin-left:60px;"><span>Evento</span></h2><br>
				                            <form action = '../validadores/grm/salvar_evento.jsp?evento=<%out.print(evento); %>' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                            
				                            	 <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for=cpf>Nome</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" <% if(nome.equals("Período de Matrícula")){out.print("disabled");} %> type=text class='form-control' name='nome' placeholder='Nome'
				                                        required data-parsley-required-message='Informe o nome do turno' value='<% out.print(nome); %>' ></div>
				                            	
				                            	
				                            	 <div class=form-group><Strong style='margin-right: 25px;color:black;'>Turno (opcional):</Strong><select  required class= 'sele' name="turno">
				                            	 	<option value='--//--'>--//--</option>
				                                	<%
				                                	for(Turno tu: turnos){
				                                		if(turno!=null &&  tu.getTurno().equals(turno)){
				                                			out.print("<option selected value='"+tu.getTurno()+"'>"+tu.getTurno()+"</option>");
				                                		}else{
				                                			out.print("<option value='"+tu.getTurno()+"'>"+tu.getTurno()+"</option>");
				                                		}
				                    	          	}
				                                	
				                                	%>	
				                                </select><br/><br/></div>
				                                        
				                                <div class=form-group style='margin-bottom:0px;margin-left:140px;'><label style="color:#114769" for='dt_nasc'>Data inicial do evento</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='inicio' placeholder='Data inicial do evento'
				                                        required data-parsley-required-message='digite data inicial do evento' value=<% out.print(data_ini); %> ></div>
				                                        
				                                
				                                  
				                                 <div class=form-group style='margin-bottom:0px;margin-left:140px;'><label style="color:#114769" for='dt_nasc'>Data final do evento (opcional)</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=date class='form-control' name='fim' placeholder='Data Final do evento (opcional)'
				                                         value='<% out.print(data_fim); %>'></div>
				                                  
				                                
				                                 <div class=form-group>
				                                 	<%
				                                 		if(nome.equals("Período de Matrícula")){
				                                 			out.print("<button type='submit' class='btn-small01 btn-red' style='margin-left:125px;float:left;' id='send'> Salvar</button>");
				                                 		}else{
				                                 			out.print("<button type='submit' class='btn-small01 btn-red' style='margin-left:85px;float:left;' id='send'> Salvar</button>"+
															"<a href='../validadores/grm/excluirevento.jsp?evento="+evento+"' class='btn-small01 btn-red' style='margin-left:265px;background:red;' id='send'> Excluir</a>");
				                                 		}
				                                 	%>
				                                   
				                                </div>
				                                		
				                                
				                            </form>
				                        

</body>
</html>
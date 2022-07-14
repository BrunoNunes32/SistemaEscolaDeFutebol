<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="Models.Turno"%>
    


<%
String sessao = (String) session.getAttribute("grm");

if(sessao==null){
	response.sendRedirect("login.jsp");
}


String turno = request.getParameter("turno");


Turno tur = Turno.getTurno(turno);

if(tur==null){
	out.print("<script language='javascript'>location.href='turnos.jsp'</script>");
	if(true){return;}
}



%>





 
    
<!DOCTYPE html>
<html lang='pt-br'>
<head>

	<title>Alterar turno</title>

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


           					
           				<% 
           					
           				
           					String nome = tur.getTurno(); 	
           					String horini = tur.getInicio_aulas();
           					String horfim = tur.getFim_aulas();
           					int qtd_alunos = tur.getQtd_alunos();
           					
           					
           					
           				
           				
           				%>	
           					                											
				                           <h2 class="heading small" style="margin-left:60px;"><span>Turno</span></h2><br>
				                            <form action = '../validadores/grm/salvar_turno.jsp?turno=<%out.print(nome); %>' data-parsley-validate='' name='contact' class='formlogin clearfix' method='POST'>
				                            
				                            	 <div class=form-group style='margin-bottom:0px;margin-left:180px;'><label style="color:#114769" for=cpf>Nome</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='turno' placeholder='Turno'
				                                        required='' data-parsley-required-message='Informe o nome do turno' disabled value='<% out.print(nome); %>'></div>
				                            	
				                            	
				                            	<div class=form-group style='margin-bottom:0px;margin-left:150px;'><label style="color:#114769" for='nome'>Horário de Início</label></div>
				                            
				                                <div class=form-group><input style="width:450px;height:30px;" type='time' class='form-control' name='horini' placeholder='Horário de Início'
				                                        required='' data-parsley-required-message='Informe o horário de início'  value='<% out.print(horini); %>'></div>
				                                        
				                                 <div class=form-group style='margin-bottom:0px;margin-left:140px;'><label style="color:#114769" for='dt_nasc'>Horário de Término</label></div>
				                                        
				                                <div class=form-group><input style="width:450px;height:30px;" type=time class='form-control' name='horfim' placeholder='Horário de Término'
				                                        required='' data-parsley-required-message='Informe o horário de término' value='<% out.print(horfim); %>'></div>
				                                  
				                                <div class=form-group style='margin-bottom:0px;margin-left:140px;'><label style="color:#114769" for='rg'>Quantidade de Alunos</label></div>
				                                  
				                                <div class=form-group><input style="width:450px;height:30px;" type=text class='form-control' name='qtd_alunos' placeholder='Quantidade de alunos'
				                                        required='' data-parsley-required-message='Informe a quantidade de alunos a ser registrada nesse turno' value='<% out.print(qtd_alunos); %>'></div>
				                                        
				                               
				                                        
				                                        
				                             
				                                 <div class=form-group>
				                                    <button type='submit' class='btn-small01 btn-red' style='margin-left:85px;float:left;' id='send'> Salvar</button>
												<a href='../validadores/grm/excluirturno.jsp?turno=<% out.print(nome); %>' class='btn-small01 btn-red' style='margin-left:265px;background:red;' id='send'> Excluir</a>
				                                </div>
				                                		
				                                
				                            </form>
				                        
           
       

   







</body>
</html>
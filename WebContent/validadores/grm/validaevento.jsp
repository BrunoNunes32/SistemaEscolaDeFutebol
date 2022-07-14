<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="Models.Turno" import="Models.Evento" import="Validacoes.Data"%>
    
   
<% 
	String sessao = (String) session.getAttribute("grm");

	if(sessao==null){
		response.sendRedirect("../../grm/login.jsp");

	}
	
%>
	



 
    
    
<!DOCTYPE html >
<html lang='pt-br'>
<head>
<meta charset="utf-8">
<title>Validando</title>
</head>
<body>

<% 	
		
	
	String nome_evento = request.getParameter("nome");
	String turno_evento = request.getParameter("turno");
	String data_inicio = request.getParameter("inicio");
	String data_termino = request.getParameter("fim");
	String matricula = request.getParameter("matricula");
	
	
	if(data_inicio!=null){
		if(matricula!=null && matricula.equals("bamerindus")){
			nome_evento = "Período de Matrícula";
			turno_evento = null;
			
			Data datatest = new Data();
			datatest.setDataanalise(data_inicio);
			
			String res_data = datatest.comparativo();
			String res_data2 = Data.entre_datas(data_inicio, data_termino);
			
			if(res_data.equals("menor")){
				out.print("<script language='javascript'>alert('O período de inscrições deve começar hoje ou em uma data futura!');location.href='../../grm/eventos.jsp';</script>");
				if(true){return;}			
			}else if(!res_data2.equals("menor")){
				out.print("<script language='javascript'>alert('Digite um período válido!');location.href='../../grm/eventos.jsp';</script>");
				if(true){return;}
			}
			
			
			Evento evento = new Evento(nome_evento,turno_evento,data_inicio,data_termino);
			
			String res = evento.cadastra_evento();
			
			if(res.equals("Evento cadastrado com sucesso!")){
				
				out.print("<script language='javascript'>alert('Período definido com sucesso!');location.href='../../grm/eventos.jsp';</script>");
				
			}else if (res.equals("evento existente!")){
				out.print("<script language='javascript'>alert('O período de mátricula já foi definido!');location.href='../../grm/eventos.jsp';</script>");
			}else{
				out.print("<script language='javascript'>alert('Algum campo foi preenchido de forma incorreta!');location.href='../../grm/eventos.jsp';</script>");
			}
			
			if(true){return;}
			
		}

		//Eventos comuns
		
		
		if(data_termino != null && data_termino.equals("")){
			data_termino = null;
		}
		
		if(turno_evento==null || turno_evento.equals("--//--")){
			turno_evento = null;
		}
		
		ArrayList<Evento> eventos = Evento.eventos();
		
		Evento matri = null;
		
		for(Evento ev: eventos){
			if(ev.getNome().equals("Período de Matrícula")){
				matri = ev;
			}
			
		}
		
		if(matri==null){
			out.print("<script language='javascript'>location.href='../../grm/eventos.jsp';</script>");
			if(true){return;}
		}
		
		
		
		
		
		if(nome_evento!=null){
			if(turno_evento!=null && turno_evento.equals("")){
				turno_evento = null;
			}
			
			if(data_termino!=null && data_termino.equals("")){
				data_termino = null;
			}
			
			
			
			
			
			Evento evento = new Evento(nome_evento,turno_evento,data_inicio,data_termino);
			
			String res = evento.cadastra_evento();
			
			if(res.equals("Evento cadastrado com sucesso!")){
				out.print("<script language='javascript'>alert('Evento definido com sucesso!');location.href='../../grm/eventos.jsp';</script>");
				
			}else if (res.equals("evento existente!")){
				out.print("<script language='javascript'>alert('O evento com tal nome já foi definido!');location.href='../../grm/eventos.jsp';</script>");
			}else{
				out.print("<script language='javascript'>alert('Algum campo foi preenchido de forma incorreta!');location.href='../../grm/eventos.jsp';</script>");
			}
			
				
		}else{
			out.print("<script language='javascript'>location.href='../../grm/eventos.jsp';</script>");
		}
		
		
	}else{
		out.print("<script language='javascript'>location.href='../../grm/eventos.jsp';</script>");
	}
	


%>


</body>
</html>
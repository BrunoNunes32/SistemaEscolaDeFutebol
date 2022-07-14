<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" 
	import="Models.Aluno" import="Models.Dados_medicos"
    import="Models.Treinador" import="Models.Turno" %>
    
    
<%

String sessao = (String) session.getAttribute("grm");

if(sessao==null){
	response.sendRedirect("../../grm/");
}







String aluno = request.getParameter("aluno");
String treinador = request.getParameter("treinador");
String turno = request.getParameter("turno");
String altura = request.getParameter("altura");
String peso = request.getParameter("peso");
String tipo_s = request.getParameter("tipo_s");
String doencas_c = request.getParameter("doencas_c");
String alergias = request.getParameter("alergias");
String medicamentos = request.getParameter("medicamentos");



Aluno alu = Aluno.dadosAluno(aluno);
Turno tur = Turno.getTurno(turno);
Treinador treina = Treinador.getTreina(treinador);





if(alu==null || alu.getTreinador()==null){
	out.print("<script language='javascript'>window.location.href='../../grm/alunos.jsp' </script>");
	if(true){return;}
}

if(treina==null || tur==null){
	out.print("<script language='javascript'>alert('Turno ou treinador inválidos!'); window.location.href='../../grm/alunos.jsp'; </script>");
	if(true){return;}
}


if(aluno==null || altura==null || peso==null || tipo_s==null || doencas_c==null || alergias==null || medicamentos==null){
	out.print("<script language='javascript'>window.location.href='../../grm/alunos.jsp' </script>");
	if(true){return;}
}else{
	
	try{
		double pes = Double.valueOf(peso).doubleValue();
		double altu = Double.valueOf(altura).doubleValue();
		
		Turno turno_atual = alu.getTurno();
		
		Aluno aluninho = Aluno.dadosAluno(aluno);
		
		aluninho.setTreinador(treina);
		aluninho.setTurno(tur);
		
		
		String resfc =  aluninho.atualiza_cadastro(aluno);
		
		
		
		if(resfc.equals("Cadastro atualizado com sucesso!")){
				
			Dados_medicos dm = new Dados_medicos(aluno,altu,pes,tipo_s,doencas_c,alergias,medicamentos);
			
			String resdm = dm.atualiza_dados();
			
			if(resdm.equals("Dados médicos atualizados com sucesso!")){
				if(turno_atual!=null){
					Turno.adRemovQtd("remove", turno_atual.getTurno());
				}
				
				Turno.adRemovQtd("adiciona", turno);
				
				out.print("<script language='javascript'>alert('Dados médicos e dados escolares atualizados com sucesso!'); window.location.href='../../grm/alunos.jsp'; </script>");
				if(true){return;}
				
			}else{
				out.print("<script language='javascript'>alert('Algum dado médico foi preenchido de forma incorreta!'); window.location.href='../../grm/alunos.jsp'; </script>");
				if(true){return;}
			}
			
			
		
		}else{
			out.print("<script language='javascript'>alert('Algum dado escolar foi preenchido de forma incorreta!'); window.location.href='../../grm/finalimatri.jsp?aluno="+aluno+"'; </script>");
			if(true){return;}
		}
			
	}catch(Exception e){
		out.print("<script language='javascript'>alert('Peso e altura devem ser números!'); window.location.href='../../grm/alteraraluno.jsp?aluno="+aluno+"'; </script>");
		
	}
		
}

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Salvando</title>
</head>
<body>

</body>
</html>
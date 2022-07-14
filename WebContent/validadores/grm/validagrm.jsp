<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="Validacoes.LoginFuncionario"%>
    
    
 
<%
	ArrayList<LoginFuncionario> funcs = LoginFuncionario.funcionarios();
	
	String sessao = (String) session.getAttribute("grm");


	int tamanho = funcs.size();
	
	if(tamanho!=0 || sessao!=null){
		response.sendRedirect("../../grm/login.jsp");
	}

	String usuario = request.getParameter("login");
	String senha = request.getParameter("senha");
	
	
	if(usuario==null || senha==null){
		out.print("<script language='javascript'>location.href='../../grm/login.jsp';</script>");
		if(true){return;}
		
	}else{
		LoginFuncionario lf = new LoginFuncionario(usuario,senha);
		String res = lf.cadastra_usuario();
		
		if(res.equals("Cadastro realizado com sucesso!")){
			out.print("<script language='javascript'>alert('Perfil criado com sucesso!'); location.href='../../grm/login.jsp';</script>");
			if(true){return;}
		}else{
			out.print("<script language='javascript'>alert('Campos excedem o limite ou o usuário informado já existe!'); location.href='../../grm/login.jsp';</script>");
			if(true){return;}
		}
		
		
		
		
		
		
		
		
	}
	
	
	
	



%> 
 
 
 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrando</title>
</head>
<body>

</body>
</html>
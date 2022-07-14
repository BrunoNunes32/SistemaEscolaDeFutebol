<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="Models.Treinador" %>
<%@ page import="java.util.ArrayList" import="Models.Aluno" import="Models.Turno"%>

<% 
	String sessao = (String) session.getAttribute("treinador");
	if(sessao==null){
		response.sendRedirect("login.jsp");
	}
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
	<title>Página Inicial</title>
	<meta charset=utf-8>
	<meta name=description content="">
	<meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <title>soccer club</title>
    <link rel="shortcut icon" href=favicon.ico>
    <link rel=stylesheet href=vendor.css>
    <link rel=stylesheet href=style.css>
    <link rel=stylesheet type=text/css href=css/layerslider.css> <script src=js/vendor/modernizr.js> </script>


</head>
<body>
 <!--[if lt IE 10]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
    <div class=wrapper>
        <header class=header-main>
            <div class=header-upper>
                <div class=container>
                    <div class=row>
                        <!-- <ul>
                            <li><a href="#">Área do Aluno</a></li>
                        </ul> -->
                    </div>
                </div>
            </div>
            <div class="header-lower clearfix">
                <div class=container>
                    <div class=row>
                        <h1 class=logo><a href=index.jsp><img src=images/logo.png alt=image></a></h1>

                        <div class=menubar>
                            <nav class=navbar>
                                <div class=nav-wrapper>
                                    <div class=navbar-header>
                                        <button type=button class=navbar-toggle><span class=sr-only>Toggle
                                                navigation</span>
                                            <span class=icon-bar></span></button>
                                    </div>
                                    <div class=nav-menu>
                                        <ul class="nav navbar-nav menu-bar">
                                            <li><a href=index.jsp>Home <span></span> <span></span>
                                                    <span></span> <span></span></a></li>
                                  
                                            <li><a href=turma.jsp class=active >Minha Turma<span></span> <span></span>
                                                    <span></span>
                                                    <span></span></a></li>
                                            <li><a href=avaliacoes.jsp>Avaliações <span></span> <span></span> <span></span>
                                                    <span></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </div>
                        <div class=social><a href=https://www.facebook.com/templatespoint.net class=facebook
                                target=_blank><i class="fa fa-facebook"></i></a> <a href=https://twitter.com/itobuztech
                                class=twitter target=_blank><i class="fa fa-twitter"></i></a> <a
                                href=https://www.instagram.com class=instagram target=_blank><i
                                    class="fa fa-instagram"></i></a></div>
                    </div>
                </div>
            </div>
        </header>
            
        <div style="margin-top:150px;text-align:center;margin-left:16px;">
			        
			   
			       	<% 
			       	
			       	ArrayList<Aluno> alunos = Treinador.alunos(sessao);
			       	
			       	int tamanho = alunos.size();
			       	
			       	if(tamanho==0){
			       		out.print("<h4>Você não possui uma turma definida</h4>");
			       		
			       	}else{
			       		out.print("<table class='table-bordered' style='height:220px;'>"+
						        "<tr style='border: 2px black solid'><td style='width:200px;'><strong>Cpf</strong></td><td style='width:545px'><strong>Nome</strong></td>"+
						        "<td style='width:165px'><strong>Dt.nasc</strong></td><td style='width:55px'><strong>Sexo</strong></td><td style='width:155px'><strong>Desempenho</strong></td>"+
						        "<td style='width:215px'><strong>Turno</strong></td></tr>"
						        );
				       	for(Aluno alu: alunos){
				       		
				       		String cpf = alu.getCpf();
				       		String nome = alu.getNome();
				       		String dt_nasc = alu.getDt_nasc();
				       		String sexo = alu.getSexo();
				       		String turno="";
				       		if(alu.getTurno()!=null){
				       			turno = alu.getTurno().getTurno();
				       		}
				       		
				       		out.print("<tr>");
				       		out.print("<td>"+cpf+"</td>");
				       		out.print("<td>"+nome+"</td>");
				       		out.print("<td>"+dt_nasc+"</td>");
				       		out.print("<td>"+sexo+"</td>");
				       		out.print("<td><a href='desempenho.jsp?aluno="+cpf+"'>Ver &raquo;</td>");
				       		out.print("<td>"+turno+"</td>");
				       		out.print("</tr>");   		
				       	}
				       	
				       	out.print("</table>");
			       	
			       	}
			       	
			       	%>
			        
			       
        
        		</div>
       
        
     </div>
        
        
       
</body>
</html>
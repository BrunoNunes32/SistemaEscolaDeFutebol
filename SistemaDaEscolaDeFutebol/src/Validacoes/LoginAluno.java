package Validacoes;

import BD.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;



public class LoginAluno extends Conexao{
	public LoginAluno(String usuario,String senha) {
		this.usuario = usuario;
		this.senha = senha;
	}
	
	private String senha;
	private String usuario;
	
	
	public String cadastra_usuario() {
		try {
			Connection conn = super.getConn();
			
			String sql = "insert into loginaluno(usuario,senha) values(?,?)";
			
			PreparedStatement insercao = conn.prepareStatement(sql);
			insercao.setString(1, this.usuario);
			insercao.setString(2, this.senha);
			insercao.execute();
			
			
			conn.close();
			return "Cadastro realizado com sucesso!";
			
			
		}catch(Exception e) {
			return "Houve um problema ao conectar-se ao banco de dados,tente novamente mais tarde!";
		}		
	}
	
	public int valida_login() {
		try {
			Connection conn = super.getConn();
			
			String sql = "select * from loginaluno where usuario=? and senha=?";
			
			PreparedStatement query = conn.prepareStatement(sql);
			query.setString(1, this.usuario);
			query.setString(2, this.senha);
			ResultSet resultado = query.executeQuery();
			
			resultado.last();
		
			if(resultado.getRow()!=0) {
				conn.close();
				return 1;
			}else {
				conn.close();
				return 0;
			}
			
		}catch(Exception e) {
			return 10;
		}		
		
	}
	
	public static String altera_senha(String aluno,String senha) {
		try {
			Connection conn = getConn();
			
			String sql = "update loginaluno set senha=? where usuario=?";
			
			PreparedStatement comando = conn.prepareStatement(sql);
			comando.setString(1, senha);
			comando.setString(2, aluno);
			comando.execute();
			
			conn.close();
			
			return "sucesso";
			
			
			
		}catch(Exception e) {
			return "erro";
		}
	}
	
	
	

}

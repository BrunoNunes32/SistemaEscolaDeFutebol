package Validacoes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import BD.Conexao;
import Models.Aluno;
import Models.Responsavel;
import Models.Treinador;
import Models.Turno;

public class LoginFuncionario extends Conexao{
	public LoginFuncionario(String usuario,String senha) {
		this.usuario = usuario;
		this.senha = senha;
	}
	
	private String senha;
	private String usuario;
	
	public String cadastra_usuario() {
		try {
			Connection conn = super.getConn();
			
			String sql = "insert into loginfuncionario(usuario,senha) values(?,?)";
			
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
			
			String sql = "select * from loginfuncionario where usuario=? and senha=?";
			
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
	
	public static ArrayList<LoginFuncionario> funcionarios() {
		try{
			Connection conn = getConn();
			
			String sql = "select * from loginfuncionario";
			PreparedStatement query = conn.prepareStatement(sql);
			ResultSet resultado = query.executeQuery();
			ArrayList<LoginFuncionario> funcs = new ArrayList<LoginFuncionario>(); 
			
			while(resultado.next()) {
				LoginFuncionario func = new LoginFuncionario(resultado.getString("usuario"),resultado.getString("senha"));
				funcs.add(func);	
			}
			
			conn.close();
			return funcs;
			
			
		}catch(Exception e) {
			return new ArrayList<LoginFuncionario>();
			
		}
		
	}
	
	public static String deleta_func(String funcionario) {
		try {
			Connection conn = getConn();
			String sql = "delete from loginfuncionario where usuario=?";
			PreparedStatement comando = conn.prepareStatement(sql);
			comando.setString(1, funcionario);
			
			comando.execute();
			
			conn.close();
			
			return "sucesso";
					
		}catch(Exception e) {
			return "erro";
		}
		
		
		
	}
	
	

}

package Models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import BD.Conexao;

public class Responsavel extends Conexao{
	public Responsavel(String nome,String dt_nasc,String rg,String cpf,String sexo,String telefone) {
		this.nome = nome;
		this.dt_nasc= dt_nasc;
		this.rg=rg;
		this.cpf=cpf;
		this.sexo=sexo;
		this.telefone = telefone;
		
		
		
		
	}
	
	public String getNome() {
		return nome;
	}
	public String getDt_nasc() {
		return dt_nasc;
	}
	public String getRg() {
		return rg;
	}
	public String getCpf() {
		return cpf;
	}
	public String getSexo() {
		return sexo;
	}
	public String getTelefone() {
		return telefone;
	}

	private String nome;
	private String dt_nasc;
	private String rg;
	private String cpf;
	private String sexo;
	private String telefone;
	
	public String cadastra_responsavel() {
		try {
			
			int num_linhas = this.verificaExistencia(this.cpf);
			
			if(num_linhas==1) {
			
			
			Connection conn = super.getConn();
			
			String sql = "insert into responsavel(Nome,dt_nasc,rg,cpf,sexo,telefone) values(?,?,?,?,?,?) ";
			
			PreparedStatement comando = conn.prepareStatement(sql);
			
			comando.setString(1,this.nome);
			comando.setString(2, this.dt_nasc);
			comando.setString(3, this.rg);
			comando.setString(4, this.cpf);
			comando.setString(5, this.sexo);
			comando.setString(6, this.telefone);
			
			comando.execute();
			
			comando.close();
			
			return "sucesso";
			
		
		
		}else {
			Responsavel r = getResponsa(cpf);
			if(r.dt_nasc.equals(dt_nasc) && r.nome.equals(nome)  && r.rg.equals(rg) && r.sexo.equals(sexo) && r.telefone.equals(telefone)){
				return "";
			}else {
				return "erroexiste";
			}
						
		}
			
		}catch(Exception e) {
			return "erro";
		}
			
	}
	
	public String salva_responsavel() {
		try {
			Connection conn = super.getConn();
			
			
			String sql = "update responsavel set dt_nasc=?,rg=?,telefone=? where cpf=?";
			
			PreparedStatement atuali = conn.prepareStatement(sql);
			atuali.setString(1, this.dt_nasc);
			atuali.setString(2, this.rg);
			atuali.setString(3, this.telefone);
			atuali.setString(4, this.cpf);
			
			
			atuali.execute();
			conn.close();
			
			
			return "Cadastro atualizado com sucesso!";
				//usarei um equals para verificar a resposta depois
			
			
		}catch(Exception e) {
			return "Algum campo foi preenchido de forma incorreta!";
			
		}
	
	
	
}
	
	
	
	public int verificaExistencia(String cpf) {
	try {
		Connection conn = super.getConn(); 
		String sql = "select * from responsavel where cpf=?";
		PreparedStatement comando = conn.prepareStatement(sql);
		comando.setString(1, cpf);
		ResultSet resultado = comando.executeQuery();
		
		resultado.last();
		
		
		if(resultado.getRow()>0) {
			conn.close();
			return 0;
		}else {
			conn.close();
			return 1;
		}
		
		
		}catch(Exception e) {
			return 10;
		}
	}
	
	public static Responsavel getResponsa(String cpf) {
		try{
			Connection conn = getConn();
			
			String sql = "select * from responsavel where cpf=?";
			PreparedStatement query = conn.prepareStatement(sql);
			query.setString(1, cpf);
			ResultSet resultado = query.executeQuery();
			resultado.last();
			
			Responsavel respon;
			
			if(resultado.getRow()!=0) {
				respon = new Responsavel(resultado.getString("nome"),resultado.getString("dt_nasc"),resultado.getString("rg"),resultado.getString("cpf"),resultado.getString("sexo"),resultado.getString("telefone"));
			}else {
				respon = null;
			}
		
			conn.close();
			return respon;
			
			
		}catch(Exception e) {
			Responsavel respon;
			return respon = null;
			
		}		
		
	}
}
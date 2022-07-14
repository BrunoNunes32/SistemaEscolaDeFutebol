package Models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import BD.Conexao;

public class Treinador extends Conexao {
	public Treinador(String nome,String dt_nasc,String rg,String cpf,String sexo ){
		this.nome = nome;
		this.dt_nasc= dt_nasc;
		this.rg=rg;
		this.cpf=cpf;
		this.sexo=sexo;
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

	private String nome;
	private String dt_nasc;
	private String rg;
	private String cpf;
	private String sexo;
	
	public String cadastra_treinador() {
	
	if(this.valida_treinador()==0) {
		try {
			Connection conn = super.getConn();
			
			
			String sql = "insert into treinador(Nome,dt_nasc,rg,cpf,sexo) values(?,?,?,?,?)";
			
			PreparedStatement insercao = conn.prepareStatement(sql);
			insercao.setString(1, this.nome);
			insercao.setString(2, this.dt_nasc);
			insercao.setString(3, this.rg);
			insercao.setString(4, this.cpf);
			insercao.setString(5, this.sexo);
			
			
			
			insercao.execute();
			conn.close();
			
			
			return "Cadastro realizado com sucesso!";
				//usarei um equals para verificar a resposta depois
			
			
		}catch(Exception e) {
			return "Algum campo foi preenchido de forma incorreta!";
			
		}
	
	}else{
		return "Cadastro existente!";
	}
	
}
	
	public String salva_treinador() {
		try {
			Connection conn = super.getConn();
			
			
			String sql = "update treinador set dt_nasc=?,rg=? where cpf=?";
			
			PreparedStatement atuali = conn.prepareStatement(sql);
			atuali.setString(1, this.dt_nasc);
			atuali.setString(2, this.rg);
			atuali.setString(3, this.cpf);
			
			
			atuali.execute();
			conn.close();
			
			
			return "Cadastro atualizado com sucesso!";
				//usarei um equals para verificar a resposta depois
			
			
		}catch(Exception e) {
			return "Algum campo foi preenchido de forma incorreta!";
			
		}
	
	
	
}
	
	

	public int valida_treinador() {
		try {
			Connection conn = super.getConn();
			
			String sql = "select * from treinador where cpf=? ";
			
			PreparedStatement comando = conn.prepareStatement(sql);
			comando.setString(1, this.cpf);
			
			ResultSet resultado = comando.executeQuery();
			
			resultado.last();
			
			if(resultado.getRow()>0) {
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
	
	public static Treinador getTreina(String cpf) {
		try{
			Connection conn = getConn();
			
			String sql = "select * from treinador where cpf=?";
			PreparedStatement query = conn.prepareStatement(sql);
			query.setString(1, cpf);
			ResultSet resultado = query.executeQuery();
			resultado.last();
			
			Treinador treina;
			
			if(resultado.getRow()!=0) {
				treina = new Treinador(resultado.getString("nome"),resultado.getString("dt_nasc"),resultado.getString("rg"),resultado.getString("cpf"),resultado.getString("sexo"));
			}else {
				treina = null;
			}
		
			conn.close();
			return treina;
			
			
		}catch(Exception e) {
			Treinador treina;
			return treina = null;
			
		}		
		
	}
	
	public static ArrayList<Aluno> alunos(String cpf) {
		try{
			Connection conn = getConn();
			
			String sql = "select * from aluno where treinador=? order by Nome";
			PreparedStatement query = conn.prepareStatement(sql);
			query.setString(1, cpf);
			ResultSet resultado = query.executeQuery();
			ArrayList<Aluno> alus = new ArrayList<Aluno>(); 
			
			while(resultado.next()) {
				Aluno alu = new Aluno(resultado.getString("Nome"),resultado.getString("dt_nasc")
						,resultado.getString("rg"),resultado.getString("cpf"),resultado.getString("sexo"),Responsavel.getResponsa(resultado.getString("responsavel")),resultado.getString("dt_matricula"));
				alu.setDt_matricula( resultado.getString("dt_matricula"));
				alu.setTreinador(Treinador.getTreina(resultado.getString("treinador")));
				alu.setTurno(Turno.getTurno(resultado.getString("turno")));
				
				alus.add(alu);
			}
			
			conn.close();
			return alus;
			
		}catch(Exception e) {
			return new ArrayList<Aluno>();
			
		}
		
		
		
	}
	
	public static ArrayList<Treinador> treinadores() {
		try{
			Connection conn = getConn();
			
			String sql = "select * from treinador order by Nome";
			PreparedStatement query = conn.prepareStatement(sql);
			ResultSet resultado = query.executeQuery();
			ArrayList<Treinador> treinas = new ArrayList<Treinador>(); 
			
			while(resultado.next()) {
				Treinador alu = new Treinador(resultado.getString("Nome"),resultado.getString("dt_nasc")
						,resultado.getString("rg"),resultado.getString("cpf"),resultado.getString("sexo"));
				
				treinas.add(alu);
			}
			
			conn.close();
			return treinas;
			
		}catch(Exception e) {
			return new ArrayList<Treinador>();
			
		}
		
		
		
	}
	
	
	
	public static String deleta_treina(String cpf) {
		
		try {
			Connection conn = getConn();
			
			String sql = "delete from desempenho where avaliacao in (select id_avaliacao from avaliacao where treinador=?) ";
			
			PreparedStatement comandola = conn.prepareStatement(sql);
			comandola.setString(1, cpf);
			comandola.execute();
			
			
			
			sql = "delete from avaliacao where treinador=?";
			
			PreparedStatement comandodm = conn.prepareStatement(sql);
			comandodm.setString(1, cpf);
			comandodm.execute();
			
			
			
			
			
			ArrayList<Aluno> alunos = Treinador.alunos(cpf);
			
			if(alunos.size()==0) {
			
				sql = "delete from logintreinador where usuario=?";
				
				PreparedStatement comandodlt = conn.prepareStatement(sql);
				comandodlt.setString(1, cpf);
				comandodlt.execute();
			
			}
			
			
			sql = "delete from treinador where cpf=?";
			
			PreparedStatement comandodese = conn.prepareStatement(sql);
			comandodese.setString(1, cpf);
			comandodese.execute();
				
			
			conn.close();
			return "sucesso";
			
		}catch(Exception e) {
			return "erro";
		}
			
		
	}
		
	public String altera_treina() {
		try {
			Connection conn = super.getConn();
			
			String sql = "update treinador set nome=?,dt_nasc=?,rg=?,sexo=? where cpf=?";
			
			PreparedStatement comando = conn.prepareStatement(sql);
			comando.setString(1, this.nome);
			comando.setString(2, this.dt_nasc);
			comando.setString(3, this.rg);
			comando.setString(4, this.sexo);
			comando.setString(5, this.cpf);
			
			comando.execute();
			
			conn.close();
			
			return "sucesso";
			
			
			
		}catch(Exception e) {
			return "erro";
		}
		
	}
	
	
}

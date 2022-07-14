package Models;

import BD.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.FilterRegistration.Dynamic;




public class Aluno  extends Conexao{
	
	public Aluno(String nome,String dt_nasc,String rg,String cpf,String sexo,Responsavel responsavel,String dt_matricula) {
		this.nome = nome;
		this.dt_nasc= dt_nasc;
		this.rg=rg;
		this.cpf=cpf;
		this.sexo=sexo;
		this.responsavel=responsavel;
		this.dt_matricula = dt_matricula;
	}
	
	
	//Atributos da tabela Aluno
	
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
	public Responsavel getResponsavel() {
		return responsavel;
	}
	
	public String getDt_matricula() {
		return dt_matricula;
	}
	public Turno getTurno() {
		return turno;
	}
	public Treinador getTreinador() {
		return treinador;
	}


	private String nome;
	private String dt_nasc;
	private String rg;
	private String cpf;
	private String sexo;
	private Responsavel responsavel;
	
	private String dt_matricula;
	private Turno turno;
	private Treinador treinador;
	
	
	public String cadastra_aluno() {
		if(this.valida_aluno(this.cpf)==0) {
			try {
				Connection conn = super.getConn();
				
				
				String sql = "insert into aluno(Nome,dt_nasc,rg,cpf,sexo,responsavel,dt_matricula) values(?,?,?,?,?,?,?)";
				
				PreparedStatement insercao = conn.prepareStatement(sql);
				insercao.setString(1, this.nome);
				insercao.setString(2, this.dt_nasc);
				insercao.setString(3, this.rg);
				insercao.setString(4, this.cpf);
				insercao.setString(5, this.sexo);
				insercao.setString(6, this.responsavel.getCpf());
				insercao.setString(7, this.dt_matricula);
				
				
				insercao.execute();
				conn.close();
				
				
				return "Cadastro realizado com sucesso!";
					//usarei um equals para verificar a resposta depois
				
				
			}catch(Exception e) {
				return "Algum campo foi preenchido de forma incorreta!";
				
			}
		
		}else{
			return "Já existe um cadastro com este cpf!";
		}
		
	}
	
	
	public String salva_aluno() {
			try {
				Connection conn = super.getConn();
				
				
				String sql = "update aluno set dt_nasc=?,rg=? where cpf=?";
				
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
	
	
	
	public int valida_aluno(String cpf) {
			try {
				Connection conn = super.getConn();
				
				String sql = "select * from aluno where cpf=? ";
				
				PreparedStatement comando = conn.prepareStatement(sql);
				comando.setString(1, cpf);
				
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
	
	public static String finaliza_cadastro(String cpf,String treinador,String turno,String dt_matricula) {
		
		
		try {
			Connection conn = getConn();
				
			String sql = "update aluno set dt_matricula=?,treinador=?,turno=? where cpf=?";
			
			PreparedStatement atuali = conn.prepareStatement(sql);
			atuali.setString(1, dt_matricula);
			atuali.setString(2, treinador);
			atuali.setString(3, turno);
			atuali.setString(4, cpf);
			
			
			
			atuali.execute();
			conn.close();
			
			
			return "Cadastro atualizado com sucesso!";
				//usarei um equals para verificar a resposta depois
			
			
		}catch(Exception e) {
			return "Algum campo foi preenchido com dados !";
			
		}
		
	}
	
		public static Aluno dadosAluno(String cpf) {
			try{
				Connection conn = getConn();
				
				String sql = "select * from aluno where cpf=?";
				PreparedStatement query = conn.prepareStatement(sql);
				query.setString(1, cpf);
				ResultSet resultado = query.executeQuery();
				resultado.last();
				
				Aluno alu;
				
				if(resultado.getRow()!=0) {
					alu = new Aluno(resultado.getString("Nome"),resultado.getString("dt_nasc"),resultado.getString("rg"),resultado.getString("cpf"),resultado.getString("sexo"),Responsavel.getResponsa(resultado.getString("responsavel")),resultado.getString("dt_matricula"));
					alu.dt_matricula = resultado.getString("dt_matricula");
					alu.treinador = Treinador.getTreina(resultado.getString("treinador"));
					alu.turno = Turno.getTurno(resultado.getString("turno"));
					
				}else {
					alu = null;
				}
				
				conn.close();
				return alu;
				
				
			}catch(Exception e) {
				Aluno alu;
				return alu = null;
				
			}		
			
		}
		
		public static ArrayList<Aluno> alunos() {
			try{
				Connection conn = getConn();
				
				String sql = "select * from aluno where treinador is not null";
				PreparedStatement query = conn.prepareStatement(sql);
				ResultSet resultado = query.executeQuery();
				ArrayList<Aluno> alus = new ArrayList<Aluno>(); 
				
				while(resultado.next()) {
					Aluno alu = new Aluno(resultado.getString("Nome"),resultado.getString("dt_nasc")
							,resultado.getString("rg"),resultado.getString("cpf"),resultado.getString("sexo"),Responsavel.getResponsa(resultado.getString("responsavel")),resultado.getString("dt_matricula"));
					alu.dt_matricula = resultado.getString("dt_matricula");
					alu.treinador = Treinador.getTreina(resultado.getString("treinador"));
					alu.turno = Turno.getTurno(resultado.getString("turno"));
					
					alus.add(alu);
				}
				
				conn.close();
				return alus;
				
				
			}catch(Exception e) {
				return new ArrayList<Aluno>();
				
			}
			
			
			
		}
		
		public static ArrayList<Aluno> matriculas_pe() {
			try{
				Connection conn = getConn();
				
				String sql = "select * from aluno where treinador is null";
				PreparedStatement query = conn.prepareStatement(sql);
				ResultSet resultado = query.executeQuery();
				ArrayList<Aluno> alus = new ArrayList<Aluno>(); 
				
				while(resultado.next()) {
					Aluno alu = new Aluno(resultado.getString("Nome"),resultado.getString("dt_nasc")
							,resultado.getString("rg"),resultado.getString("cpf"),resultado.getString("sexo"),Responsavel.getResponsa(resultado.getString("responsavel")),resultado.getString("dt_matricula"));
					alu.dt_matricula = resultado.getString("dt_matricula");
					alu.treinador = Treinador.getTreina(resultado.getString("treinador"));
					alu.turno = Turno.getTurno(resultado.getString("turno"));
					
					alus.add(alu);
				}
				
				conn.close();
				return alus;
				
				
			}catch(Exception e) {
				return new ArrayList<Aluno>();
				
			}
			
			
			
		}
		
		public static String deleta_aluno(String cpf) {
			try {
				Connection conn = getConn();
				
				String sql = "delete from loginaluno where usuario=?";
				
				PreparedStatement comandola = conn.prepareStatement(sql);
				comandola.setString(1, cpf);
				comandola.execute();
				
				sql = "delete from dados_medicos where aluno=?";
				
				PreparedStatement comandodm = conn.prepareStatement(sql);
				comandodm.setString(1, cpf);
				comandodm.execute();
				
				sql = "delete from desempenho where aluno=?";
				
				PreparedStatement comandodese = conn.prepareStatement(sql);
				comandodese.setString(1, cpf);
				comandodese.execute();
				
				
				
				sql = "select * from aluno where responsavel=?";
				
				String cpfrespon = Aluno.dadosAluno(cpf).getResponsavel().getCpf();
				
				PreparedStatement comandoresp = conn.prepareStatement(sql);
				comandoresp.setString(1, cpfrespon);
				ResultSet resu = comandoresp.executeQuery();
				
				resu.last();
				
				
				if(resu.getRow()==1) {
					sql = "delete from aluno where cpf=?";
					
					PreparedStatement comandoalu = conn.prepareStatement(sql);
					comandoalu.setString(1, cpf);
					comandoalu.execute();
					
					
					sql = "delete from responsavel where cpf=?";
					
					PreparedStatement comandodeleresp = conn.prepareStatement(sql);
					comandodeleresp.setString(1, cpfrespon);
					comandodeleresp.execute();				
				}else {
					sql = "delete from aluno where cpf=?";
					
					PreparedStatement comandoalu = conn.prepareStatement(sql);
					comandoalu.setString(1, cpf);
					comandoalu.execute();					
					
				}
				
				conn.close();
				return "sucesso";
				
			}catch(Exception e) {
				return "erro";
			}
				
			
		}
		
		

		
		
		public String atualiza_cadastro(String cpf) {
			
			
			try {
				Connection conn = getConn();
					
				String sql = "update aluno set treinador=?,turno=? where cpf=?";
				
				PreparedStatement atuali = conn.prepareStatement(sql);
				atuali.setString(1, treinador.getCpf());
				atuali.setString(2, turno.getTurno());
				atuali.setString(3, cpf);
				
				
				
				atuali.execute();
				conn.close();
				
				
				return "Cadastro atualizado com sucesso!";
					//usarei um equals para verificar a resposta depois
				
				
			}catch(Exception e) {
				return "Algum campo foi preenchido com dados incorretos!";
				
			}
			
		}
		
		
				

		public void setDt_matricula(String dt_matricula) {
			this.dt_matricula = dt_matricula;
		}


		public void setTurno(Turno turno) {
			this.turno = turno;
		}


		public void setTreinador(Treinador treinador) {
			this.treinador = treinador;
		}
		
		
	}
	//2367 linhas de código somente nas classes

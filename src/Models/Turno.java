package Models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import BD.Conexao;

public class Turno extends Conexao{
	public Turno(String turno,String inicio_aulas,String fim_aulas,int qtd_alunos) {
		this.turno = turno;
		this.inicio_aulas = inicio_aulas;
		this.fim_aulas = fim_aulas;
		this.qtd_alunos = qtd_alunos;
		
	
		
	}
	
	public String getTurno() {
		return turno;
	}
	public String getInicio_aulas() {
		return inicio_aulas;
	}
	public String getFim_aulas() {
		return fim_aulas;
	}
	public int getQtd_alunos() {
		return qtd_alunos;
	}

	private String turno;
	private String inicio_aulas;
	private String fim_aulas;
	private int qtd_alunos;
	
	public String cadastra_turno() {
		
		if(this.valida_turno()==0) {
			try {
				Connection conn = super.getConn();
				
				
				String sql = "insert into turno(turno,inicio_aulas,termino_aulas,qtd_alunos) values(?,?,?,?)";
				
				PreparedStatement insercao = conn.prepareStatement(sql);
				insercao.setString(1, this.turno);
				insercao.setString(2, this.inicio_aulas);
				insercao.setString(3, this.fim_aulas);
				insercao.setInt(4, this.qtd_alunos);
			
				
				
				
				insercao.execute();
				conn.close();
				
				
				return "Turno cadastrado com sucesso!";
					//usarei um equals para verificar a resposta depois
				
				
			}catch(Exception e) {
				return "Algum campo foi preenchido de forma incorreta!";
				
			}
		
		}else{
			return "Turno existente!";
		}
		
	}

		public int valida_turno() {
			try {
				Connection conn = super.getConn();
				
				String sql = "select * from turno where turno=? ";
				
				PreparedStatement comando = conn.prepareStatement(sql);
				comando.setString(1, this.turno);
				
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
		
		public static Turno getTurno(String turno) {
			try{
				Connection conn = getConn();
				
				String sql = "select * from turno where turno=?";
				PreparedStatement query = conn.prepareStatement(sql);
				query.setString(1, turno);
				ResultSet resultado = query.executeQuery();
				resultado.last();
				
				Turno tur;
				
				if(resultado.getRow()!=0) {
					tur = new Turno(resultado.getString("turno"),resultado.getString("inicio_aulas"),resultado.getString("termino_aulas"),resultado.getInt("qtd_alunos"));
				}else {
					tur = null;
				}
				
				conn.close();
				return tur;
				
				
			}catch(Exception e) {
				Turno tur;
				return tur = null;
				
			}		
			
		}
		
		public static ArrayList<Turno> turnos() {
			try{
				Connection conn = getConn();
				
				String sql = "select * from turno order by inicio_aulas";
				PreparedStatement query = conn.prepareStatement(sql);
				ResultSet resultado = query.executeQuery();
				
				
				
				ArrayList<Turno> turs = new ArrayList<Turno>();
				
				
				while(resultado.next()) {
					Turno tur;
					tur = new Turno(resultado.getString("turno"),resultado.getString("inicio_aulas"),resultado.getString("termino_aulas"),resultado.getInt("qtd_alunos"));
					turs.add(tur);
						
				}
				
				conn.close();
				
				
				return turs;
				
				
			}catch(Exception e) {
				return new ArrayList<Turno>();
				
			}		
			
		}
		
		
		public String altera_turno() {
			try {
				Connection conn = super.getConn();
				
				String sql = "update turno set inicio_aulas=?,termino_aulas=?,qtd_alunos=? where turno=?";
				
				PreparedStatement comando = conn.prepareStatement(sql);
				comando.setString(1, this.inicio_aulas);
				comando.setString(2, this.fim_aulas);
				comando.setInt(3, this.qtd_alunos);
				comando.setString(4, this.turno);
				
				
				comando.execute();
				
				conn.close();
				
				return "sucesso";
				
				
				
			}catch(Exception e) {
				return "erro";
			}
			
		}
		
		public static String deleta_turno(String turno) {
			
			try {
				Connection conn = getConn();
				
				String sql = "update aluno set turno=null where turno=?";
				
				PreparedStatement comandola = conn.prepareStatement(sql);
				comandola.setString(1, turno);
				comandola.execute();
				
				
				
				sql = "update evento set turno=null where turno=?";
				
				PreparedStatement comandodm = conn.prepareStatement(sql);
				comandodm.setString(1, turno);
				comandodm.execute();
				
				sql = "delete from turno where turno=?";
				
				PreparedStatement comandodeletu = conn.prepareStatement(sql);
				comandodeletu.setString(1, turno);
				comandodeletu.execute();
				
				conn.close();
				return "sucesso";
				
			}catch(Exception e) {
				return "erro";
			}
				
			
		}
		
		public static String adRemovQtd(String escolha,String turno) {
			try {
				Connection conn = getConn();
				
				String sql;
				
				if(escolha.equals("adiciona")) {
					sql = "update turno set qtd_alunos = qtd_alunos + 1 where turno=?";
					
				}else {
					sql = "update turno set qtd_alunos = qtd_alunos - 1 where turno=?";
				}
				
				PreparedStatement comando = conn.prepareStatement(sql);
				comando.setString(1,turno);
				comando.execute();
				
				conn.close();
				
				return "sucesso";
				
				
				
			}catch(Exception e) {
				return "erro";
			}
			
			
			
			
			
			
		}
		
		
		
		
	}


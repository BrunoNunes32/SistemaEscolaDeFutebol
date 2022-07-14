package Models;

import BD.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class Evento extends Conexao{
	public Evento(String nome,String turno,String data_ini,String data_termino) {
		this.nome = nome;
		this.turno = turno;
		this.data_ini = data_ini;
		this.data_termino = data_termino;
		
	}
	
	private int id;
	private String nome;
	private String turno;
	private String data_ini;
	private String data_termino;
	
	
	
public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}
	
	
	
public String cadastra_evento() {
		
		if(this.valida_evento()==0) {
			try {
				Connection conn = super.getConn();
				
				
				String sql = "insert into evento(nome,turno,data_início,data_termino) values(?,?,?,?)";
				
				PreparedStatement insercao = conn.prepareStatement(sql);
				insercao.setString(1, this.nome);
				insercao.setString(2, this.turno);
				insercao.setString(3, this.data_ini);
				insercao.setString(4, this.data_termino);
			
				
				
				
				insercao.execute();
				conn.close();
				
				
				return "Evento cadastrado com sucesso!";
					//usarei um equals para verificar a resposta depois
				
				
			}catch(Exception e) {
				return "Algum campo foi preenchido de forma incorreta!";
				
			}
		
		}else{
			return "evento existente!";
		}
		
	}

public String getNome() {
	return nome;
}

public String getTurno() {
	return turno;
}

public String getData_ini() {
	return data_ini;
}

public String getData_termino() {
	return data_termino;
}

		public int valida_evento() {
			try {
				Connection conn = super.getConn();
				
				String sql = "select * from evento where nome=? ";
				
				PreparedStatement comando = conn.prepareStatement(sql);
				comando.setString(1, this.nome);
				
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
		
		public static ArrayList<Evento> eventos() {
			try{
				Connection conn = getConn();
				
				String sql = "select * from evento order by data_início";
				PreparedStatement query = conn.prepareStatement(sql);
				ResultSet resultado = query.executeQuery();
				
				
				
				ArrayList<Evento> evs = new ArrayList<Evento>();
				
				
				while(resultado.next()) {
					Evento ev = new Evento(resultado.getString("nome"),resultado.getString("turno"),resultado.getString("data_início"),resultado.getString("data_termino"));
					ev.id = resultado.getInt("id");
					evs.add(ev);
					
				}
				
				conn.close();
				
				
				return evs;
				
				
			}catch(Exception e) {
				return new ArrayList<Evento>();
				
			}		
			
		}
		
		public static Evento getEvento(int id) {
			
			try{
				Connection conn = getConn();
				
				String sql = "select * from evento where id=?";
				PreparedStatement query = conn.prepareStatement(sql);
				query.setInt(1, id);
				ResultSet resultado = query.executeQuery();
				
				resultado.last();
				
				Evento eve = null;
				
				
				if(resultado.getRow()!=0) {
					eve = new Evento(resultado.getString("nome"),resultado.getString("turno"),resultado.getString("data_início"),resultado.getString("data_termino"));
					eve.id = resultado.getInt("id");
				
				}
				
				conn.close();
				
				
				return eve;
				
				
			}catch(Exception e) {
				Evento eve = null;
				return eve;
				
			}		
			
		}
		
		public String altera_evento() {
			try{
				Connection conn = super.getConn();
				
				String sql = "update evento set nome=?,turno=?,data_início=?,data_termino=? where id=?";
				
				PreparedStatement comando = conn.prepareStatement(sql);
				comando.setString(1, this.nome);
				comando.setString(2, this.turno);
				comando.setString(3, this.data_ini);
				comando.setString(4,this.data_termino);
				comando.setInt(5, this.id);
				
				comando.execute();
				
				conn.close();
				
				return "sucesso";
				
				
				
			}catch(Exception e) {
				return "erro";
			}
			
			
		}
		
		public static String deleta_evento(int id) {
			
			try{
				Connection conn = getConn();
				
				String sql = "delete from evento where id=?";
				
				PreparedStatement comando = conn.prepareStatement(sql);
				comando.setInt(1, id);
				
				comando.execute();
				
				conn.close();
				
				return "sucesso";
				
				
				
			}catch(Exception e) {
				return "erro";
			}
			
		}
			
		
	
	

}

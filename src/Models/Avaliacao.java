package Models;

import BD.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;




public class Avaliacao extends Conexao{
	public Avaliacao(String nome,double nota_max,String dt_aplicacao,Treinador treinador) {
		this.nome = nome;
		this.nota_max = nota_max;
		this.dt_aplicacao = dt_aplicacao;
		this.treinador = treinador;
		
	}


	public String getNome() {
		return nome;
	}
	public double getNota_max() {
		return nota_max;
	}
	public String getDt_aplicacao() {
		return dt_aplicacao;
	}
	
	public void setID(int id) {
		this.id = id;
	}
	
	public int id;
	private String nome;
	private double nota_max;
	private String dt_aplicacao;
	private Treinador treinador;
	
	
	
	public String defAvaliacao() {
		try {
			Connection conn = super.getConn();
			
			
			String sql = "insert into avaliacao(nome_avaliacao,nota_max,dt_aplicacao,treinador) values(?,?,?,?)";
			
			PreparedStatement insercao = conn.prepareStatement(sql);
			insercao.setString(1, this.nome);
			insercao.setDouble(2, this.nota_max);
			insercao.setString(3, this.dt_aplicacao);
			insercao.setString(4, this.treinador.getCpf());
			
			insercao.execute();
			conn.close();
			
			
			return "Avaliação registrada com sucesso!";
				//usarei um equals para verificar a resposta depois
			
			
		}catch(Exception e) {
			return "Avaliação não pode ser registrada por algum dado inválido";
			
		}
		
	
		
	}
	
	public static ArrayList<Avaliacao> dadosAva(String cpf) {
		try{
			Connection conn = getConn();
			
			String sql = "select * from avaliacao where treinador=? order by dt_aplicacao";
			PreparedStatement query = conn.prepareStatement(sql);
			query.setString(1, cpf);
			ResultSet resultado = query.executeQuery();
			ArrayList<Avaliacao> avaliacoes = new ArrayList<Avaliacao>(); 
			
			while(resultado.next()) {
				Avaliacao ava = new Avaliacao(resultado.getString("nome_avaliacao"),resultado.getDouble("nota_max"),resultado.getString("dt_aplicacao"),Treinador.getTreina(cpf));
				ava.setID(resultado.getInt("id_avaliacao"));
				
				avaliacoes.add(ava);
			}
			
			conn.close();
			
			return avaliacoes;
			
			
		}catch(Exception e) {
			return new ArrayList<Avaliacao>();
			
		}		
		
	}
	
	public static Avaliacao getAva(int id,String cpf) {
		try{
			Connection conn = getConn();
			
			String sql = "select * from avaliacao where id_avaliacao=?";
			PreparedStatement query = conn.prepareStatement(sql);
			query.setInt(1, id);
			ResultSet resultado = query.executeQuery();
			
			resultado.last();
			
			Avaliacao ava;
			
			if(resultado.getRow()!=0) {
				ava = new Avaliacao(resultado.getString("nome_avaliacao"),resultado.getDouble("nota_max"),resultado.getString("dt_aplicacao"),Treinador.getTreina(cpf));
				ava.id = resultado.getInt("id_avaliacao");
				
			}else {
				ava = null;
			}
			
			conn.close();
			return ava;
			
			
		}catch(Exception e) {
			Avaliacao ava;
			return ava = null;
			
		}		
		
	}
	
	
	

}

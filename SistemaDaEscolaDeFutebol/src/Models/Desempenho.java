package Models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import BD.Conexao;

public class Desempenho extends Conexao{
	public Desempenho(String aluno,Avaliacao avaliacao,double nota) {
		this.aluno = aluno;
		this.avaliacao = avaliacao;
		this.nota = nota;
		
		
	}
	
	public String getAluno() {
		return aluno;
	}
	public Avaliacao getAvaliacao() {
		return avaliacao;
	}
	public double getNota() {
		return nota;
	}

	private String aluno;
	private Avaliacao avaliacao;
	private double nota;
	
	public String defDesempenho() {
		if(this.valida_aluno()==1 && this.valida_avaliacao()==1) {
		
			try {
				Connection conn = super.getConn();
				
				
				String sql = "insert into desempenho(aluno,avaliacao,nota) values(?,?,?)";
				
				PreparedStatement insercao = conn.prepareStatement(sql);
				insercao.setString(1, this.aluno);
				insercao.setInt(2, this.avaliacao.id);
				insercao.setDouble(3, this.nota);
				
				insercao.execute();
				conn.close();
				
				
				return "Aluno avaliado com sucesso!";
					//usarei um equals para verificar a resposta depois
				
				
			}catch(Exception e) {
				return "O aluno especificado já realizou tal teste avaliativo!";
				
			}
		
		}else{
			return "Aluno ou avaliacão inexistentes!";
		}
		
	}
	
	public int valida_aluno() {
			try {
				Connection conn = super.getConn();
				
				String sql = "select * from aluno where cpf=? ";
				
				PreparedStatement comando = conn.prepareStatement(sql);
				comando.setString(1, aluno);
				
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
	
	public int valida_avaliacao() {
		try {
			Connection conn = super.getConn();
			
			String sql = "select * from avaliacao where id_avaliacao = ? ";
			
			PreparedStatement comando = conn.prepareStatement(sql);
			comando.setInt(1, avaliacao.id);
			
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
	
	public static ArrayList<Desempenho> avaliacoes_realizadas(String cpf) {
		try{
			Connection conn = getConn();
			
			String sql = "select * from desempenho where aluno=?";
			PreparedStatement query = conn.prepareStatement(sql);
			query.setString(1, cpf);
			ResultSet resultado = query.executeQuery();
			ArrayList<Desempenho> desempenhos = new ArrayList<Desempenho>(); 
			
			while(resultado.next()) {
				Desempenho des = new Desempenho(resultado.getString("aluno"),Avaliacao.getAva(resultado.getInt("avaliacao"),Aluno.dadosAluno(cpf).getTreinador().getCpf()),resultado.getDouble("nota"));
				
				desempenhos.add(des);
			}
			
			conn.close();
			return desempenhos;
			
			
		}catch(Exception e) {
			return new ArrayList<Desempenho>();
			
		}
		
		
	}
	
	
	}
	
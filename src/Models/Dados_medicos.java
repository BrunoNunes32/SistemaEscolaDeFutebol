package Models;

import BD.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Dados_medicos extends Conexao{
	
	public Dados_medicos(String aluno, double altura, double peso, String tipo_sanguineo, String doencas_cronicas,
			String alergias, String medicamentos) {
		super();
		this.aluno = aluno;
		this.altura = altura;
		this.peso = peso;
		this.tipo_sanguineo = tipo_sanguineo;
		this.doencas_cronicas = doencas_cronicas;
		this.alergias = alergias;
		this.medicamentos = medicamentos;
	}
	
	public String getAluno() {
		return aluno;
	}

	public double getAltura() {
		return altura;
	}

	public double getPeso() {
		return peso;
	}

	public String getTipo_sanguineo() {
		return tipo_sanguineo;
	}

	public String getDoencas_cronicas() {
		return doencas_cronicas;
	}

	public String getAlergias() {
		return alergias;
	}

	public String getMedicamentos() {
		return medicamentos;
	}
	private String aluno;
	private double altura;
	private double peso;
	private String tipo_sanguineo;
	private String doencas_cronicas;
	private String alergias;	
	private String medicamentos;

	
	public String setDados_medicos() {
		if(this.valida_aluno()==1) {
		
			try {
				Connection conn = super.getConn();
				
				
				String sql = "insert into dados_medicos(aluno,altura,peso,tipo_sanguineo,alergias,doencas_cronicas,medicamentos) "
						+ "values(?,?,?,?,?,?,?)";
				
				PreparedStatement insercao = conn.prepareStatement(sql);
				insercao.setString(1, this.aluno);
				insercao.setDouble(2, this.altura);
				insercao.setDouble(3, this.peso);
				insercao.setString(4, this.tipo_sanguineo);
				insercao.setString(5, this.alergias);
				insercao.setString(6, this.doencas_cronicas);
				insercao.setString(7, this.medicamentos);

				
				insercao.execute();
				conn.close();
				
				
				return "Dados médicos atualizados com sucesso!";
					//usarei um equals para verificar a resposta depois
				
				
			}catch(Exception e) {
				return "O aluno especificado já possui dados médicos associados!";
				
			}
		
		}else{
			return "Aluno inexistente!";
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
	
	public static Dados_medicos getDados_medicos(String aluno) {
		try {
			Connection conn = getConn();
			
			String sql = "select * from dados_medicos where aluno=?";
			
			PreparedStatement query = conn.prepareStatement(sql);
			query.setString(1, aluno);
			
			ResultSet resultado = query.executeQuery();
			
			resultado.last();
			
			Dados_medicos dm;
			
			
			if(resultado.getRow()!=0) {
				String alu = resultado.getString("aluno");
				double alt = resultado.getDouble("altura");
				double pes = resultado.getDouble("peso");
				String sangue = resultado.getString("tipo_sanguineo");
				String alerg = resultado.getString("alergias");
				String dc = resultado.getString("doencas_cronicas");
				String medica = resultado.getString("medicamentos");
				
				dm = new Dados_medicos(alu, alt, pes, sangue, dc, alerg, medica);
				
				
			}else {
				dm = null;
			}
			
			conn.close();
			return dm;
			
		}catch(Exception erro) {
			Dados_medicos dm;
			
			return dm = null;
			
			
		}
				
	}
	
	public String atualiza_dados() {
		
		
		try {
			Connection conn = getConn();
			
		
				
			String sql = "update dados_medicos set altura=?,peso=?,tipo_sanguineo=?,alergias=?,doencas_cronicas=?,medicamentos=? where aluno=?";
			
			PreparedStatement atuali = conn.prepareStatement(sql);
			atuali.setDouble(1, this.altura);
			atuali.setDouble(2, peso);
			atuali.setString(3, this.tipo_sanguineo);
			atuali.setString(4, this.alergias);
			atuali.setString(5, this.doencas_cronicas);
			atuali.setString(6, this.medicamentos);
			atuali.setString(7, this.aluno);
			
			
			atuali.execute();
			conn.close();
			
			
			return "Dados médicos atualizados com sucesso!";
				//usarei um equals para verificar a resposta depois
			
			
		}catch(Exception e) {
			return "Algum campo foi preenchido com dados incorretos!";
			
		}
		
	}
	
	
}

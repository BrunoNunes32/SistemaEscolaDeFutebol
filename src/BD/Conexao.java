package BD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;


public class Conexao {
	
	public static Connection getConn() {
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/futebol","Eduardo","1234");
			
			
			return conn;
			
		}catch(Exception erro) {
			
			throw new RuntimeException("Erro ao conectar-se ao Banco de Dados!");
			
			
			
		}
	
	
	}
	
}

package Validacoes;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Data {
	
	
	private String dataanalise;
	
	
	public void setDataanalise(String data) {
		this.dataanalise = data;
	}
	
	public String comparativo() {				
	
	try {
		Date data_atual = new Date();
		
		SimpleDateFormat datas = new SimpleDateFormat("yyyy-MM-dd");
		
		Date data = datas.parse(this.dataanalise);
		
		String atualformat = datas.format(data_atual);
		
		Date dataatual = datas.parse(atualformat);
		
		if(data.after(dataatual)) {
			return "maior";
		}else if(data.before(dataatual)) {
			return "menor";
		}else {
			return "igual";
		}

	}catch(Exception e) {
		return "erro";
	}
	
	
}
	
	public String diames() {
		try {
			
			if(this.dataanalise!=null) {
				
				SimpleDateFormat datas = new SimpleDateFormat("yyyy-MM-dd");
				
				Date data = datas.parse(this.dataanalise);
				
				
				
				SimpleDateFormat dt = new SimpleDateFormat("dd/MM");
				
				String dataformatadafinal = dt.format(data);
				
				return dataformatadafinal;
			
			}else {
				
				
				Date data_atual = new Date();
				
				SimpleDateFormat datas = new SimpleDateFormat("dd/MM");
				
				String str_data_atual = datas.format(data_atual);
			
				
				return str_data_atual;
						
			}

		}catch(Exception e) {
			return "erro";
		}
		
	}
	
	public static String entre_datas(String data1,String data2) {
		SimpleDateFormat datas = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
		
			Date dt1 = datas.parse(data1);
			Date dt2 = datas.parse(data2);
			
			
			if(dt1.after(dt2)){
				return "maior";
			}else if(dt1.before(dt2)) {
				return "menor";
			}else {
				return "igual";
			}
			
				
		}catch(Exception e) {
			return "erro";
		}
		
		
	}
	
	
	

}

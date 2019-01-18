package common;

import java.io.FileReader;
import java.sql.Connection;
import java.util.Properties;

public class JDBCTemplate {
	private static String driver;
	private static String url;
	private static String dbId;
	private static String dbPw;
	
	static {
		try {
			Properties prop = new Properties();
			// 현재 폴더 - . 상위 폴더 - ..
			String fileName = JDBCTemplate.class.getResource("./driver.properties").getPath();
			prop.load(new FileReader(fileName));
			driver = prop.getProperty("driver");
			url = prop.getProperty("url");
			dbId = prop.getProperty("user");
			dbPw = prop.getProperty("pw");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		
	}
}

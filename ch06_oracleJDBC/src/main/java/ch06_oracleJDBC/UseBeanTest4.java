package ch06_oracleJDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UseBeanTest4 {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "tjoeun";
	private final String PASS = "1234";
	
	public UseBeanTest4() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Bean> getList() {
		ArrayList<Bean> alist = new ArrayList<Bean>();
		
		Connection con;
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			Statement st = con.createStatement();
			String query = "select * from job";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Bean bean = new Bean();
				bean.setJob_code(rs.getString("job_code"));
				bean.setJob_name(rs.getString("job_name"));
				alist.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alist;	
	}
	
	
	
}

package recommendMusic;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconnector {

	private Connection con = null;

	public DBconnector() {

		String DB_SERVER = "localhost:3306";
		String DB_SERVER_USERNAME = "root";
		String DB_SERVER_PASSWORD = "apmsetup";
		String DB_DATABASE = "MUSIC";

		String jdbcUrl = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE+"?useUnicode=true&characterEncoding=utf-8";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(jdbcUrl, DB_SERVER_USERNAME, DB_SERVER_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean excute(String sql) {
		try {
			Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ResultSet getResult(String sql) {
		sql = "select * from song order by rand() limit 2";
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0;
			while (rs.next()) {
				String name = rs.getString("SONGNAME");
				count++;
				System.out.printf("%s\n", name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void CloseDB() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		con = null;
	}

}

package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn; //데이터베이스에 접근하게 해주는 객체를 의미 = Connection
	private PreparedStatement pstmt; // 
	private ResultSet rs; // 정보를 담을 수 있는 객체를 만듦
	
	public UserDAO() {
		// DB에 접속하게 해주는 설정 값들.
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			// localhost는 본인 컴퓨터의 주소를 의미하는 것으로서 포트번호 3306번에 BBS에 접속하도록 하는 것 ( localhost:3306 -> 컴퓨터에설치되 mysql서버를 의미, BBS접속) 
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver"); //Driver 는 sql에 접속할수 있도록 해주는 라이브러리 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); 
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword From USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;//로그인 성공
				}else {
					return 0;
				}
				
			}
			return -1; // 아이디 없음.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;//데이터베이스 오류를 의미
	}
}

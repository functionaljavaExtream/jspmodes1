package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {
	private static MemberDao dao = null;
	
	private MemberDao() {
		DBConnection.initConnection();
	}
	
	public static MemberDao getInstance() {
		if(dao == null) {
			dao = new MemberDao();
		}
		return dao;		
	}
	
	public boolean getId(String id) {
		String sql = " select id "
				+ "	   from member"
				+ "    where id=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean findid = false;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getId success");
			
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/3 getId success");

			rs = psmt.executeQuery();	
			System.out.println("3/3 getId success");
			if(rs.next()) {
				findid = true;
			}
			
		} catch (Exception e) {
			System.out.println("getId fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
			
		}
		return findid;
	}
	
	public boolean addMember(MemberDto dto) {
		String sql = " insert into member(id, pwd, name, email, auth) "
				+ "    values(?,?,?,?,3) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			System.out.println("2/3");
			
			count = psmt.executeUpdate();
			System.out.println("3/3");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("addMember fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0? true:false;
	}
	
	
	public MemberDto login(String id, String pwd) {
		String sql = " select id, name, email, auth "
				+ "    from member "
				+ "    where id=? and pwd=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		// select는 데이터가 나오는 구문이므로 ResultSet이 필요하다.
		ResultSet rs = null;
		
		MemberDto mem = null;		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 login");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			System.out.println("2/3 login");
			
			
			rs = psmt.executeQuery();
			System.out.println("3/3 login");
			
			
			if(rs.next()) {
				String _id = rs.getString("id");
				String _name = rs.getString("name");
				String _email = rs.getString("email");
				int _auth = rs.getInt("auth");
				
				mem = new MemberDto(_id, null, _name, _email, _auth);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
		return mem;
		
	}
}
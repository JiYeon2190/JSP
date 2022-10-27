package visit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class nurseDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void connect_cp() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context)initctx.lookup("java:/comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			conn = ds. getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public void disconnect() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<nurseDO> getAllNurse() {
		connect_cp();
		ArrayList<nurseDO> aList = new ArrayList<nurseDO>();
		String sql = "select * from nurse";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				nurseDO ndo = new nurseDO();
				ndo.setNum(rs.getInt(1));
				ndo.setImg(rs.getString(2));
				ndo.setFname(rs.getString(3));
				ndo.setArea(rs.getString(4));
				ndo.setTel(rs.getString(5));
				aList.add(ndo);					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return aList;
	}
	
	public nurseDO getNurseOne(int num) {
		connect_cp();
		nurseDO ndo = new nurseDO();
		String sql = "select * from nurse where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ndo.setNum(rs.getInt(1));
				ndo.setImg(rs.getString(2));
				ndo.setFname(rs.getString(3));
				ndo.setArea(rs.getString(4));	
				ndo.setTel(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return ndo;
	}
	
	public ArrayList<nurseDO> searchNurse(String sf, String st) {
		connect_cp();
		ArrayList<nurseDO> aList = new ArrayList<nurseDO>();
		String sql = "select * from nurse where "+sf+" like '%"+st+"%'";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				nurseDO ndo = new nurseDO();
				ndo.setNum(rs.getInt(1));
				ndo.setImg(rs.getString(2));
				ndo.setFname(rs.getString(3));
				ndo.setArea(rs.getString(4));
				ndo.setTel(rs.getString(5));
				aList.add(ndo);		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return aList;
	}
}
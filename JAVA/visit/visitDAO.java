package visit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import visit.visitDO;

public class visitDAO {
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
	
	public void insertVisit(visitDO vdo) {
		connect_cp();
		String sql = "insert into visit values (null, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vdo.getName());
			pstmt.setString(2, vdo.getTel());
			pstmt.setString(3, vdo.getFname());
			pstmt.setString(4, vdo.getDate());
			pstmt.setString(5, vdo.getTime());
			pstmt.setString(6, vdo.getRelat());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		disconnect();
	}
	
	public ArrayList<visitDO> getAllVisit() {
		connect_cp();
		ArrayList<visitDO> aList = new ArrayList<visitDO>();
		String sql = "select * from visit";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				visitDO vdo = new visitDO();
				vdo.setNum(rs.getInt(1));
				vdo.setName(rs.getString(2));
				vdo.setTel(rs.getString(3));
				vdo.setFname(rs.getString(4));
				vdo.setDate(rs.getString(5));
				vdo.setTime(rs.getString(6));
				vdo.setRelat(rs.getString(7));
				aList.add(vdo);					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnect();
		return aList;
	}
	
	public visitDO getVisitOne(int num) {
		connect_cp();
		visitDO vdo = new visitDO();
		String sql = "select * from visit where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vdo.setNum(rs.getInt(1));
				vdo.setName(rs.getString(2));
				vdo.setTel(rs.getString(3));
				vdo.setFname(rs.getString(4));
				vdo.setDate(rs.getString(5));
				vdo.setTime(rs.getString(6));
				vdo.setRelat(rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return vdo;
	}
	
	public void modifyVisit(visitDO vdo) {
		connect_cp();
		String sql = "update visit set name=?, tel=?, fname=?, "
				+ "date=?, time=?, relat=? where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vdo.getName());
			pstmt.setString(2, vdo.getTel());
			pstmt.setString(3, vdo.getFname());
			pstmt.setString(4, vdo.getDate());
			pstmt.setString(5, vdo.getTime());
			pstmt.setString(6, vdo.getRelat());
			pstmt.setInt(7, vdo.getNum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}
	
	public void deleteVisit(int num) {
		connect_cp();
		String sql = "delete from visit where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}
	
	public ArrayList<visitDO> sortNumVisit() {
		connect_cp();
		ArrayList<visitDO> nList = new ArrayList<visitDO>();
		String sql = "select * from visit order by num desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				visitDO vdo = new visitDO();
				vdo.setNum(rs.getInt(1));
				vdo.setName(rs.getString(2));
				vdo.setTel(rs.getString(3));
				vdo.setFname(rs.getString(4));
				vdo.setDate(rs.getString(5));
				vdo.setTime(rs.getString(6));
				vdo.setRelat(rs.getString(7));
				nList.add(vdo);					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return nList;
	}
	
	public ArrayList<visitDO> sortNameVisit() {
		connect_cp();
		ArrayList<visitDO> mList = new ArrayList<visitDO>();
		String sql = "select * from visit order by name, date";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				visitDO vdo = new visitDO();
				vdo.setNum(rs.getInt(1));
				vdo.setName(rs.getString(2));
				vdo.setTel(rs.getString(3));
				vdo.setFname(rs.getString(4));
				vdo.setDate(rs.getString(5));
				vdo.setTime(rs.getString(6));
				vdo.setRelat(rs.getString(7));
				mList.add(vdo);					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return mList;
	}
	
	public ArrayList<visitDO> sortDateVisit() {
		connect_cp();
		ArrayList<visitDO> dList = new ArrayList<visitDO>();
		String sql = "select * from visit order by date, time";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				visitDO vdo = new visitDO();
				vdo.setNum(rs.getInt(1));
				vdo.setName(rs.getString(2));
				vdo.setTel(rs.getString(3));
				vdo.setFname(rs.getString(4));
				vdo.setDate(rs.getString(5));
				vdo.setTime(rs.getString(6));
				vdo.setRelat(rs.getString(7));
				dList.add(vdo);					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return dList;
	}
	
	public ArrayList<visitDO> searchVisit(String sf, String st) {
		connect_cp();
		ArrayList<visitDO> dList = new ArrayList<visitDO>();
		String sql = "select * from visit where "+sf+" like '%"+st+"%'";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				visitDO vdo = new visitDO();
				vdo.setNum(rs.getInt(1));
				vdo.setName(rs.getString(2));
				vdo.setTel(rs.getString(3));
				vdo.setFname(rs.getString(4));
				vdo.setDate(rs.getString(5));
				vdo.setTime(rs.getString(6));
				vdo.setRelat(rs.getString(7));
				dList.add(vdo);					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return dList;
	}
}
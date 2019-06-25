package com.teatime.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.teatime.dto.ShopDTO;

public class ShopDAO {

	private static ShopDAO dao = new ShopDAO();
	public static ShopDAO getDAO() {
		return dao;
	}
	
	private ShopDAO() {}
	
	private void rsClose(ResultSet rs) {
		if (rs != null) {try {rs.close();} catch (SQLException e) {}}
	}
	
	public List<ShopDTO> boardlist(Connection conn) throws SQLException {
		List<ShopDTO> result = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select shopno, name, content, addr, workingtime, date ");
		sql.append(" from shop                  ");
		try(PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				ShopDTO dto = new ShopDTO();
				dto.setShopno(rs.getInt("shopno"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setAddr(rs.getString("addr"));
				dto.setWorkingtime(rs.getString("workingtime"));
				dto.setDate(rs.getDate("date"));
				result.add(dto);
			}
		} catch (SQLException e) {
			throw e;
		}
		return result;
	}
	
	public List<ShopDTO> bestList(Connection conn, String kind, String startday, String endday) throws SQLException {
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		List<ShopDTO> bestlist = new ArrayList<>();
		sb.append(" select s.shopno, s.name, s.addr, s.photo, avg(gpa) as gpa, count(g.date) as good ");
		sb.append(" from shop s join review r on s.shopno = r.shopno ");
		sb.append(" join good g on g.shopno = s.shopno ");
		
		//날짜 기준
		if(startday!=null && !("".equals(startday))) {
			sb.append(" where date between ? and ");
			if("none".equals(endday))
				sb.append(" current_date()+1 "); //오늘날까지.
			else 
				sb.append(" '? 23:59:59' "); //사용자 지정날까지.
		}
		
		sb.append(" group by shopno order by ? desc ");
		try(PreparedStatement pstmt = conn.prepareStatement(sb.toString());){
			if(startday!=null && !("".equals(startday))) {
				pstmt.setString(1, startday);
				if(!("none".equals(endday))) {
					pstmt.setString(2, endday);
					pstmt.setString(3, kind);
				} else {
					pstmt.setString(2, kind);
				}
			} else {
				pstmt.setString(1, kind);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ShopDTO dto = new ShopDTO();
				dto.setShopno(rs.getInt("s.shopno"));
				dto.setName(rs.getString("s.name"));
				dto.setAddr(rs.getString("s.addr"));
				dto.setAddr(rs.getString("s.photo"));
				dto.setGpa(rs.getFloat("gpa"));
				dto.setCount(rs.getInt("count"));
				bestlist.add(dto);
			}
		} finally {
			rsClose(rs);
		}
		return bestlist;
	}
}

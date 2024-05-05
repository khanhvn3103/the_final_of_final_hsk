package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ConnectDB.ConnectDB;
import Entity.TaiKhoan;

public class TaiKhoan_DAO {
	public ArrayList<TaiKhoan> getAllTableTaiKhoan() {
		ArrayList<TaiKhoan> dstk = new ArrayList<TaiKhoan>();
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "select * from TAIKHOAN";
			Statement statement = con.createStatement();
			//thuc thi cau lenh sql tra ve doi tuong result
			ResultSet rs = statement.executeQuery(sql);
			//duyet tren ket qua tra ve
			while(rs.next()) {
				String tk = rs.getString(1);
				String mk = rs.getString(2);
				TaiKhoan taiKhoan = new TaiKhoan(tk,mk);
				dstk.add(taiKhoan);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dstk;
	}
}

package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ConnectDB.ConnectDB;
import Entity.NhanVien;
import Entity.TaiKhoan;

public class NhanVien_DAO {
	public ArrayList<NhanVien> getAllTableNhanVien() {
		ArrayList<NhanVien> dsnv = new ArrayList<NhanVien>();
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "select * from NHANVIEN";
			Statement statement = con.createStatement();
			//thuc thi cau lenh sql tra ve doi tuong result
			ResultSet rs = statement.executeQuery(sql);
			//duyet tren ket qua tra ve
			while(rs.next()) {
				String maNV = rs.getString(1);
				String tenNV = rs.getString(2);
				String diaChi = rs.getString(3);
				String sdt = rs.getString(4);
				Double luong = rs.getDouble(5);
				String chucVu = rs.getString(6);
				TaiKhoan tk = new TaiKhoan(rs.getString(7));
				NhanVien nv = new NhanVien(maNV, tenNV, diaChi, sdt, luong, chucVu, tk);
				dsnv.add(nv);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dsnv;
	}
}

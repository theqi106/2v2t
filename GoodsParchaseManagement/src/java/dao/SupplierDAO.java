/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.SupplierDTO;

/**
 *
 * @author THevY
 */
public class SupplierDAO {
    public ArrayList<SupplierDTO> selectAll() {
        
       ArrayList<SupplierDTO> result = new ArrayList<SupplierDTO>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM supplier";
			PreparedStatement st = con.prepareStatement(sql);
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			// Bước 4:
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("sname");
				String  telNum = rs.getString("telnum");
				String address = rs.getString("address");
				
				SupplierDTO supplier = new SupplierDTO(id, name, telNum, address);
				result.add(supplier);
			}
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
        }
    
    
    public ArrayList<SupplierDTO> searchProductByName(String txtSearch) {
        ArrayList<SupplierDTO> result = new ArrayList<SupplierDTO>();
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM supplier WHERE sname LIKE ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("sname");
                String telNum = rs.getString("telnum");
                String address = rs.getString("address");

                SupplierDTO s = new SupplierDTO(id, name, telNum, address);
                result.add(s);
            }

            // Bước 5:
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return result;
    }
      public void deleteById(int t) {
          
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = " DELETE FROM supplier WHERE id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, t);
            st.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
     public void edit(int id, String name, String telNum, String address) {

        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "UPDATE supplier " + " SET " + "sname=?, telnum=?,  "
                    + "address=?" + " WHERE id=?";

            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, name);
            st.setString(2, telNum);
            st.setString(3, address);
            st.setInt(4, id);
            

            // Bước 3: thực thi câu lệnh SQL
            st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);

            // Bước 5:
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
     public SupplierDTO selectById(int t) {
        SupplierDTO result = null;
        Connection con = JDBCUtil.getConnection();
        String sql = "SELECT * FROM supplier WHERE id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, t);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String telNum = rs.getString(3);
                String address = rs.getString(4);
                

                
                result = new SupplierDTO(id, name, telNum, address);
            }
            con.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }
     public void insert(String name, String telphone, String address) {

        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "INSERT INTO supplier(sname,telnum,address) VALUES (?,?,?)";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, telphone);
            st.setString(3, address);
            

            // Bước 3: thực thi câu lệnh SQL
            st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);

            // Bước 5:
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
      
      
      public static void main(String[] args) {
        SupplierDAO sDAO = new SupplierDAO();
      sDAO.edit(1, "FPT", "0123456789", "2");
      sDAO.insert("fpt", "0867438577", "98 DAo Tan");
    }
    
    
}

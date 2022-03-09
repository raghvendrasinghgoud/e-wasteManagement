/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pkg.dao;

import com.pkg.entities.admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author hp
 */
public class adminDao {
    private final Connection con;
    public adminDao(Connection con) {
        this.con = con;
    }
    
     public admin getAdminByEmailAndPassword(String email,String password) {
		admin user=null;
        
		try {
                       // Connection con=DBconnection.getconnection();
			String query="select * from admin where adminemail=? and password=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet set=pstmt.executeQuery();
			if(set.next()) {
				user=new admin();
				
				user.setId(set.getInt("adminemail"));
                               
				
                                user.setName(set.getString("name"));
                                user.setPassword(set.getString("password"));
				
                                
				
			}
                     
					
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
		
		
		
	}
}

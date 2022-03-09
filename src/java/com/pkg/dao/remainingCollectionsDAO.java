/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pkg.dao;

import com.pkg.entities.remainingCollections;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ragha
 */
public class remainingCollectionsDAO {
    private final Connection con;

    public remainingCollectionsDAO(Connection con) {
        this.con = con;
    }
    //save Buying Request;
    public boolean saveRemainingCollections(String pid,String companyEmail,String ownerEmail){
        boolean flag=false;
        try{
            String sql="insert into remaining_collections(pid,companyemail,owneremail)values(?,?,?)";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(pid));
            stmt.setString(2, companyEmail);
            stmt.setString(3, ownerEmail);
            stmt.executeUpdate();
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    //getting remaining Collection for  products
    public ArrayList<remainingCollections> getRemainingCollection(String email){
        ArrayList<remainingCollections> li=new ArrayList<>();
        try{
            String sql="select * from remaining_collections where companyemail=? order by pid desc";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                 String pid=set.getString("pid");
                String companyEmail=set.getString("companyemail");
                String ownerEmail=set.getString("owneremail");
                li.add(new remainingCollections(pid,companyEmail,ownerEmail));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return li;
    }
    
    //deleting product from remaining collection
    
    public boolean deleteProduct(String pid,String companyemail){
        boolean flag=false;
        try{
            System.out.println(pid+" "+companyemail);
            String sql="delete from remaining_collections where pid=? and companyemail=?";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setString(1, pid);
            stmt.setString(2, companyemail);
            stmt.execute();
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    
}

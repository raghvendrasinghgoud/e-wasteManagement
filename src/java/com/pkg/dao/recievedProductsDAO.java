
package com.pkg.dao;

import com.pkg.entities.recievedProducts;
import com.pkg.entities.remainingCollections;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class recievedProductsDAO {
    private final Connection con;

    public recievedProductsDAO(Connection con) {
        this.con = con;
    }
    //save Buying Request;
    public boolean saverecievedProducts(String pid,String companyEmail,String ownerEmail){
        boolean flag=false;
        try{
            String sql="insert into recieved_products(pid,companyemail,owneremail)values(?,?,?)";
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
    
    //getting remaining Collection for a product
    public ArrayList<recievedProducts> getRecievedProduct(String email){
        ArrayList<recievedProducts> requests=new ArrayList<>();
        try{
            String sql="select * from recieved_products where companyemail=? order by pid desc";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                String pid=set.getString("pid");
                String companyEmail=set.getString("companyemail");
                String ownerEmail=set.getString("owneremail");
                requests.add(new recievedProducts(pid,companyEmail,ownerEmail));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return requests;
    }
    
    //deleting product from remaining collection
    
    public boolean deleteProduct(String pid,String companyemail){
        boolean flag=false;
        try{
            String sql="delete from recieved_products where pid=? and companyemail=?";
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

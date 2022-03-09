/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pkg.dao;

import com.pkg.entities.BuyingRequests;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ragha
 */
public class BuyingRequestsDAO {
    private final Connection con;

    public BuyingRequestsDAO(Connection con) {
        this.con = con;
    }
    
    //save Buying Request;
    public boolean saveBuyingRequest(String pid,String companyEmail,String ownerEmail){
        boolean flag=false;
        try{
            String sql="insert into buying_requests(pid,companyemail,owneremail)values(?,?,?)";
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
    
    //getting buying requests for a product
    public ArrayList<BuyingRequests> getRequests(String pid){
        ArrayList<BuyingRequests> requests=new ArrayList<>();
        try{
            String sql="select * from buying_requests where pid=? order by pid desc";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setString(1, pid);
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                pid=set.getString("pid");
                String companyEmail=set.getString("companyemail");
                String ownerEmail=set.getString("owneremail");
                requests.add(new BuyingRequests(pid,companyEmail,ownerEmail));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return requests;
    }
    
    //to checking if product is alredy requested by company or not
    public BuyingRequests ifRequestedproduct(String pid,String companyEmail){
        boolean flag=false;
        BuyingRequests br=null;
        try{
            String sql="select * from buying_requests where pid=? and companyemail=?";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setString(1, pid);
            stmt.setString(2, companyEmail);
            ResultSet set=stmt.executeQuery();
            if(set.next()){
                br=new BuyingRequests();
                br.setPid(pid);
                br.setCompanyEmail(companyEmail);
                br.setOwnerEmail("owneremail");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return br;
    }
    //deleting buying request
    
    public boolean deleteBuyingRequest(String pid,String companyemail){
        boolean flag=false;
        try{
            String sql="delete from buying_requests where pid=? and companyemail=?";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setString(1, pid);
            stmt.setString(2, companyemail);
            stmt.executeUpdate();
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    //deleting buying requests
    
    public boolean deleteBuyingRequests(String pid){
        boolean flag=false;
        try{
            String sql="delete from buying_requests where pid=?";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(pid));
            stmt.executeUpdate();
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
        
}

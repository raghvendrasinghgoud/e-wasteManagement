
package com.pkg.dao;

import com.pkg.entities.Company;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class companyDAO  {
    private final Connection con;
    //constructor
    public companyDAO(Connection con){
        this.con=con;
    }
    //insert data into table 
    public boolean saveCompany(Company c){
           boolean flag=false;
        try{
            UserDAO ud=new UserDAO(this.con);
             boolean ifInserted=ud.saveUser(c);
            //check if data in user table inserted or not
            if(ifInserted){
                System.out.println("User inserted successfully");
        String sql="insert into company(companyname,email)"
                + "values(?,?)";
              PreparedStatement pstmt=this.con.prepareStatement(sql);
              pstmt.setString(1, c.getCompanyName());
              pstmt.setString(2, c.getEmail());
              pstmt.executeUpdate();
              flag=true;
              System.out.println("Registered company");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }//end of save company
    
    //company login
    public Company companyLogin(String email,String password,String userType){
        Company c=null;
        try{
        String sql="select * from user left join company on user.email=company.email where user.email=? and user.password=? and user.usertype=?;";
        PreparedStatement stmt=con.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);
        stmt.setString(3, userType);
        ResultSet set=stmt.executeQuery();
        if(set.next()){
            c=new Company();
        c.setFirstName(set.getString("firstname"));
        c.setLastName(set.getString("lastname"));
        c.setEmail(set.getString("email"));
        c.setPhone(set.getString("phone"));
        c.setUsertype(set.getString("usertype"));
        c.setAddress(set.getString("Address"));
        c.setPincode(set.getString("pincode"));
        c.setCompanyName("companyname");
        }
        }catch(Exception e){
            e.printStackTrace();
        }
      return c;  
    }
    
    //getting company using email
    public Company getCompany(String email){
        Company c=null;
        try{
    
        String sql="select * from user left join company on user.email=company.email where user.email=?";
        PreparedStatement stmt=con.prepareStatement(sql);
        stmt.setString(1, email);
        ResultSet set=stmt.executeQuery();
        if(set.next()){
            c=new Company();
        c.setFirstName(set.getString("firstname"));
        c.setLastName(set.getString("lastname"));
        c.setEmail(set.getString("email"));
        c.setPhone(set.getString("phone"));
        c.setUsertype(set.getString("usertype"));
        c.setAddress(set.getString("Address"));
        c.setPincode(set.getString("pincode"));
        c.setCompanyName(set.getString("companyname"));
        }
        }catch(Exception e){
            e.printStackTrace();
        }
      return c;  
    }
}

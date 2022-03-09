
package com.pkg.dao;

import com.pkg.entities.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class customerDAO {
    private final Connection con;

    public customerDAO(Connection con) {
        this.con = con;
    }
    public boolean saveCustomer(Customer c){
           boolean flag=false;
        try{
            UserDAO ud=new UserDAO(this.con);
            boolean ifInserted=ud.saveUser(c);
            //check if data in user table inserted or not
            if(ifInserted){
                System.out.println("User inserted succesfully");
        String sql="insert into customer(email)"
                + "values(?)";
              PreparedStatement pstmt=this.con.prepareStatement(sql);
              pstmt.setString(1, c.getEmail());
              pstmt.executeUpdate();
              flag=true;
            }else System.out.println("User not inserted succesfully");
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }//end of save customer
    
     //validate customer credentaials
    public Customer customerLogin(String email,String password,String userType){
        Customer c=null;
        try{
            System.out.println("email="+email+" pass="+password+" userType="+userType);
        String sql="select * from user left join customer on user.email=customer.email where user.email=? and user.password=? and user.usertype=?;";
        PreparedStatement stmt=con.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);
        stmt.setString(3, userType);
        ResultSet set=stmt.executeQuery();
        if(set.next()){
            c=new Customer();
        c.setFirstName(set.getString("firstname"));
        c.setLastName(set.getString("lastname"));
        c.setEmail(set.getString("email"));
        c.setPhone(set.getString("phone"));
        c.setUsertype(set.getString("usertype"));
        c.setAddress(set.getString("Address"));
        c.setPincode(set.getString("pincode"));
        }
        }catch(Exception e){
            e.printStackTrace();
        }
      return c;  
    }
    //getting customer using email
    public Customer getCustomer(String email){
        Customer c=null;
        try{
    
        String sql="select * from user left join customer on user.email=customer.email where user.email=?";
        PreparedStatement stmt=con.prepareStatement(sql);
        stmt.setString(1, email);
        ResultSet set=stmt.executeQuery();
        if(set.next()){
            c=new Customer();
        c.setFirstName(set.getString("firstname"));
        c.setLastName(set.getString("lastname"));
        c.setEmail(set.getString("email"));
        c.setPhone(set.getString("phone"));
        c.setUsertype(set.getString("usertype"));
        c.setAddress(set.getString("Address"));
        c.setPincode(set.getString("pincode"));
        }
        }catch(Exception e){
            e.printStackTrace();
        }
      return c;  
    }
}

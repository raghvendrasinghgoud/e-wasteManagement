package com.pkg.dao;

import com.pkg.entities.Customer;
import com.pkg.entities.User;
import java.sql.*;
import java.util.ArrayList;

public class UserDAO {

    private final Connection con;

    public UserDAO(Connection con) {
        this.con = con;
    }

    //registering user
    public boolean saveUser(User u) {
        boolean flag = false;
        try {
            String sql = "insert into user(firstname,lastname,email,phone,password,usertype,address,pincode)"
                    + "values(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(sql);
            pstmt.setString(1, u.getFirstName());
            pstmt.setString(2, u.getLastName());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, u.getPhone());
            pstmt.setString(5, u.getPassword());
            pstmt.setString(6, u.getUsertype());
            pstmt.setString(7, u.getAddress());
            pstmt.setString(8, u.getPincode());
            System.out.println(pstmt.executeUpdate());
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }//end of save user
    //getting user

    public User getUser(String email) {
        User c = null;
        try {

            String sql = "select * from user where email=?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet set = stmt.executeQuery();
            if (set.next()) {
                c = new Customer();
                c.setFirstName(set.getString("firstname"));
                c.setLastName(set.getString("lastname"));
                c.setEmail(set.getString("email"));
                c.setPhone(set.getString("phone"));
                c.setUsertype(set.getString("usertype"));
                c.setAddress(set.getString("Address"));
                c.setPincode(set.getString("pincode"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

//updating user atributes
    public boolean updateUserProfile(String tableName, String fieldName, String value, String email) {
        boolean flag = false;
        try {
            String sql = "update " + tableName + " set " + fieldName + "=? where email=?";
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setString(1, value);
            stmt.setString(2, email);
            stmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    //admin funcionalities
    //extracting users from database
    public ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select * from user";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
            while (set.next()) {
                //   String pid=set.getString("pid");
                String firstname = set.getString("firstname");
                String lastname = set.getString("lastname");
                String email = set.getString("email");
                String phone = set.getString("phone");
                String usertype = set.getString("usertype");
                String address = set.getString("Address");
                String pincode = set.getString("pincode");
                //    String ownerEmail=set.getString("owneremail");
                users.add(new User(firstname, lastname, email, phone, usertype, address, pincode));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    //deleting users
    public boolean deleteUser(String email) {
        try {
            //     Connection con=DBconnection.getconnection();
            PreparedStatement p = con.prepareStatement("delete from user where email=?");
            p.setString(1, email);
            p.executeUpdate();
            con.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean emailExist(String email) {
        try {
            //     Connection con=DBconnection.getconnection();
            PreparedStatement p = con.prepareStatement("select email from user where email=?");
            p.setString(1, email);
            ResultSet res = p.executeQuery();
            if (res.next()) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean phoneExist(String phone) {
        try {
            //     Connection con=DBconnection.getconnection();
            PreparedStatement p = con.prepareStatement("select phone from user where phone=?");
            p.setString(1, phone);
            ResultSet res = p.executeQuery();
            if (res.next()) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}

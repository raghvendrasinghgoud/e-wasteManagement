
package com.pkg.dao;

import com.pkg.entities.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class productDAO {
    private final Connection con;
    //constructor
    public productDAO(Connection con){
        this.con=con;
    }
    
    public boolean saveProduct(Product p){
        boolean flag=false;
        try{
                       
            String sql="insert into product(pid,productname,brand,price,weight,image,description,soldstatus,owneremail)"
                    + "values(?,?,?,?,?,?,?,?,?)";
              PreparedStatement pstmt=this.con.prepareStatement(sql);
              pstmt.setString(1,p.getPid());
              pstmt.setString(2,p.getName());
              pstmt.setString(3,p.getBrand());
              pstmt.setString(4,p.getPrice());
              pstmt.setString(5,p.getWeight());
              pstmt.setString(6,p.getImage());
              pstmt.setString(7,p.getDescription());
              pstmt.setString(8,p.getSoldStatus());
              pstmt.setString(9,p.getOwnerEmail());
              pstmt.executeUpdate();
              flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    //getting single product
    public Product getproduct(String pid){
        Product product=null;
        try{
            product=new Product();
            String sql="select * from product where pid=?";
            PreparedStatement stmt=con.prepareStatement(sql);
            stmt.setString(1, pid);
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                product.setName(set.getString("productname"));
                product.setBrand(set.getString("brand"));
                product.setPrice(set.getString("price"));
                product.setWeight(set.getString("weight"));
                product.setImage(set.getString("image"));
                product.setDescription(set.getString("description"));
                product.setSoldStatus(set.getString("soldstatus"));
                product.setOwnerEmail(set.getString("owneremail"));                
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return product;
    }
    //getting customer products
    public ArrayList<Product> getCustomerProducts(String email){
        ArrayList<Product> products=new ArrayList<>();
        try{
            String sql="select * from product where owneremail=?";
            PreparedStatement stmt=con.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                String pid=set.getString("pid");
                String name=set.getString("productname");
                String brand=set.getString("brand");
                String price=set.getString("price");
                String weight=set.getString("weight");
                String image=set.getString("image");
                String description=set.getString("description");
                String soldStatus=set.getString("soldstatus");
                String ownerEmail=set.getString("owneremail");
                products.add(new Product(pid,image,name,brand,price,weight,description,soldStatus,ownerEmail));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return products;
    }
    
    //get all products 
    public ArrayList<Product> getProducts(){
        ArrayList<Product> products=new ArrayList<>();
        try{
            String sql="select * from product";
            PreparedStatement stmt=con.prepareStatement(sql);
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                String pid=set.getString("pid");
                String name=set.getString("productname");
                String brand=set.getString("brand");
                String price=set.getString("price");
                String weight=set.getString("weight");
                String image=set.getString("image");
                String description=set.getString("description");
                String soldStatus=set.getString("soldstatus");
                String ownerEmail=set.getString("owneremail");
                products.add(new Product(pid,image,name,brand,price,weight,description,soldStatus,ownerEmail));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return products;
    }
    
    //updating product soldStatus
    public boolean updateSoldStatus(String pid){
        boolean flag=false;
        try{
            String sql="update product set soldstatus=? where pid=?";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setString(1, "sold");
            stmt.setString(2, pid);
            stmt.executeUpdate();
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    //Deleting a profuct
    public boolean deleteProduct(String pid){
        boolean flag=false;
        try{
            String sql="delete from product where pid=?";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setString(1, pid);
            stmt.executeUpdate();
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    //search product query
    public ArrayList<Product> searchProductBYQuery(String query){
        ArrayList<Product> products=new ArrayList<>();
        try{
            String sql="select * from product where productname like ? or price like ? or brand like ? ";
            PreparedStatement stmt=this.con.prepareStatement(sql);
            stmt.setString(1, "%"+query+"%");
            stmt.setString(2, "%"+query+"%");
            stmt.setString(3, "%"+query+"%");
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                String pid=set.getString("pid");
                String name=set.getString("productname");
                String brand=set.getString("brand");
                String price=set.getString("price");
                String weight=set.getString("weight");
                String image=set.getString("image");
                String description=set.getString("description");
                String soldStatus=set.getString("soldstatus");
                String ownerEmail=set.getString("owneremail");
                products.add(new Product(pid,image,name,brand,price,weight,description,soldStatus,ownerEmail));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return products;
    }
}

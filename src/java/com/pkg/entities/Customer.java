
package com.pkg.entities;

import com.pkg.dao.customerDAO;
import com.pkg.helper.connectionProvider;

public class Customer extends User{
    private String email;
    public Customer(){}
    public Customer(String firstName, String lastName, String email, String phone, String password, String usertype, String address, String pincode) {
        super(firstName, lastName, email, phone, password, usertype, address, pincode);
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public static void main(String args[]){
        Customer c=new Customer("raghav","Goud","raghav@xyz.com","7089818436",
                                 "raghav","customer","xyz is address","450119");
        customerDAO cd=new customerDAO(connectionProvider.getConnection());
        if(cd.saveCustomer(c)) System.out.println("customer inserted");
        else System.out.println("customer not inserted");;
    }

    @Override
    public String toString() {
        return "Customer{" + "email=" + email + '}';
    }

    
    
    
}

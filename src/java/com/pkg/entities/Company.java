
package com.pkg.entities;

public class Company extends User {
    private String email;
    private String companyName;
    public Company(){}
    public Company(String companyName, String firstName, String lastName, String email, String phone, String password, String usertype, String address, String pincode) {
        super(firstName, lastName, email, phone, password, usertype, address, pincode);
        this.companyName = companyName;
        this.email=email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @Override
    public String toString() {
        return "Company{" + "email=" + email + ", companyName=" + companyName + '}';
    }

       
}

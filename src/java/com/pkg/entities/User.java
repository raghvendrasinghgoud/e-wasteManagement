
package com.pkg.entities;

public class User{
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String password;
    private String usertype;
    private String address;
    private String pincode;

    public User(String firstName, String lastName, String email, String phone, String password, String usertype, String address, String pincode) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.usertype = usertype;
        this.address = address;
        this.pincode = pincode;
    }
    public User(){
    
    }

    public User(String firstName, String lastName, String email, String phone, String usertype, String address, String pincode) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.usertype = usertype;
        this.address = address;
        this.pincode = pincode;
    }
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    @Override
    public String toString() {
        return "User{" + "firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", phone=" + phone + ", password=" + password + ", usertype=" + usertype + ", address=" + address + ", pincode=" + pincode + '}';
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pkg.entities;

/**
 *
 * @author ragha
 */
public class Product {
    private String pid;
    private String image;
    private String name;
    private String brand;
    private String price;
    private String weight;
    private String description;
    private String soldStatus;
    private String ownerEmail;

    public Product(String pid, String image, String name, String brand, String price, String weight, String description, String soldStatus, String ownerEmail) {
        this.pid = pid;
        this.image = image;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.weight = weight;
        this.description = description;
        this.soldStatus = soldStatus;
        this.ownerEmail = ownerEmail;
    }

    public Product(String image, String name, String brand, String price, String weight, String description,String soldStatus, String ownerEmail) {
        this.image = image;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.weight = weight;
        this.description = description;
        this.ownerEmail = ownerEmail;
        this.soldStatus=soldStatus;
    }
    public Product(){}
    
    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSoldStatus() {
        return soldStatus;
    }

    public void setSoldStatus(String soldStatus) {
        this.soldStatus = soldStatus;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }

    @Override
    public String toString() {
        return "Product{" + "pid=" + pid + ", image=" + image + ", name=" + name + ", brand=" + brand + ", price=" + price + ", weight=" + weight + ", description=" + description + ", soldStatus=" + soldStatus + ", ownerEmail=" + ownerEmail + '}';
    }
    
   
}

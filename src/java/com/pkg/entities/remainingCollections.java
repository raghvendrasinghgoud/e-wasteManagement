/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pkg.entities;

/**
 *
 * @author ragha
 */
public class remainingCollections {
    private String pid;
    private String companyEmail;
    private String ownerEmail;

    public remainingCollections(String pid, String companyEmail, String ownerEmail) {
        this.pid = pid;
        this.companyEmail = companyEmail;
        this.ownerEmail = ownerEmail;
    }
    
     public remainingCollections(String pid, String companyEmail) {
        this.pid = pid;
        this.companyEmail = companyEmail;
    }
    
    public remainingCollections(){
    
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }

    @Override
    public String toString() {
        return "remainingCollections{" + "pid=" + pid + ", companyEmail=" + companyEmail + ", ownerEmail=" + ownerEmail + '}';
    }
    
    
}

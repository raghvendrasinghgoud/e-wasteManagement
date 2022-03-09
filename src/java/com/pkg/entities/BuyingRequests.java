
package com.pkg.entities;

public class BuyingRequests {
    private String pid;
    private String companyEmail;
    private String ownerEmail;
    public BuyingRequests(String pid, String companyEmail,String ownerEmail) {
        this.pid = pid;
        this.companyEmail = companyEmail;
        this.ownerEmail=ownerEmail;
    }

    public BuyingRequests() {
    }
    public BuyingRequests(String pid,String companyEmail){
        this.companyEmail=companyEmail;
        this.ownerEmail=ownerEmail;
        this.pid=pid;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
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

    @Override
    public String toString() {
        return "BuyingRequests{" + "pid=" + pid + ", companyEmail=" + companyEmail + ", ownerEmail=" + ownerEmail + '}';
    }
    
    
}

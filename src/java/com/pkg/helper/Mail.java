package com.pkg.helper;


import java.util.Random;
import java.util.Properties;
import java.util.stream.IntStream;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
    //sending OTP
    private String from="ewastemanagement14@gmail.com";
    private String password="Neeraj@123";
    public String getOtp(){
          int temp=new Random().nextInt(10000);
          String otp="";
          otp=Integer.toString(temp);
          System.out.println(otp+" is this");
          return otp;
    }
    
    public void sendOTP(String to,String message){
        String host="smtp.gmail.com";
        //geting system properties
        Properties sysProperties=System.getProperties();
        //setting host
        sysProperties.put("mail.smtp.host", host);
        sysProperties.put("mail.smtp.port", "465");
        sysProperties.put("mail.smtp.ssl.enable", "true");
        sysProperties.put("mail.smtp.auth", "true");
        
        //getting session
       Session mailSession=Session.getInstance(sysProperties, new Authenticator(){
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from,password); //To change body of generated methods, choose Tools | Templates.
            }
                         
       });
       mailSession.setDebug(true);
       
       //composing the message
       MimeMessage msg= new MimeMessage(mailSession);
       try{
           //set from 
           msg.setFrom(from);
           //set reciepiend
           msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
           
           //adding subject to message
		msg.setSubject("OTP from ewaste");
            //set mesaage
            msg.setText(message);
            
            //send the otp to user email
            Transport.send(msg);
            System.out.println("Otp send succesfully ");
       }catch(Exception e){
           e.printStackTrace();
       }
        
    }
    //function to compare otp
    public boolean compOTP(String sysOTP,String userOTP){
        if(sysOTP.equals(userOTP)) return true;
        else return false;
    }
    //Driver code
    public static void main(String args[]){
        new Mail().sendOTP("raghavendrasinghgoud@gmail.com", new Mail().getOtp());
    }
}

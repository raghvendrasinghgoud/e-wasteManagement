/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pkg.helper;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;

/**
 *
 * @author ragha
 */
public class Helper {
//    public static boolean saveFile(InputStream is,String path){
//        boolean flag=false;
//        try{
//        byte b[]=new byte[is.available()];
//        is.read(b);
//        FileOutputStream fos=new FileOutputStream(path);
//        fos.write(b);
//        flag=true;
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//        return flag;
//    }
    public static String ImageFilePath="D:\\ewasteNew\\web\\Products_Image\\";
    public static boolean saveImage(InputStream is,String path){
        boolean flag=false;
        try {
            
        Image image = ImageIO.read(is);

        BufferedImage bi = createResizedCopy(image, 240, 300, true);
        ImageIO.write(bi, "jpg", new File(path));
        flag=true;
    } catch (IOException e) {
        System.out.println("Error");
    }
    return flag;
    }
    //Resize image
    static BufferedImage createResizedCopy(Image originalImage, int scaledWidth, int scaledHeight, boolean preserveAlpha) {
    int imageType = preserveAlpha ? BufferedImage.TYPE_INT_RGB : BufferedImage.TYPE_INT_ARGB;
    BufferedImage scaledBI = new BufferedImage(scaledWidth, scaledHeight, imageType);
    Graphics2D g = scaledBI.createGraphics();
    if (preserveAlpha) {
        g.setComposite(AlphaComposite.Src);
    }
    g.drawImage(originalImage, 0, 0, scaledWidth, scaledHeight, null);
    g.dispose();
    return scaledBI;
}
    
    //deleteing file
    public static boolean delete(String path){
    boolean flag=false;
    try{
    File f=new File(path);
    f.delete();
    flag=true;
    }catch(Exception e){
        e.printStackTrace();
    }
    return flag;
    }
}

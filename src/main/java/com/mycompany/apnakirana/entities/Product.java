
package com.mycompany.apnakirana.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.servlet.http.Part;


@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int productId;
    private String productName;
    @Column(length = 1500, name = "product_desc")
    private String productDesc;
    private String productPhoto;
    private int productPrice;
    private int productDiscount;
    private int productQuantity;
    
    @ManyToOne
    private Category category;

    public Product(int productId, String productName, String productDesc, String productPhoto, int productPrice, int productDiscount, int productQuantity, Category category) {
        this.productId = productId;
        this.productName = productName;
        this.productDesc = productDesc;
        this.productPhoto = productPhoto;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQuantity = productQuantity;
        this.category=category;
    }

    public Product(String productName, String productDesc, String productPhoto, int productPrice, int productDiscount, int productQuantity) {
        this.productName = productName;
        this.productDesc = productDesc;
        this.productPhoto = productPhoto;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQuantity = productQuantity;
    }

    public Product() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductPhoto() {
        return productPhoto;
    }

    public void setProductPhoto(String productPhoto) {
        this.productPhoto = productPhoto;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(int productDiscount) {
        this.productDiscount = productDiscount;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    
    
    
    
    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", productDesc=" + productDesc + ", productPhoto=" + productPhoto + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount + ", productQuantity=" + productQuantity + '}';
    }

//    public void setProductPhoto(Part part) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//    
 
    //Calculating Discounted Price
    public int getDiscountPrice(){
        int dPrice =(int)(this.productPrice - ((this.productPrice * this.productDiscount) / 100.0));
        return dPrice;
    }
    
}

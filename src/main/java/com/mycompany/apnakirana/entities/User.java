/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.apnakirana.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Harsh
 */
@Entity
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "user_id")
    private int userId;
    @Column(length = 100, name = "user_name")
    private String userName;
    @Column(length = 100, name = "user_email")
    private String userEmail;
    @Column(length = 100, name = "user_Password")
    private String userPassword;
    @Column(length = 12, name = "user_Phone")
    private String userPhone;
    @Column(length = 1500, name = "user_pic")
    private String userPic;
    @Column(length = 1500, name = "user_Address")
    private String userAddress;
    
    @Column(name="user_type")
    private String userType;
            
    //Below is the prametrised constructor using all the variables
    public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress, String userType) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
    }
    
    //Below is parametrised constructor without id 

    /**
     *
     * @param userName
     * @param userEmail
     * @param userPassword
     * @param userPhone
     * @param userPic
     * @param userAddress
     * @param userType
     */
    public User(String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress, String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
    }
    
    //Default constructor
    public User() {
    }

    public User(String userName, String userEmail, String userPassword, String userPhoneNo, String defaultjpg, String userAddress) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    //getters and setter for all the variables are described below
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
    
    
    
    //toString method to call strings for all the variable in ones

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + ", userType=" + userType + '}';
    }

    
    
}

package com.mycompany.apnakirana.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author Harsh
 */
@Entity
public class Category {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "category_id")
    private int categoryId;
    
    @Column(length = 100, name = "category_title")
    private String categoryTitle;
    
    @Column(length = 1500, name = "category_description")
    private String categoryDescription;
    
    
    //Since one category can have multiple products, So we will be constructing an array list for same
    @OneToMany(mappedBy = "category")
    private List<Product> product = new ArrayList<>();
    //Default Constructor
    public Category() {
    }
    
    //Parametrised constructor with all the variables
    public Category(int categoryId, String categoryTitle, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
    }
    
    //parametrised constructor excluding Id

    public Category(String categoryTitle, String categoryDescription, List<Product> products) {
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
        this.product=products;
    }
    
    //Constructor with product values also
    
    
    
    
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProduct() {
        return product;
    }

    public void setProduct(List<Product> product) {
        this.product = product;
    }
    
    
    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescription=" + categoryDescription + '}';
    }
    
    
    
}

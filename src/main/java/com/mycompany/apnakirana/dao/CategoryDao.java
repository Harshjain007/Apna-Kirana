
package com.mycompany.apnakirana.dao;

import com.mycompany.apnakirana.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao{

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(Category cat){
        
        Session session = this.factory.openSession();
        
        Transaction tx = session.beginTransaction();
        
        int catId = (int)session.save(cat);
        tx.commit();
        session.close();
        
        return catId;
    }
    
    //This function will help to fetch the list of category from the db 
    public List<Category> getCategories(){
        
        Session s = this.factory.openSession();
        
        Query query = s.createQuery("from Category");
        
        List<Category> list = query.list();
        return list;
    }
    
    //Function to have 
    
    public Category getCategoryById(int cid){
        Category cat=null;
        try{
            
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return cat;
    }
    
    // getting entire list Of category.
    
//    public List<Category> getAllCategory(){
//        
//        Session s = this.factory.openSession();
//        Query query = s.createQuery("from Category");
//        List<Category> list = query.list();
//        return list;
//        
//    }
}
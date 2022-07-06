//Data Access Object class for user authentication
package com.mycompany.apnakirana.dao;

import com.mycompany.apnakirana.entities.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    
   private SessionFactory factory;
   
   public UserDao(SessionFactory factory){
       this.factory = factory;
   }
   
   //getting user by Email and Password
   
   public User getUserByEmailAndPassword(String email, String password){
        User user =null;
        try{
            
            String query = "from User where userEmail =: e and userPassword=: p";
            Session session = this.factory.openSession();
            Query q =session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            
            user = (User)q.uniqueResult();
            
            session.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
       return user;
   }
   
   public List<User> getAllUser(){
        
        Session uS = this.factory.openSession();
        Query query=uS.createQuery("from User");
        List<User> list = query.list();
        return list;
    }
}

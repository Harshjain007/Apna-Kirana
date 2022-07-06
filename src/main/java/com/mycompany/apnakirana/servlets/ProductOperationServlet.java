
package com.mycompany.apnakirana.servlets;

import com.mycompany.apnakirana.dao.CategoryDao;
import com.mycompany.apnakirana.dao.ProductDao;
import com.mycompany.apnakirana.entities.Category;
import com.mycompany.apnakirana.entities.Product;
import com.mycompany.apnakirana.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( 
                PrintWriter out = response.getWriter()) {
            
            
            String op = request.getParameter("operation");
            
            if(op.trim().equals("addcategory")){
                
            //Fetching details of newly added category
                
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
                                
                //Sending data to the data base.
                CategoryDao categoryDao =  new CategoryDao(FactoryProvider.getFactory());
                
                int catId=categoryDao.saveCategory(category);
                
                //out.println("Category Saved");
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "New Category Added Successfully..");
                response.sendRedirect("admin.jsp");
                return;
                
                
            }
            else if(op.trim().equals("addproducts")){
                
                //Here we will be having product to db and we will be interacting it with DB
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDisc = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                
                //Code to Store image
                Part part = request.getPart("pPic");
                
                // Constructor of product
                Product p = new Product();
                p.setProductName(pName);
                p.setProductDesc(pDesc);
                p.setProductPrice(pPrice);
                p.setProductDiscount(pDisc);
                p.setProductQuantity(pQuantity);
                p.setProductPhoto(part.getSubmittedFileName());
                
                
                //get category by id
                CategoryDao cdoa = new CategoryDao (FactoryProvider.getFactory());
                Category category = cdoa.getCategoryById(catId);
                
                p.setCategory(category);
                
                //product save...
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                
                
                //Below code will find the path to upload photo
                //Finding the path of Image
                
                try{
                
                    String path = request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                    System.out.println(path);
                    
                    //Code to Upload image
                    
                    FileOutputStream fos = new FileOutputStream(path);
                    
                    InputStream is = part.getInputStream();
                    
                    //Reading data
                    
                    byte []data=new byte[is.available()];
                    is.read(data);
                    
                    //Writing od Data
                    fos.write(data);
                    
                    fos.close();
                    is.close();
                    
                    }catch(Exception e){
                    e.printStackTrace();
                }
                            
                    
                
                //Code for image Ends
                
                
                
                out.println("Product saved SuccessFully...");
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "New Product Added Successfully..");
                response.sendRedirect("admin.jsp");
                return;
                
            }
            

            


        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

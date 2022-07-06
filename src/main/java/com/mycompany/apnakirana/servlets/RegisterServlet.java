package com.mycompany.apnakirana.servlets;

import com.mycompany.apnakirana.entities.User;
import com.mycompany.apnakirana.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Harsh
 */
public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhoneNo = request.getParameter("user_phoneno");
                String userAddress = request.getParameter("user_address");
                
                //Validation at the server side
                
                if(userName.isEmpty()){
                    out.println("User Name cannot be Empty");
                }
                
                //We will be creating an object of user class to store Data
                
                User user = new User(userName, userEmail, userPassword, userPhoneNo, "default.jpg", userAddress,"Normal");
                
                //Here we save the user data using hibernate
                
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();
                
                int userId = (int) hibernateSession.save(user);
                
                tx.commit();
                hibernateSession.close();
                
                
                HttpSession httpsession = request.getSession();                
                httpsession.setAttribute("message", "Registration Successful !!");
                response.sendRedirect("register.jsp");
                
                return;
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

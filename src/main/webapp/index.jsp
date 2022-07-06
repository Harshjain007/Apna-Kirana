<%@page import="com.mycompany.apnakirana.helper.Helper"%>
<%@page import="com.mycompany.apnakirana.entities.Category"%>
<%@page import="com.mycompany.apnakirana.dao.CategoryDao"%>
<%@page import="com.mycompany.apnakirana.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.apnakirana.dao.ProductDao"%>
<%@page import="com.mycompany.apnakirana.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apna Kirana</title>

        <link rel="icon" href="img/Logo22.png" type="image/icon type">


        
    </head>
    <body>
        <%@include file="components/all_css_js.jsp" %>
        <%@include file="components/navbar_basic.jsp" %>

        <div class="container-fluid">
            
            <div class="row mt-3 mx-3">
                
        <!--Java Code for displaying Category-->

                <%            
                    String cat=request.getParameter("category");
                    
                    
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    
                    try{
                    if(cat.trim().equals("all")){
                        list = dao.getAllProducts();
                    }
                    else{
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getProductByCategoryId(cid);
                    }
                    }catch(Exception e){
                        list = dao.getAllProducts();
                    }
                    

                    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> cList = cDao.getCategories();


                %>

                <!-- Displaying Categories-->
                <div class="col-md-2">


                    <div class="list-group">

                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action custom-bg" aria-current="true">Categories</a>



                        <%                        for (Category c : cList) {

                        %>
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>

                        <% } %>

                    </div>
                </div>

                        
                        
                <!-- Displaying Products-->
                <div class="col-md-10">

                    <div class="row row-cols-3 row-cols-md-3 g-4">


                <!--  Traversal Of products-->
                        <%
                            for (Product p : list) {
                        %>
                        <div class="col">
                            
                            <div class="card ">
                                
                                <div class="card-body">
                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getProductPhoto()%>" class="card-img-top m-2" style="max-height: 175px;max-width: 100%;width: auto;" alt="<%= p.getProductName()%>">
                                    </div>
                                    <h5 class="card-title"><%= p.getProductName()%></h5> 
                                    <p class="card-text"><%= Helper.get10Words(p.getProductDesc()) %></p>
                                </div>
                          

                                <div class="card-footer text-center">

                                    
                                    <button class="btn" style="background-color: #5382A1" onclick="addToBag(<%= p.getProductId() %> , '<%= p.getProductName() %>' , <%= p.getDiscountPrice() %>)" >Keep in Bag</button>
                                    <button class="btn btn-outline-success" ><s> &#8377 <%= p.getProductPrice()%></s><span class="text-secondary discount-btn">- <%= p.getProductDiscount() %>% off</span>  &#8377 <%= p.getDiscountPrice() %></button>

                                </div>
                            </div>    

                        </div>


                        <%}%>
                    </div>

                </div>  

                   
              
                    
                    
                    
                    
            </div>
        </div>         



                       <%@include file="components/modals.jsp" %>
                        
                        
    </body>
</html>

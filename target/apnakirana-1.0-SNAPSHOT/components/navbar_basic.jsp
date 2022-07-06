<%@page import="com.mycompany.apnakirana.entities.Product"%>
<%@page import="com.mycompany.apnakirana.dao.ProductDao"%>
<%@page import="com.mycompany.apnakirana.entities.Category"%>
<%@page import="com.mycompany.apnakirana.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.apnakirana.dao.CategoryDao"%>
<%@page import="com.mycompany.apnakirana.entities.User"%>

<%
    
        String cat1=request.getParameter("category");
        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
        List<Product> list2 = null;
        
        User user1 = (User)session.getAttribute("current-user");
        CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
        List<Category> cList1=cdao.getCategories();
        
                try{
                    if(cat1.trim().equals("all")){
                        list2 = pdao.getAllProducts();
                    }
                    else{
                        int cid = Integer.parseInt(cat1.trim());
                        list2 = pdao.getProductByCategoryId(cid);
                    }
                    }catch(Exception e){
                        list2 = pdao.getAllProducts();
                    }
                    

            
%>

<nav class="navbar navbar-expand-lg  navbar-light custome-bg-nav" >
  <div class="container-fluid">
    
    <a class="navbar-brand" href="index.jsp">
             <img src="img/Logo22.png" width="90" height="75" alt="logo">
         </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Category
          </a>
<!--          //Dynamic Code for category Drop down-->
    
    

        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
        <%
                        for(Category ct:cList1){
                          
                    %>

          
            <li><a class="dropdown-item" href="index.jsp?category=<%= ct.getCategoryId()%>"><%= ct.getCategoryTitle() %></a></li>
            <% } %>
          </ul>
            
            
        </li>
        </ul>
        
          
          <!-- Login and register -->
        <ul class="navbar-nav ml-auto">
            
            <!-- cart-->
            
            <li class="nav-item active">
                <a class="nav-link " href="#!" data-toggle="modal" data-bs-toggle="modal" data-bs-target="#cart"  ><i class="bi bi-bag-fill" style="font-size: 25px;"></i><span class="ml-3 cart-items">( 0 )</span></a>
            </li>
            
                <%
                    if(user1==null){
                %>
                    <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="register.jsp">Register</a>
                    </li>  
                    
                <%
                }
                else{
                
                %>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="frontpage.jsp"><%=user1.getUserName() %></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="LogoutServlet">Logout</a>
                    </li>  
                
                <%
                }
            %>
            
           
        </ul>
        
      
    </div>
  </div>
</nav>
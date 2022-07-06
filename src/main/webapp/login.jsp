<%-- 
    Document   : login page
    Author     : Harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="icon" href="img/Logo22.png" type="image/icon type">
        <%@include file="components/all_css_js.jsp" %>
    </head>
    
    <body>   
        
    <%@include file="components/navbar_basic.jsp" %>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card mt-4">
                    
                    <div class="card-header text-center" style="background-color: #5382A1;">
                        
                        <h1>Login</h1>
                        
                    </div>
                    
                    
                    <div class="card-body">
                        
                        <%@include file="components/message.jsp" %>
                            
                        <form action="LoginServlet" method="post">
                            <div class="form-group mt-2">
                              <label for="exampleInputEmail1">Email address</label>
                              <input name="email" type="email" class="form-control mt-2" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group mt-4">
                              <label for="exampleInputPassword1">Password</label>
                              <input name="password" type="password" class="form-control mt-2" id="exampleInputPassword1" placeholder="Password">
                            </div>
                      
                            <div class="container text-center" >

                                <button type="submit" class="btn btn-primary mt-4" style="background-color: #5382A1;">Login</button>
                                <button type="reset" class="btn btn-primary mt-4 border-0" style="background-color: #5382A1;">Reset</button>

                            </div>
                            
                            <div class="container text-center mt-2">
                                <p>If not Registered...
                                <a href="register.jsp">click</a>
                                </p>
                            </div>


                      </form>

                        
                    </div>
             
                </div>
            </div>
        </div>
    </div>    
    
        
        
        
  </body>      
    
</html>

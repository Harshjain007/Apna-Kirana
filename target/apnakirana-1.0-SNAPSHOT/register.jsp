<%-- 
    Document   : register
    Created on : Jul 21, 2021, 2:55:25 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>new User? Register</title>
        <link rel="icon" href="img/Logo22.png" type="image/icon type">
        <%@include file="components/all_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar_basic.jsp" %>
<!--        here we will be taking values from the user while he register's-->
        <div class="container-fluid">
            
            <div class="row mt-5">
                
            <div class="col-md-4 offset-md-4">
                
                <div class="card">
                    
                     <%@include file="components/message.jsp" %>
                               
                    
                 <div class="card-body px-5">
                           
                <!-- Page to register is here -->
                
                <h3 class="text-center mg-5">Sign Up / Register</h3>
                
                <form action="RegisterServlet" method="post">
                    
<!--                    Input form for user name-->
                       <div class="form-group">
                        <label for="name">User Name</label>
                        <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                      </div>

<!--                    Input form for user email-->
                       <div class="form-group">
                        <label for="email">User Email</label>
                        <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                      </div>

<!--                    Input form for user password-->
                       <div class="form-group">
                        <label for="password">User Password</label>
                        <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter password">
                      </div>

<!--                    Input form for user mobile-->
                       <div class="form-group">
                        <label for="phoneno">User Phoneno.</label>
                        <input name="user_phoneno" type="number" class="form-control" id="phoneno" aria-describedby="emailHelp" placeholder="Enter phone number">
                      </div>

<!--                    Input form for user Address-->
                       <div class="form-group">
                        <label for="address">User Address</label>
                        <textarea name="user_address" style="height: 100px" class="form-control" id="address" placeholder="Enter your address"></textarea>
                        
                       </div>
                        <div class="container text-center ">
                            <button type="submit" class="btn btn-outline-success">
                                Register
                            </button>
<!--                            <button type=" reset" class="btn btn-outline-warning">
                                Reset
                            </button>-->
                        </div>

                            <div class="container text-center mt-2">
                                <p>Already Registered...
                                <a href="login.jsp">click</a>
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

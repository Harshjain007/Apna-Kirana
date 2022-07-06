<%@page import="com.mycompany.apnakirana.dao.UserDao"%>
<%@page import="com.mycompany.apnakirana.entities.Product"%>
<%@page import="com.mycompany.apnakirana.dao.ProductDao"%>
<%@page import="com.mycompany.apnakirana.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.apnakirana.helper.FactoryProvider"%>
<%@page import="com.mycompany.apnakirana.dao.CategoryDao"%>
<%@page import="com.mycompany.apnakirana.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin! Only admin Access allowed.");
            response.sendRedirect("login.jsp");

            return;
        }

    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin/Apna Kirana</title>
        <link rel="icon" href="img/Logo22.png" type="image/icon type">
        <%@include file="components/all_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar_basic.jsp" %>

        <div class="container admin">
            
            <div class="container-fluid">
                
                <%@include file="components/message.jsp" %>
                
            </div>

            <div class="row mt-3">
                
            <% 
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list1=dao.getAllProducts();

                //The code below will be fetching the entire list from the category table and display it in the drop down to choose from
                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> list = cDao.getCategories();
                
                UserDao uDao = new UserDao(FactoryProvider.getFactory());
                List<User> uList = uDao.getAllUser();
                

            %>
                
                

                <!-- Customers Details -->

                <div class="col-md-4">


                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/rating.png" alt="customers"/>
                            </div>

                            <h1 class="mt-2">Customers</h1>
                            
                            <h1><%= uList.size()%></h1>
                        </div>

                    </div>

                </div>   

                
                <!-- Categories -->

                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/box.png" alt="categories"/>
                            </div>

                            <h1 class="mt-2">Categories</h1>
                            
                            <h1><%= list.size() %></h1>
                        </div>

                    </div>

                </div>   

                <!-- Products -->

                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/productList.png" alt="product"/>
                            </div>

                            <h1 class="mt-2">Products</h1>

                            <h1><%= list1.size() %></h1>
                        </div>

                    </div>

                </div> 


            </div>

            <!--            Adding New products to the shop -->

            <div class="row mt-3">

                <!--                Add Category card-->

                <div class="col-md-6">

                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-category">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/calculator.png" alt="customers"/>
                            </div>

                            <h1 class="mt-2">Add Category</h1>


                        </div>

                    </div>

                </div>

                <!--Add products card-->
                
                <div class="col-md-6">

                    <div class="card " data-bs-toggle="modal" data-bs-target="#add-products">
                        
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/list.png" alt="add products"/>
                            </div>

                            <h1 class="mt-2">Add Products</h1>


                        </div>

                    </div>

                </div>



            </div>


        </div>






        <!-- Modal For add category -->


        <!-- Modal -->
        <div class="modal fade" id="add-category" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h5 class="modal-title " id="exampleModalLabel">Add Categories Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">
                            
                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">

                                <h6>Category Name:</h6>
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter new Category" required />

                            </div>

                            <div class="form-group mt-2">

                                <h6>Category Description:</h6>
                                <textarea placeholder="Enter category description" class="form-control" name="catDescription" required ></textarea>


                            </div>

                            <div class="container text-center mt-3">

                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="reset" class="btn btn-outine-warning">Reset</button>

                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!-- Modal End for add category -->
        
        
        
        
        
<!--Code for Product ADDING-->

        <!--        Modal For add Product-->

            
        <!-- Modal -->
        <div class="modal fade" id="add-products" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h5 class="modal-title " id="exampleModalLabel">Add Product Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        
                        <!-- Form for product input-->
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addproducts"/>
                            
                        <!--  Product name-->
                            <div class="form-group mt-2">
                                <h6>Product Title</h6>
                                <input type="text" class="form-control" placeholder="Enter product name" name="pName" required />
                            </div>

<!--                            Product Description-->
                              <div class="form-group mt-2">
                                <h6>Product Description</h6>
                                <textarea class="form-control" placeholder="Enter Product Desciption" name="pDesc" required></textarea>
                            </div>

                    <!--  Product Price-->
                            <div class="form-group mt-2">
                                <h6>Product Price</h6>
                                <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required />
                            </div>

                    <!-- Product Discount-->
                            <div class="form-group mt-2">
                                <h6>Product Discount</h6>
                                <input type="number" class="form-control" placeholder="Enter Discount on product" name="pDiscount" required />
                            </div>

                    <!-- Product Quantity-->
                            <div class="form-group mt-2">
                                <h6>Product Quantity</h6>
                                <input type="number" class="form-control" placeholder="Enter quantity of product" name="pQuantity" required />
                            </div>

                    

                        
                        
                        <!--  Product Category-->
                            <div class="form-group mt-2">
                                <h6>Product Discount</h6>
                                <select name="catId" class="form-control" id="">
                                    
                                    <%
                                    for(Category c: list){
                                    %>
                                    
                                    <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                    
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                        <!--Product Image-->
                            <div class="form-group mt-2">
                                <h6>Product Image</h6>
                                <input type="file" class="form-control" name="pPic" required />
                            </div>
                        
<!--                        Button at the bottom of the form-->

                            <div class="container text-center mt-3">

                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="reset" class="btn btn-outine-warning">Reset</button>

                            </div>



                        </form>
                        <!--Form end for product-->
                    </div>

                </div>
            </div>
        </div>




        <!--       End Modal For add Product-->

        
<!-- End Code for Product ADDING        -->
        
        


    </body>
</html>

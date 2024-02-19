<%-- 
    Document   : index.jsp
    Created on : Jan 16, 2024, 8:21:17 PM
    Author     : THevY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <link href="img/favicon.ico" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Supplier</title>

        <link href="css/styleOrders.css" rel="stylesheet">
    </head>
    <style>
        body{
            overflow-x: hidden;
        }

    </style>
    <body>
        <div class="table-title " >
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Supplier</b></h2>
                        </div>
                        <div class="col-sm-6 " style="display: flex; justify-content: center">
                            <a data-bs-target="#addEmployeeModal"  class="btn btn-success " data-bs-toggle="modal" ><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
<!--                            <a href="delete?pid=${p.productId}" class="btn btn-danger " data-bs-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						-->
                        </div>
                    </div>
                </div>
        <form action="search" method="get"  role="search" >
            <div class="row mb-2">
                <div class="col-6">
                    <input style="margin-left: 80px"  class="form-control me-2"  type="search" name="search" value="${search}" placeholder="Search" aria-label="Search">
                </div> 
                <div class="col-3">
                    <button style="margin-left: 60px" class="btn btn-outline-success" type="submit">Search</button>
                </div>
            </div>
        </form>


        <section class="intro">
            <div class="bg-image h-100" style="background-color: #f5f7fa;">
                <div class="mask d-flex align-items-center h-100">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body p-0">
                                        <div class="table-responsive table-scroll" data-mdb-perfect-scrollbar="true" style="position: relative; height: 700px">
                                            <table class="table table-striped mb-0">
                                                <thead style="background-color: #002d72;">
                                                    <tr>
                                                        <th scope="col">Id</th>
                                                        <th scope="col">Supplier Name</th>
                                                        <th scope="col">Telephone Number</th>
                                                        <th scope="col">Address</th>
                                                        <th scope="col">Action</th>
                                                        <th scope="col"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.list}" var="item">
                                                        <tr>
                                                            <td>${item.getId()}</td>
                                                            <td>${item.getName()}</td>
                                                            <td>${item.getTelNum()}</td>
                                                            <td>${item.getAddress()}</td>
                                                            <td><a href="./load?id=${item.id}" class="edit" data-bs-toggle="modal"><i class="material-icons" data-bs-toggle="tooltip" title="Edit">&#xE254;</i></a></td  >
                                                            <td><a href="./deletesupplier?id=${item.id}" class="delete" data-bs-toggle="modal"><i class="material-icons" data-bs-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                 <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Supplier</h4>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Telephone</label>
                                <input name="telephone" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input name="address" type="text" class="form-control" required>
                            </div>
                           
                            
                           

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
                
                


        <script src="js/search.js"></script>
    </body>
</html>

<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Language" %>
<%@ page import="db.Publication" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp"%>
    <style>

        .sidebar-sticky {
            position: relative;
            top: 0;
            height: calc(100vh - 48px);
            padding-top: 1rem;
            overflow-x: hidden;
            overflow-y: auto;
        }
    </style>
</head>
<body>
<%@include file="vendor/navbar_admin.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%request.setCharacterEncoding("UTF-8");%>
<%
    String success = request.getParameter("success");
    if(success != null){
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    Operation was processed successfully!!!
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
%>
<div class="row">
    <nav class="col-md-2 col-lg-2 d-none d-md-block bg-light sidebar">
        <div class="container pt-5">
            <h5>ADMIN PANEL</h5>
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="/admin">Languages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/publications">Publications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="/admin/news">News</a>
                    </li>
                </ul>
            </div>
        </div>

    </nav>
    <%--        <div class="col-2" style="background-color: beige;">--%>
    <%--            <div class="container">--%>
    <%--                <h5>ADMIN PANEL</h5>--%>
    <%--                <ul class="nav flex-column">--%>
    <%--                    <li class="nav-item">--%>
    <%--                        <a class="nav-link" href="/admin/languages">Languages</a>--%>
    <%--                    </li>--%>
    <%--                    <li class="nav-item">--%>
    <%--                        <a class="nav-link text-dark" href="/admin/publications">Publications</a>--%>
    <%--                    </li>--%>
    <%--                    <li class="nav-item">--%>
    <%--                        <a class="nav-link text-dark" href="/admin/news">News</a>--%>
    <%--                    </li>--%>
    <%--                </ul>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <div class="col-10">
        <div class="container pt-5 mb-5">
            <div class="row d-flex justify-content-between">
                <h4>Publications</h4>
                <button type="button" style="background-color: #08a800; font-weight: bold;" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    + ADD NEW
                </button>
                <%--            <a href="/clubdetails" class="btn btn-info btn-sm">+ ADD NEW</a>--%>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="/addPublication" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add new publication</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>NAME: </label>
                                        <input type="text" name="name" class="form-control" placeholder="Name of publication">
                                    </div>
                                    <div class="form-group">
                                        <label>DESCRIPTION: </label>
                                        <textarea name="description" type="text" class="form-control" placeholder="Description..."></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>RATING: </label>
                                        <input name="rating" type="number" step="0.01" class="form-control" placeholder="Rating...">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-weight: bold;">Cancel</button>
                                    <button class="btn btn-primary" style="font-weight: bold;">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">NAME</th>
                <th scope="col">DESCRIPTION</th>
                <th scope="col">RATING</th>
                <th scope="col">OPERATIONS</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Publication> publications = (ArrayList<Publication>)request.getAttribute("publications");
                if (publications != null) {
                    for (Publication publication : publications) {
            %>
            <tr>
                <th scope="row"><%=publication.getId()%></th>
                <td><%=publication.getName()%></td>
                <td><%=publication.getDescription()%></td>
                <td><%=publication.getRating()%></td>
                <td class="d-flex justify-content-end">

                    <button type="button" class="btn btn-primary" style="font-weight: bold;" data-toggle="modal" data-target="#edit<%=publication.getId()%>">
                        EDIT
                    </button>

                    <div class="modal fade" id="edit<%=publication.getId()%>" tabindex="-1" aria-labelledby="edit<%=publication.getId()%>Label" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/editPublication" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id = "edit<%=publication.getId()%>Label">Edit publication</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>NAME: </label>
                                            <input type="text" name="name" value="<%=publication.getName()%>" class="form-control">
                                            <input type="hidden" name="id" value="<%=publication.getId()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>DESCRIPTION: </label>
                                            <textarea name="description" value="<%=publication.getDescription()%>" class="form-control"><%=publication.getDescription()%></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>NAME: </label>
                                            <input type="number" name="rating" step="0.01" value="<%=publication.getRating()%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <button class="btn btn-primary">EDIT</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <%--                        <a href="/deleteLanguage?id=<%=language.getId()%>" class="btn btn-info btn-sm ml-3" style="background-color: red; font-weight: bold;">DELETE</a>--%>
                    <form action="/deletePublication" method="post">
                        <input type="hidden" name="id" value="<%=publication.getId()%>">
                        <button class="btn btn-info btn-sm ml-3" style="background-color: red; font-weight: bold;">DELETE</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

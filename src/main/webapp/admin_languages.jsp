<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Language" %>
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
                        <a class="nav-link " href="/admin">Languages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="/admin/publications">Publications</a>
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
                <h4>Languages</h4>
                <button type="button" style="background-color: #08a800; font-weight: bold;" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    + ADD NEW
                </button>
                <%--            <a href="/clubdetails" class="btn btn-info btn-sm">+ ADD NEW</a>--%>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="/addLanguage" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add new language</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>NAME: </label>
                                        <input type="text" name="name" class="form-control" placeholder="Name of language">
                                    </div>
                                    <div class="form-group">
                                        <label>CODE: </label>
                                        <input name="code" type="text" class="form-control" placeholder="Code...">
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
                <th scope="col">CODE</th>
                <th scope="col">OPERATIONS</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Language> languages = (ArrayList<Language>)request.getAttribute("languages");
                if (languages != null) {
                    for (Language language : languages) {
            %>
            <tr>
                <th scope="row"><%=language.getId()%></th>
                <td><%=language.getName()%></td>
                <td><%=language.getCode()%></td>
                <td class="d-flex justify-content-end">

                    <button type="button" class="btn btn-primary" style="font-weight: bold;" data-toggle="modal" data-target="#edit<%=language.getId()%>">
                        EDIT
                    </button>

                    <div class="modal fade" id="edit<%=language.getId()%>" tabindex="-1" aria-labelledby="edit<%=language.getId()%>Label" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/editLanguage" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id = "edit<%=language.getId()%>Label">Edit language</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>NAME: </label>
                                            <input type="text" name="name" value="<%=language.getName()%>" class="form-control">
                                            <input type="hidden" name="id" value="<%=language.getId()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>CODE: </label>
                                            <input name="code" value="<%=language.getCode()%>" class="form-control"></input>
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
                    <form action="/deleteLanguage" method="post">
                        <input type="hidden" name="id" value="<%=language.getId()%>">
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

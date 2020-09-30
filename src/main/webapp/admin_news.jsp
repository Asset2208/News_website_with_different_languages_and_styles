<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Language" %>
<%@ page import="db.Publication" %>
<%@ page import="db.News" %>
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
                        <a class="nav-link text-dark" href="/admin/publications">Publications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/news">News</a>
                    </li>
                </ul>
            </div>
        </div>

    </nav>
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
                            <form action="/addNews" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add new News</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>TITLE: </label>
                                        <input type="text" name="title" class="form-control">
                                        <input type="hidden" name="id">
                                    </div>
                                    <div class="form-group">
                                        <label>SHORT CONTENT: </label>
                                        <textarea name="short_content"  class="form-control"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>CONTENT: </label>
                                        <textarea name="content" class="form-control"></textarea>
                                    </div>
                                    <select class="form-control form-control-lg" name="language">
                                        <%
                                            ArrayList<Language> languages = (ArrayList<Language>) request.getAttribute("languages");

                                            if (languages != null) {
                                                for (Language language : languages) {
                                        %>
                                        <option value="<%=language.getId()%>"><%=language.getCode()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                    <select class="form-control form-control-lg" name="publication">
                                        <%
                                            ArrayList<Publication> publications = (ArrayList<Publication>) request.getAttribute("publications");

                                            if (publications != null) {
                                                for (Publication publication : publications) {
                                        %>
                                        <option value="<%=publication.getId()%>"><%=publication.getName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                    <div class="form-group">
                                        <label>PICTURE URL: </label>
                                        <input type="text" name="url" class="form-control">
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
                <th scope="col">TITLE</th>
                <th scope="col">LANGUAGE</th>
                <th scope="col">ADDED DATE</th>
                <th scope="col">PUBLICATION</th>
                <th scope="col">DETAILS</th>
                <th scope="col">OPERATIONS</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<News> news = (ArrayList<News>)request.getAttribute("news");
                if (news != null) {
                    for (News news1 : news) {
            %>
            <tr>
                <th scope="row"><%=news1.getId()%></th>
                <td><%=news1.getTitle()%></td>
                <td><%=news1.getLanguage().getCode()%></td>
                <td><%=news1.getDate()%></td>
                <td><%=news1.getPublication().getName()%></td>
                <td><a href="/admin/news/details?id=<%=news1.getId()%>" class="btn btn-info btn-sm ml-3" style="font-weight: bold;">DETAILS</a></td>
                <td class="d-flex justify-content-end">

                    <button type="button" class="btn btn-primary" style="font-weight: bold;" data-toggle="modal" data-target="#edit<%=news1.getId()%>">
                        EDIT
                    </button>

                    <div class="modal fade" id="edit<%=news1.getId()%>" tabindex="-1" aria-labelledby="edit<%=news1.getId()%>Label" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/editNews" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id = "edit<%=news1.getId()%>Label">Edit publication</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>TITLE: </label>
                                            <input type="text" name="title" value="<%=news1.getTitle()%>" class="form-control">
                                            <input type="hidden" name="id" value="<%=news1.getId()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>SHORT CONTENT: </label>
                                            <textarea name="short_content" value="<%=news1.getShort_content()%>" class="form-control"><%=news1.getShort_content()%></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>CONTENT: </label>
                                            <textarea name="content" value="<%=news1.getContent()%>" class="form-control"><%=news1.getContent()%></textarea>
                                        </div>
<%--                                        <select class="form-control form-control-lg" name="language">--%>
<%--                                            <%--%>
<%--                                                if (languages != null) {--%>
<%--                                                    for (Language language : languages) {--%>
<%--                                            %>--%>
<%--                                            <option value="<%=language.getId()%>"><%=language.getCode()%></option>--%>
<%--                                            <%--%>
<%--                                                    }--%>
<%--                                                }--%>
<%--                                            %>--%>
<%--                                        </select>--%>
                                        <select class="form-control form-control-lg" name="publication">
                                            <%
                                                if (publications != null) {
                                                    for (Publication publication : publications) {
                                            %>
                                            <option value="<%=publication.getId()%>"><%=publication.getName()%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                        <div class="form-group">
                                            <label>PICTURE URL: </label>
                                            <input type="text" name="url" value="<%=news1.getUrl()%>" class="form-control">
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
                    <form action="/deleteNews" method="post">
                        <input type="hidden" name="id" value="<%=news1.getId()%>">
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

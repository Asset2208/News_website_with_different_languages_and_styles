<%@ page import="db.News" %>
<%@ page import="db.Publication" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <%@include file="vendor/head.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<%
    News news = (News) request.getAttribute("news");
    Publication publicationn = (Publication) request.getAttribute("publication");
%>
<body>
    <div class="container">
        <%@include file="vendor/navbar_admin.jsp"%>
            <div class="row mt-5">
                <div class="col-sm-12 mb-5">
                    <h4><%=news.getTitle()%></h4>
                    <p class="text-muted">At <%=news.getDate()%> by <a href="/home?publication_id=<%=publicationn.getId()%>" class="text-info"><%=publicationn.getName()%></a></p>
                    <hr class="my-4">
                    <img src="<%=news.getUrl()%>" class="card-img-top" style="width: 538px; height: 358px;" alt="...">
                    <hr class="my-4">
                    <p><strong><%=news.getShort_content()%></strong></p>
                    <p><%=news.getContent()%></p>
                </div>
                <div class="jumbotron jumbotron-fluid" style="font-style: italic;">
                    <div class="container">
                        <h3 style="font-style: italic;">About <%=publicationn.getName()%></h3>
                        <p class="lead"><%=publicationn.getDescription()%></p>
                        <h5> Rating: <%=publicationn.getRating()%></h5>
                    </div>
                </div>
            </div>
    </div>
</body>
</html>

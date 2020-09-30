<%@ page import="db.News" %>
<%@ page import="db.Publication" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<%
    News news = (News) request.getAttribute("news");
    Publication publicationn = (Publication) request.getAttribute("publication");
    Style style11 = (Style)request.getAttribute("style");
    if (style11 == null) {
        style11 = new Style(null, "default", "darkred", "darkblue", "#14A958", "#298B8E", "#19CDE2", "black","white", "", "#19CDE2", "", "", true);
    }
%>
<body style="background-color: <%=style11.getBody_bg()%>;">


    <div class="container">

        <%@include file="vendor/navbar.jsp"%>


        <div class="row">
            <div class="col-8" style="color: <%=style11.getText_color()%>">
                <h4><%=news.getTitle()%></h4>
                <p class="text-muted">At <%=news.getDate()%> by <a href="/home?publication_id=<%=publicationn.getId()%>" style="font-weight: bold; color: <%=style11.getLink_color()%> !important;" class="text-info"><%=publicationn.getName()%></a></p>
                <hr class="my-4">
                <img src="<%=news.getUrl()%>" class="card-img-top" style="width: 538px; height: 358px;" alt="...">
                <hr class="my-4">
                <p><strong><%=news.getShort_content()%></strong></p>
                <p><%=news.getContent()%></p>
            </div>
            <div class="col-4">
                <div class="jumbotron jumbotron-fluid" style="background-color: <%=style1.getJumbo_bg()%>; font-style: italic; border: 1px <%=style1.getBorder_jumbo()%>; border-style:solid;">
                    <div class="container" style="color: <%=style11.getJumbo_color()%>">
                        <h3 style="font-style: italic;">About <%=publicationn.getName()%></h3>
                        <p class="lead"><%=publicationn.getDescription()%></p>
                        <h5> Rating: <%=publicationn.getRating()%></h5>
                    </div>
                </div>
                <div>
                    <h4>Archives</h4>
                    <ul>
                        <li><a href="#">September 2020</a></li>
                        <li><a href="#">September 2020</a></li>
                        <li><a href="#">September 2020</a></li>
                        <li><a href="#">September 2020</a></li>
                        <li><a href="#">September 2020</a></li>
                        <li><a href="#">September 2020</a></li>
                        <li><a href="#">September 2020</a></li>
                        <li><a href="#">September 2020</a></li>
                        <li><a href="#">September 2020</a></li>
                    </ul>
                </div>
                <div>
                    <h4>Follow us</h4>
                    <ul>
                        <li><a href="#">Instagram</a></li>
                        <li><a href="#">Twitter</a></li>
                        <li><a href="#">Facebook</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p class="text-center">Copyright(C). All rights reserved</p>
    </footer>
</body>
</html>

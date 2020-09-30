<%@ page import="java.util.ArrayList" %>
<%@ page import="db.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Home Page</title>
    <%@include file="vendor/head.jsp"%>
    <style>
        .asdasd p { /* Запрещаем перенос строк */
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;

             /* Добавляем многоточие */
        }
    </style>
</head>
<%
    Style style11 = (Style)request.getAttribute("style");
    if (style11 == null) {
        style11 = new Style(null, "default", "darkred", "darkblue", "#14A958", "#298B8E", "#19CDE2", "black","white", "", "#19CDE2", "", "", true);
    }
%>

<body style="background-color: <%=style11.getBody_bg()%>;">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <div class="container">
        <%@include file="vendor/navbar.jsp"%>
        <div class="jumbotron jumbotron-fluid" style="background-color: <%=style1.getJumbo_bg()%>; font-style: italic; border: 1px <%=style1.getBorder_jumbo()%>; border-style:solid;">
            <%
                String code = (String) request.getAttribute("code");
                if (code.equals("none") || code.equals("ENG")){
            %>
            <div class="container" style="color: <%=style11.getJumbo_color()%>">
                <h1 class="display-4">All world news</h1>
                <p class="lead">You can read all news in different languages around world</p>
            </div>
            <%
                }
                else {
            %>
                <div class="container" style="color: <%=style11.getJumbo_color()%>">
                    <h1 class="display-4">Новости всего мира</h1>
                    <p class="lead">Вы можете читать новости всего мира на разных языках</p>
                </div>
            <%
                }
            %>
        </div>

        <div class="row row-cols-1 row-cols-md-2">
            <%
                ArrayList<News> allnews = (ArrayList<News>)request.getAttribute("news");
                if (allnews != null) {
                    for (News news : allnews){
            %>
            <div class="col mb-4">
                <%
                    String bg = "white";
                    String border = "";
                    if (!style11.isImage_normal() && style11.getName().equals("Monochromic")){
                        bg = "#282C2A";
                        border = "white";
                    }
                %>
                <div class="card" style="min-height: 642px; max-height: 642px; background-color: <%=bg%>; border: <%=border%>; border-style:solid;">
                    <div style="background-color: black;">
                    <img src="<%=news.getUrl()%>" class="card-img-top" style="width: 538px; height: 358px; <%
                    if (!style11.isImage_normal()){
                       %>
                            opacity: 0.5;
                    <%
                        }
                    %>
                    " alt="...">
                    </div>
                    <div class="card-body" style="color: <%=style11.getText_color()%>">
                        <a href="/?publication_id=<%=news.getPublication().getId()%>" style="color: <%=style11.getLink_color()%>;" class="card-link"><%=news.getPublication().getName()%></a>
                        <h5 class="card-title"><%=news.getTitle()%></h5>
                        <h6 class="card-subtitle mb-2 text-muted"><%=news.getDate()%></h6>
                        <div class="asdasd">
                            <p><%=news.getShort_content()%></p>
                        </div>
                        <a href="/news?id=<%=news.getId()%>" style="color: <%=style11.getLink_color()%>;" class="card-link">Read more</a>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>

    <footer>
        <p class="text-center">Copyright(C). All rights reserved</p>
    </footer>

</body>
</html>

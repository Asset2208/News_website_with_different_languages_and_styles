<%@ page import="db.Language" %>
<%@ page import="db.Publication" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Style" %>
<%
    Style style1 = (Style)request.getAttribute("style");
    if (style1 == null) {
        style1 = new Style(null, "default", "darkred", "white", "", "#298B8E", "#19CDE2", "black","white", "#298B8E", "#19CDE2", "", "", true);
    }
%>
<nav class="navbar navbar-expand-lg navbar-light" style=" background-color: <%=style1.getBg_navbar_1()%>;">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <div class="container d-flex justify-content-between">
            <ul class="navbar-nav">
                <%
                    String lang = (String) request.getAttribute("code");
                    String class_lang = "";
                    String class_active = "btn btn-secondary active";
                    String class_non = "btn";
                %>

                <%
                    ArrayList<Language> languages = (ArrayList<Language>) request.getAttribute("languages");
                    if (languages != null){
                        for (Language language : languages){
                            if (lang.equals(language.getCode())){
                                class_lang = class_active;
                            }
                            else {
                                class_lang = class_non;
                            }
                %>

                    <li class="nav-item">
                        <form action="/setcookie?name=<%=language.getCode()%>" method="post">
                            <button class="<%=class_lang%>" style="color: <%=style1.getNavbar_main()%>;"><%=language.getCode()%></button>
                        </form>
                    </li>
                <%

                        }
                    }
                %>



            </ul>
            <span>
                <a class="navbar-brand" href="/"><h3 style="color: <%=style1.getNavbar_main()%>;">WORLD NEWS PORTAL</h3></a>
            </span>

            <div>
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%
                        Style style = (Style)request.getAttribute("style");
                        if (style != null) {
                    %>
                    <%=style.getName()%>
                    <%
                    }
                    else {
                    %>
                    Default

                    <%
                        }
                    %>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/setStyleCookie?id=<%=7L%>">Default</a>
                    <a class="dropdown-item" href="/setStyleCookie?id=<%=1L%>">Light</a>
                    <a class="dropdown-item" href="/setStyleCookie?id=<%=2L%>">Dark</a>
                    <a class="dropdown-item" href="/setStyleCookie?id=<%=3L%>">Monochrome</a>
                    <a class="dropdown-item" href="/setStyleCookie?id=<%=4L%>">Monochrome inverse</a>
                    <a class="dropdown-item" href="/setStyleCookie?id=<%=5L%>">Facebook</a>
                    <a class="dropdown-item" href="/setStyleCookie?fontname=large">Large</a>
                    <a class="dropdown-item" href="/setStyleCookie?fontname=small">Small</a>
                    <a class="dropdown-item" href="/setStyleCookie?id=<%=6L%>">Instagram</a>
                </div>
            </div>

            <a href="/admin" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Admin</a>
        </div>

    </div>
</nav>
<%
    Integer font_small = (Integer) request.getAttribute("Small");
    Integer font_large = (Integer) request.getAttribute("Large");
    String font = "";
    if (font_small != null){
        font = font_small.toString();
    }
    else if (font_large != null) {
        font = font_large.toString();
    }
%>
<nav class="navbar navbar-expand-lg navbar-dark mb-3" style="font-size: <%=font%>; background-color: <%=style1.getBg_navbar_2()%>; border: 1px <%=style1.getBorder()%>; border-style:solid;">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupported" aria-controls="navbarSupported" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <%
                ArrayList<Publication> publications = (ArrayList<Publication>) request.getAttribute("publications");
                if (publications != null) {
                    for (Publication publication : publications){
            %>
            <li class="nav-item active">
                <a class="nav-link" style="color: <%=style1.getNavbar()%>; font-weight: bold;" href="/home?publication_id=<%=publication.getId()%>"><%=publication.getName()%><span class="sr-only">(current)</span></a>
            </li>
            <%
                    }
                }
            %>



        </ul>

    </div>
</nav>

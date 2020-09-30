package servlets;

import db.DBManager;
import db.News;
import db.Publication;
import db.Style;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/news")
public class NewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Long news_id = Long.parseLong(request.getParameter("id"));
        News news = DBManager.getNews(news_id);
        Publication publication = DBManager.getPublication(news.getPublication().getId());
        ArrayList<Publication> publications = DBManager.getAllPublications();
        Cookie cookies[] = request.getCookies();
        String code = "";
        String style = "";
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("lang")){
                    code = c.getValue();
                }
                if (c.getName().equals("style")){
                    style = c.getValue();
                }
            }
        }
        if (code.equals("")){
            request.setAttribute("code", "none");
        }
        else {
            request.setAttribute("code", code);
        }
        Style style1 = DBManager.getStyleByName(style);
        if (style1 != null){
            request.setAttribute("style", style1);
        }
        else {
            request.setAttribute("style", null);
        }

        request.setAttribute("publication", publication);
        request.setAttribute("news", news);
        request.setAttribute("publications", publications);
        request.getRequestDispatcher("/news_inside.jsp").forward(request, response);
    }
}

package servlets;

import db.DBManager;
import db.Language;
import db.News;
import db.Publication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

@WebServlet(value = "/editNews")
public class EditNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long now = System.currentTimeMillis();
        Timestamp sqlTimestamp = new Timestamp(now);

        request.setCharacterEncoding("UTF-8");
        Long id = Long.parseLong(request.getParameter("id"));
        String title = request.getParameter("title");
        String short_content = request.getParameter("short_content");
        String content = request.getParameter("content");
//        Long language_id = Long.parseLong(request.getParameter("language"));
        Long publication_id = Long.parseLong(request.getParameter("publication"));
        String url = request.getParameter("url");
//        Language language = DBManager.getLanguage(language_id);
        Publication publication = DBManager.getPublication(publication_id);
        News news = new News(null, title, short_content, content, sqlTimestamp, url, null, publication);
        DBManager.updateNews(news, id);

        response.sendRedirect("/admin/news?success");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

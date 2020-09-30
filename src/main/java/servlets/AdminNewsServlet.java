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
import java.util.ArrayList;

@WebServlet(value = "/admin/news")
public class AdminNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Publication> publications = DBManager.getAllPublications();
        ArrayList<Language> languages = DBManager.getAllLanguages();
        ArrayList<News> news = DBManager.getAllNews();

        request.setAttribute("news", news);
        request.setAttribute("publications", publications);
        request.setAttribute("languages", languages);
        request.getRequestDispatcher("/admin_news.jsp").forward(request, response);
    }
}

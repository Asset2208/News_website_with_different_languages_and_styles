package servlets;

import db.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Long publication_id = null;
        String publication_name = request.getParameter("publication_id");
        if (publication_name != null){
            publication_id = Long.parseLong(publication_name);
        }
        Cookie cookies[] = request.getCookies();
        String code = "";
        String style = "";
        String font = "";
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("lang")){
                    code = c.getValue();
                }
                if (c.getName().equals("style")){
                    style = c.getValue();
                }
                if (c.getName().equals("small") || c.getName().equals("large")){
                    font = c.getValue();
                }
            }
        }
        ArrayList<Publication> publications = DBManager.getAllPublications();
        ArrayList<Language> languages = DBManager.getAllLanguages();
        Style style1 = DBManager.getStyleByName(style);
        if (style1 != null){
            request.setAttribute("style", style1);
        }
        else {
            request.setAttribute("style", null);
        }

        if (!font.equals("")){
            if (font.equals("small")){
                request.setAttribute("Small", 5);
            }
            else {
                request.setAttribute("Large", 60);
            }
        }


        if (publication_id == null) {
            if (code.equals("")){
                ArrayList<News> news = DBManager.getAllNews();

                request.setAttribute("languages", languages);
                request.setAttribute("code", "none");
                request.setAttribute("news", news);
                request.setAttribute("publications", publications);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
            else {
                Language language = DBManager.getLanguageByCode(code);
                ArrayList<News> news = DBManager.getAllNewsByLanguageId(language.getId());
                request.setAttribute("languages", languages);
                request.setAttribute("code", code);
                request.setAttribute("publications", publications);
                request.setAttribute("news", news);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
        else {
            if (code.equals("")){
                ArrayList<News> news = DBManager.getAllNewsByPublicationId(publication_id);
                request.setAttribute("languages", languages);
                request.setAttribute("code", code);
                request.setAttribute("news", news);
                request.setAttribute("publications", publications);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
            else {
                Language language = DBManager.getLanguageByCode(code);
                ArrayList<News> news = DBManager.getAllNewsByPublicationLanguageId(publication_id, language.getId());
                request.setAttribute("languages", languages);
                request.setAttribute("code", code);
                request.setAttribute("publications", publications);
                request.setAttribute("news", news);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }

    }
}

package servlets;

import db.DBManager;
import db.Style;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/setStyleCookie")
public class SetStyleCookieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("fontname");
        if (name != null){
            Cookie cookie = new Cookie("large", name);
            cookie.setMaxAge(3600*24*30);
            response.addCookie(cookie);
        }
        else {
            Cookie cookies[] = request.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (c.getName().equals("small") || c.getName().equals("large")){
                        Cookie cookie = new Cookie("large", name);
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                        break;
                    }
                }
            }
            Long id = Long.parseLong(request.getParameter("id"));
            Style style = DBManager.getStyle(id);
            Cookie cookie = new Cookie("style", style.getName());
            cookie.setMaxAge(3600*24*30);
            response.addCookie(cookie);
        }
        response.sendRedirect("/");
    }
}

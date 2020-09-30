package db;

import javax.enterprise.inject.New;
import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    private static ArrayList<Style> styles = new ArrayList<>();
    static {
        styles.add(new Style(1L, "Light", "darkred", "#C1C8D0", "", "#FFFFFF", "#FFFFFF", "black", "", "#FFFFFF", "darkred", "", "", true));
        styles.add(new Style(2L, "Dark", "#FFFFFF", "#FFFFFF", "#5278A6", "#5278A6","#FFFFFF","#5278A6", "#5278A6", "#FFFFFF", "#FFFFFF", "", "", true));
        styles.add(new Style(3L,"Monochromic", "#FFFFFF", "#FFFFFF", "#282C2A", "#282C2A", "#282C2A", "white","#282C2A", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", false));
        styles.add(new Style(4L,"Inverse", "#282C2A", "#282C2A", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#282C2A","#FFFFFF", "#282C2A", "#282C2A", "#282C2A", "#282C2A", false));
        styles.add(new Style(5L,"Facebook", "#FFFFFF", "#FFFFFF", "#0F56AC", "#0F56AC", "#DAE7F7", "#0F56AC","#FFFFFF", "#FFFFFF", "#DAE7F7", "#0F56AC", "", true));
        styles.add(new Style(6L,"Instagram", "#FFFFFF", "#FFFFFF", "#E415C5", "#E415C5", "#FCE3F8", "#E415C5","#FFFFFF", "#FFFFFF", "#E415C5", "#E415C5", "", true));
        styles.add(new Style(7L, "default", "darkred", "white", "", "#298B8E", "#19CDE2", "black","white", "#298B8E", "#19CDE2", "", "", true));
    }

    public static Style getStyle(Long idx) {
        for (Style style : styles) {
            if (style.getId().equals(idx)){
                return style;
            }
        }
        return null;
    }

    public static Style getStyleByName(String name) {
        for (Style style : styles) {
            if (style.getName().equals(name)){
                return style;
            }
        }
        return null;
    }

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/news_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", "root", "");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void addLanguage(Language language) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO languages (id, name, code) " +
                    "VALUES (NULL, ?, ?)");
            ps.setString(1, language.getName());
            ps.setString(2, language.getCode());

            ps.executeUpdate();
            ps.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void addPublication(Publication publication) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO publications (id, name, description, rating) " +
                    "VALUES (NULL, ?, ?, ?)");
            ps.setString(1, publication.getName());
            ps.setString(2, publication.getDescription());
            ps.setDouble(3, publication.getRating());

            ps.executeUpdate();
            ps.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void addNews(News news) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO news (id, title, short_content, content, post_date, picture_url, language_id, publication_id) " +
                    "VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getShort_content());
            ps.setString(3, news.getContent());
            ps.setTimestamp(4, news.getDate());
            ps.setString(5, news.getUrl());
            ps.setLong(6, news.getLanguage().getId());
            ps.setLong(7, news.getPublication().getId());

            ps.executeUpdate();
            ps.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Language> getAllLanguages() {
        ArrayList<Language> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * from languages");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String name = rs.getString("name");
                String code = rs.getString("code");

                list.add(new Language(id, name, code));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static ArrayList<News> getAllNews() {
        ArrayList<News> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * from news");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String title = rs.getString("title");
                String short_content = rs.getString("short_content");
                String content = rs.getString("content");
                Timestamp date = rs.getTimestamp("post_date");
                String url = rs.getString("picture_url");
                Long language_id = rs.getLong("language_id");
                Long publication_id = rs.getLong("publication_id");

                Language language = getLanguage(language_id);
                Publication publication = getPublication(publication_id);

                list.add(new News(id, title, short_content, content, date, url, language, publication));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static ArrayList<News> getAllNewsByLanguageId(Long idx) {
        ArrayList<News> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * from news WHERE language_id = ?");
            ps.setLong(1, idx);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String title = rs.getString("title");
                String short_content = rs.getString("short_content");
                String content = rs.getString("content");
                Timestamp date = rs.getTimestamp("post_date");
                String url = rs.getString("picture_url");
                Long language_id = rs.getLong("language_id");
                Long publication_id = rs.getLong("publication_id");

                Language language = getLanguage(language_id);
                Publication publication = getPublication(publication_id);

                list.add(new News(id, title, short_content, content, date, url, language, publication));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static ArrayList<News> getAllNewsByPublicationId(Long idx) {
        ArrayList<News> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * from news WHERE publication_id = ?");
            ps.setLong(1, idx);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String title = rs.getString("title");
                String short_content = rs.getString("short_content");
                String content = rs.getString("content");
                Timestamp date = rs.getTimestamp("post_date");
                String url = rs.getString("picture_url");
                Long language_id = rs.getLong("language_id");
                Long publication_id = rs.getLong("publication_id");

                Language language = getLanguage(language_id);
                Publication publication = getPublication(publication_id);

                list.add(new News(id, title, short_content, content, date, url, language, publication));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


    public static ArrayList<News> getAllNewsByPublicationLanguageId(Long publ_id, Long lang_id) {
        ArrayList<News> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * from news WHERE publication_id = ? AND language_id = ?");
            ps.setLong(1, publ_id);
            ps.setLong(2, lang_id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String title = rs.getString("title");
                String short_content = rs.getString("short_content");
                String content = rs.getString("content");
                Timestamp date = rs.getTimestamp("post_date");
                String url = rs.getString("picture_url");
                Long language_id = rs.getLong("language_id");
                Long publication_id = rs.getLong("publication_id");

                Language language = getLanguage(language_id);
                Publication publication = getPublication(publication_id);

                list.add(new News(id, title, short_content, content, date, url, language, publication));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static Language getLanguage(Long idx){
        Language language = new Language();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM languages WHERE id =?");
            ps.setLong(1, idx);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String name = rs.getString("name");
                String code = rs.getString("code");

                language = (new Language(id, name, code));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return language;
    }



    public static News getNews(Long idx){
        News news = new News();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM news WHERE id =?");
            ps.setLong(1, idx);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String title = rs.getString("title");
                String short_content = rs.getString("short_content");
                String content = rs.getString("content");
                Timestamp date = rs.getTimestamp("post_date");
                String url = rs.getString("picture_url");
                Long language_id = rs.getLong("language_id");
                Long publication_id = rs.getLong("publication_id");

                Language language = getLanguage(language_id);
                Publication publication = getPublication(publication_id);

                news = new News(id, title, short_content, content, date, url, language, publication);
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    }

    public static Language getLanguageByCode(String code1){
        Language language = new Language();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM languages WHERE code =?");
            ps.setString(1, code1);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String name = rs.getString("name");
                String code = rs.getString("code");

                language = (new Language(id, name, code));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return language;
    }

    public static Publication getPublication(Long idx){
        Publication publication = new Publication();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM publications WHERE id =?");
            ps.setLong(1, idx);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double rating = rs.getDouble("rating");

                publication = (new Publication(id, name, description, rating));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publication;
    }

    public static ArrayList<Publication> getAllPublications() {
        ArrayList<Publication> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * from publications");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Long id = rs.getLong("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                Double rating = rs.getDouble("rating");

                list.add(new Publication(id, name, description, rating));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void deleteLanguage(Long idx){
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM languages WHERE id=?");
            ps.setLong(1, idx);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deletePublication(Long idx){
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM publications WHERE id=?");
            ps.setLong(1, idx);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateLanguage(String name, String code, Long idx) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE languages SET name = ?, code = ? WHERE id = ?");
            ps.setString(1, name);
            ps.setString(2, code);
            ps.setLong(3, idx);

            ps.executeUpdate();
            ps.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updatePublication(String name, String description, double rating, Long idx) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE publications SET name = ?, description = ?, rating = ? WHERE id = ?");
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setDouble(3, rating);
            ps.setLong(4, idx);

            ps.executeUpdate();
            ps.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateNews(News news, Long idx) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE news SET title = ?, short_content = ?, content = ?, post_date = ?, picture_url = ?, publication_id = ? WHERE id = ?");
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getShort_content());
            ps.setString(3, news.getContent());
            ps.setTimestamp(4, news.getDate());
            ps.setString(5, news.getUrl());
            ps.setLong(6, news.getPublication().getId());
            ps.setLong(7, idx);

            ps.executeUpdate();
            ps.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

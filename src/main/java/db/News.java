package db;

import java.sql.Timestamp;

public class News {
    private Long id;
    private String title;
    private String short_content;
    private String content;
    private Timestamp date;
    private String url;
    private Language language;
    private Publication publication;

    public News() {}

    public News(Long id, String title, String short_content, String content, Timestamp date, String url, Language language, Publication publication) {
        this.id = id;
        this.title = title;
        this.short_content = short_content;
        this.content = content;
        this.date = date;
        this.url = url;
        this.language = language;
        this.publication = publication;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShort_content() {
        return short_content;
    }

    public void setShort_content(String short_content) {
        this.short_content = short_content;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public Publication getPublication() {
        return publication;
    }

    public void setPublication(Publication publication) {
        this.publication = publication;
    }
}

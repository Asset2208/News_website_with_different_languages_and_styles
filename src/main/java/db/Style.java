package db;

public class Style {
    private Long id;
    private String name;
    private String navbar_main;
    private String navbar;
    private String bg_navbar_1;
    private String bg_navbar_2;
    private String jumbo_bg;
    private String jumbo_color;
    private String body_bg;
    private String border;
    private String border_jumbo;
    private String link_color;
    private String text_color;
    private boolean image_normal;

    public Style() {}

    public Style(Long id, String name, String navbar_main, String navbar, String bg_navbar_1, String bg_navbar_2, String jumbo_bg, String jumbo_color,String body_bg, String border, String border_jumbo, String link_color, String text_color, boolean image_normal) {
        this.id = id;
        this.name = name;
        this.navbar_main = navbar_main;
        this.navbar = navbar;
        this.bg_navbar_1 = bg_navbar_1;
        this.bg_navbar_2 = bg_navbar_2;
        this.border = border;
        this.link_color = link_color;
        this.text_color = text_color;
        this.image_normal = image_normal;
        this.border_jumbo = border_jumbo;
        this.body_bg = body_bg;
        this.jumbo_bg = jumbo_bg;
        this.jumbo_color = jumbo_color;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNavbar_main() {
        return navbar_main;
    }

    public void setNavbar_main(String navbar_main) {
        this.navbar_main = navbar_main;
    }

    public String getNavbar() {
        return navbar;
    }

    public void setNavbar(String navbar) {
        this.navbar = navbar;
    }

    public String getBg_navbar_1() {
        return bg_navbar_1;
    }

    public void setBg_navbar_1(String bg_navbar_1) {
        this.bg_navbar_1 = bg_navbar_1;
    }

    public String getBg_navbar_2() {
        return bg_navbar_2;
    }

    public void setBg_navbar_2(String bg_navbar_2) {
        this.bg_navbar_2 = bg_navbar_2;
    }

    public String getBorder() {
        return border;
    }

    public void setBorder(String border) {
        this.border = border;
    }

    public String getLink_color() {
        return link_color;
    }

    public void setLink_color(String link_color) {
        this.link_color = link_color;
    }

    public String getText_color() {
        return text_color;
    }

    public void setText_color(String text_color) {
        this.text_color = text_color;
    }

    public boolean isImage_normal() {
        return image_normal;
    }

    public void setImage_normal(boolean image_normal) {
        this.image_normal = image_normal;
    }

    public String getBorder_jumbo() {
        return border_jumbo;
    }

    public void setBorder_jumbo(String border_jumbo) {
        this.border_jumbo = border_jumbo;
    }

    public String getBody_bg() {
        return body_bg;
    }

    public void setBody_bg(String body_bg) {
        this.body_bg = body_bg;
    }

    public String getJumbo_bg() {
        return jumbo_bg;
    }

    public void setJumbo_bg(String jumbo_bg) {
        this.jumbo_bg = jumbo_bg;
    }

    public String getJumbo_color() {
        return jumbo_color;
    }

    public void setJumbo_color(String jumbo_color) {
        this.jumbo_color = jumbo_color;
    }
}

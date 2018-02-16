package ravermeister.javaRushTestTask.crud.model;

public class BooksFilter {
    private String title;
    private String author;
    private Integer printYearStart, printYearEnd;
    private boolean readAlready;
    private int page, booksPerPage;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getPrintYearStart() {
        return printYearStart;
    }

    public void setPrintYearStart(Integer printYearStart) {
        this.printYearStart = printYearStart;
    }

    public Integer getPrintYearEnd() {
        return printYearEnd;
    }

    public void setPrintYearEnd(Integer printYearEnd) {
        this.printYearEnd = printYearEnd;
    }

    public boolean isReadAlready() {
        return readAlready;
    }

    public void setReadAlready(boolean readAlready) {
        this.readAlready = readAlready;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getBooksPerPage() {
        return booksPerPage;
    }

    public void setBooksPerPage(int booksPerPage) {
        this.booksPerPage = booksPerPage;
    }
}

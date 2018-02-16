package ravermeister.javaRushTestTask.crud.dao;

import ravermeister.javaRushTestTask.crud.model.Book;
import ravermeister.javaRushTestTask.crud.model.BooksFilter;

import java.util.List;

public interface BookDao {
    void addBook(Book book);
    void updateBook(Book book);
    void removeBook(int id);
    Book getBookById(int id);
    List<Book> listBooks(BooksFilter filter);
    int booksCount(BooksFilter filter);
}

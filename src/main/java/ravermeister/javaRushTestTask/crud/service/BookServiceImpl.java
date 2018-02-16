package ravermeister.javaRushTestTask.crud.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ravermeister.javaRushTestTask.crud.model.Book;
import ravermeister.javaRushTestTask.crud.model.BooksFilter;
import ravermeister.javaRushTestTask.crud.dao.BookDao;

import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService {
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Override
    public void updateBook(Book book) {
        if (book.isReadAlready())
            book.setReadAlready(false);
        bookDao.updateBook(book);
    }

    @Override
    public void readBook(int id) {
        Book book = bookDao.getBookById(id);
        book.setReadAlready(true);
        bookDao.updateBook(book);
    }

    @Override
    public void removeBook(int id) {
        bookDao.removeBook(id);
    }

    @Override
    public Book getBookById(int id) {
        return bookDao.getBookById(id);
    }

    @Override
    public List<Book> listBooks(BooksFilter filter) {
        return bookDao.listBooks(filter);
    }

    @Override
    public int booksCount(BooksFilter filter) {
        return bookDao.booksCount(filter);
    }
}

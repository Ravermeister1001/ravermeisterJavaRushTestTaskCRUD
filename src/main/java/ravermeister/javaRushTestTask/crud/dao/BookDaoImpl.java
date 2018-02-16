package ravermeister.javaRushTestTask.crud.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ravermeister.javaRushTestTask.crud.model.Book;
import ravermeister.javaRushTestTask.crud.model.BooksFilter;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;
import java.util.List;


@Transactional
@Repository
public class BookDaoImpl implements BookDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.update(book);
    }

    @Override
    public void removeBook(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = session.load(Book.class, id);
        if (book != null)
            session.delete(book);
    }

    @Override
    public Book getBookById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = session.load(Book.class, id);
        return book;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks(BooksFilter filter) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Book> cQuery = builder.createQuery(Book.class);
        Root<Book> root = cQuery.from(Book.class);

        cQuery.select(root).where(getExpression(filter, builder, root));
        int length = filter.getBooksPerPage();
        int start = (filter.getPage() - 1) * length;
        List<Book> booksList = session.createQuery(cQuery).setFirstResult(start).setMaxResults(length).getResultList();
        return booksList;
    }

    @Override
    public int booksCount(BooksFilter filter) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder  builder = session.getCriteriaBuilder();
        CriteriaQuery<Long> cQuery = builder.createQuery(Long.class);
        Root<Book> root = cQuery.from(Book.class);
        cQuery.select(builder.count(root)).where(getExpression(filter, builder, root));
        return (session.createQuery(cQuery).getSingleResult()).intValue();
    }

    private Expression<Boolean> getExpression(BooksFilter filter, CriteriaBuilder builder, Root<Book> root) {
        Expression<Boolean> expression = builder.ge(root.get("id"), 0);

        if (filter.getBooksPerPage() < 1)
            filter.setBooksPerPage(10);

        if (filter.getPage() < 1)
            filter.setPage(1);

        if (filter.getTitle() != null && !filter.getTitle().trim().equals(""))
            expression = builder.and(expression, builder.like(root.get("title"), "%" + filter.getTitle() + "%"));

        if (filter.getAuthor() != null && !filter.getAuthor().trim().equals(""))
            expression = builder.and(expression, builder.like(root.get("author"), "%" + filter.getAuthor() + "%"));

        if (filter.getPrintYearStart() != null && filter.getPrintYearStart() >= 0)
            expression = builder.and(expression, builder.ge(root.get("printYear"), filter.getPrintYearStart()));

        if (filter.getPrintYearEnd() != null)
            expression = builder.and(expression, builder.le(root.get("printYear"), filter.getPrintYearEnd()));

        if (filter.isReadAlready())
            expression = builder.and(expression, builder.equal(root.get("readAlready"), filter.isReadAlready()));

        return expression;
    }
}

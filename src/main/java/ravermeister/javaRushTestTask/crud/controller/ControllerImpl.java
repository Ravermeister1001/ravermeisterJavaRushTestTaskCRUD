package ravermeister.javaRushTestTask.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ravermeister.javaRushTestTask.crud.model.Book;
import ravermeister.javaRushTestTask.crud.model.BooksFilter;
import ravermeister.javaRushTestTask.crud.service.BookService;


@SessionAttributes("filter")
@Controller
public class ControllerImpl {
    private BookService bookService;

    @Autowired
    @Qualifier("bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @ModelAttribute("filter")
    public BooksFilter getBooksFilter() {
        return new BooksFilter();
    }


    @RequestMapping("books")
    public String listBooks(Model model, @ModelAttribute(value = "filter") BooksFilter filter) {
        model.addAttribute("filter", filter);
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", bookService.listBooks(filter));
        model.addAttribute("pagesCount", (int) Math.ceil(bookService.booksCount(filter) * 1.0 / filter.getBooksPerPage()));
        return "books";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        if (book.getId() == 0)
            bookService.addBook(book);
        else
            bookService.updateBook(book);
        return "redirect:/books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        bookService.removeBook(id);
        return "redirect:/books";
    }

    @RequestMapping("/read/{id}")
    public String readBook(@PathVariable("id") int id) {
        bookService.readBook(id);
        return "redirect:/books";
    }

    @RequestMapping("/edit/{id}")
    public String editBook(Model model, @ModelAttribute(value = "filter") BooksFilter filter, @PathVariable("id") int id) {
        model.addAttribute("filter", filter);
        model.addAttribute("book", bookService.getBookById(id));
        model.addAttribute("listBooks", bookService.listBooks(filter));
        model.addAttribute("pagesCount", (int) Math.ceil(bookService.booksCount(filter) * 1.0 / filter.getBooksPerPage()));
        return "books";
    }
}

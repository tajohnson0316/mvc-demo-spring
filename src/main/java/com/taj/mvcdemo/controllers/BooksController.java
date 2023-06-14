package com.taj.mvcdemo.controllers;

import com.taj.mvcdemo.models.Book;
import com.taj.mvcdemo.services.BookService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BooksController {
  private final BookService bookService;

  public BooksController(BookService bookService) {
    this.bookService = bookService;
  }

  @GetMapping("/books")
  public String displayAllBooks(Model model) {
    List<Book> allBooks = bookService.allBooks();
    model.addAttribute("allBooks", allBooks);
    return "index.jsp";
  }

  @GetMapping("/books/{id}")
  public String displayBookById(@PathVariable("id") Long id, HttpSession session) {
    session.setAttribute("book", bookService.findBook(id));

    return "show.jsp";
  }

  @GetMapping("/books/new")
  public String displayNewBookForm(@ModelAttribute("book") Book book) {
    return "newBookForm.jsp";
  }

  @PostMapping("/books/new/create")
  public String createNewBook(
    @Valid @ModelAttribute("book") Book book,
    BindingResult result
  ) {
    if (result.hasErrors()) {
      return "newBookForm.jsp";
    }

    Book newBook = bookService.createBook(book);
    return String.format("redirect:/books/%d", newBook.getId());
  }

  @GetMapping("/books/edit/{id}")
  public String displayEditForm(@PathVariable("id") Long id, Model model) {
    Book book = bookService.findBook(id);
    model.addAttribute("book",book);
    return "editBookForm.jsp";
  }

  @PutMapping("/books/update/{id}")
  public String updateBook(
    @Valid @ModelAttribute("book") Book book,
    BindingResult result,
    Model model
  ) {
    if (result.hasErrors()) {
      model.addAttribute("book", book);
      return String.format("redirect:/books/edit/%d", book.getId());
    } else {
      bookService.updateBook(book);
      return String.format("redirect:/books/%d", book.getId());
    }
  }

  @DeleteMapping("/books/delete/{id}")
  public String delete(@PathVariable("id") Long id) {
    bookService.deleteBook(id);
    return "redirect:/books";
  }
}
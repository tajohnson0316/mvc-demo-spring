package com.taj.mvcdemo.services;

import com.taj.mvcdemo.models.Book;
import com.taj.mvcdemo.repositories.BookRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {
  private final BookRepository bookRepository;

  public BookService(BookRepository bookRepository) {
    this.bookRepository = bookRepository;
  }

  public List<Book> allBooks() {
    return bookRepository.findAll();
  }

  public Book createBook(Book book) {
    return bookRepository.save(book);
  }

  public Book updateBook(Book book) {
    Book updatedBook = findBook(book.getId());
    updatedBook.setTitle(book.getTitle());
    updatedBook.setDescription(book.getDescription());
    updatedBook.setLanguage(book.getLanguage());
    updatedBook.setNumOfPages(book.getNumOfPages());

    return bookRepository.save(updatedBook);
  }

  public void deleteBook(Long id) {
    bookRepository.delete(findBook(id));
  }

  public Book findBook(Long id) {
    Optional<Book> optionalBook = bookRepository.findById(id);

    return optionalBook.orElse(null);
  }
}
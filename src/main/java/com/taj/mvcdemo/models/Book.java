package com.taj.mvcdemo.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "books")
public class Book {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotBlank
  @Size(min = 5, max = 200,
    message = "Title must be at least 5 characters in length")
  private String title;

  @NotBlank
  @Size(min = 5, max = 200,
    message = "Description must be at least 5 characters in length")
  private String description;

  @NotBlank
  @Size(min = 3, max = 40,
    message = "Language must be at least 3 characters in length")
  private String language;

  @NotNull(message = "Please provide a value for this field")
  @Min(value = 100, message = "Book must have a minimum of 100 pages")
  private Integer numOfPages;

  @Column(updatable = false)
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createdAt;

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date updatedAt;

  public Book() {
  }

  public Book(String title, String description, String language, Integer numOfPages) {
    this.title = title;
    this.description = description;
    this.language = language;
    this.numOfPages = numOfPages;
  }

  @PrePersist
  protected void onCreate() {
    this.createdAt = new Date();
  }

  @PreUpdate
  protected void onUpdate() {
    this.updatedAt = new Date();
  }

  //  *** GETTERS & SETTERS ***
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

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getLanguage() {
    return language;
  }

  public void setLanguage(String language) {
    this.language = language;
  }

  public Integer getNumOfPages() {
    return numOfPages;
  }

  public void setNumOfPages(Integer numOfPages) {
    this.numOfPages = numOfPages;
  }

  public Date getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
  }

  public Date getUpdatedAt() {
    return updatedAt;
  }

  public void setUpdatedAt(Date updatedAt) {
    this.updatedAt = updatedAt;
  }
}
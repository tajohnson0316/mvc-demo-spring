<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 6/14/2023
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<html>
<head>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  <title>Read Books</title>
</head>
<body>
<div class="container p-3">
  <div class="d-flex justify-content-center">
    <div class="card mb-3" style="width: 100%">
      <div class="card-header text-center fs-3">
        <h1>All Books</h1>
      </div>
      <div class="card-body">
        <table class="table table-bordered">
          <thead>
          <tr>
            <th scope="col">ID #</th>
            <th scope="col">Title</th>
            <th scope="col">Language</th>
            <th scope="col">Total Pages</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="book" items="${allBooks}">
            <tr>
              <th scope="row"><c:out value="${book.id}"/></th>
              <td><a href="/books/${book.id}">${book.title}</a></td>
              <td>${book.language}</td>
              <td>${book.numOfPages}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <div class="d-flex justify-content-end">
    <a href="/books/new">Add New Book</a>
  </div>
</div>
</body>
</html>
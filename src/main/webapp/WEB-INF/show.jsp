<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 6/14/2023
  Time: 3:17 PM
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
  <title>Reading Books</title>
</head>
<body>
  <div class="container p-3">
    <div class="d-flex justify-content-center">
      <div class="card w-100 mb-3">
        <div class="card-header text-center fs-3">
          <c:out value="${book.title}"/>
        </div>
        <div class="card-body">
          <h2>Description: <span><c:out value="${book.description}"/></span></h2>
          <h2>Language: <span><c:out value="${book.language}"/></span></h2>
          <h2>Number of Pages: <span><c:out value="${book.numOfPages}"/></span></h2>
        </div>
      </div>
    </div>
    <div class="d-flex justify-content-end gap-3">
      <a href="/books">Go back</a>
      <span> | </span>
      <a href="/books/edit/${book.id}" class="text-warning">Edit</a>
      <span> | </span>
      <a href="/books/edit/${book.id}">
        <form action="/books/delete/${book.id}" method="post">
          <input type="hidden" name="_method" value="delete">
          <button type="submit" class="btn btn-link text-danger m-0 p-0">Delete</button>
        </form>
      </a>
    </div>
  </div>
</body>
</html>
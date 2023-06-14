<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 6/14/2023
  Time: 4:07 PM
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
<div class="container d-flex justify-content-center p-3">
  <div class="card" style="width: 100%">
    <div class="card-header text-center fs-3">
      New Book Form
    </div>
    <div class="card-body">
      <form:form action="/books/new/create" method="post" modelAttribute="book">
        <div class="mb-3">
          <form:label path="title" class="form-label">Title: </form:label>
          <form:input path="title" class="form-control"/>
          <p class="text-danger">
            <form:errors path="title"/>
          </p>
        </div>
        <div class="mb-3">
          <form:label path="description" class="form-label">Description:</form:label>
          <form:input path="description" class="form-control"/>
          <p class="text-danger">
            <form:errors path="description"/>
          </p>
        </div>
        <div class="mb-3">
          <form:label path="language" class="form-label">Language:</form:label>
          <form:input path="language" class="form-control"/>
          <p class="text-danger">
            <form:errors path="language"/>
          </p>
        </div>
        <div class="mb-3">
          <form:label path="numOfPages" class="form-label">Total Pages:</form:label>
          <form:input path="numOfPages" type="number" min="100" class="form-control"/>
          <p class="text-danger">
            <form:errors path="numOfPages"/>
          </p>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form:form>
    </div>
  </div>
</div>
</body>
</html>
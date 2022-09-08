<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2022
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz</title>
</head>
<body>
<form action="edit-question" method="post">
    <span class="label">Question : </span>
    <input type="text" name="text"/>
    <input type="hidden" name="id" value="new"/>
    <input type="hidden" name="action" value="add-question"/>
    <input type="submit" value="Save">
</form>
<div>
    <a href="list-questions"> Back </a>
</div>
</body>
</html>

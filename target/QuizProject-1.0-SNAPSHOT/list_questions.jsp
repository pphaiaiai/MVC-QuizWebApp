<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/30/2022
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz</title>
</head>
<link rel="stylesheet" href="css/styleZ.css">
<body>
<h1>List Questions:</h1>
<p><a href="home">Home</a> > <a href="edit-question?id=new">Add Question</a> </p>
<table>
    <tr>
        <th><b>Id</b></th>
        <th><b>Question</b></th>
        <th><b>#Choice</b></th>
        <th><b>Action</b></th>
    </tr>
    <c:forEach items="${questions}" var="ques" varStatus="qs">
        <tr>
            <td>${ques.id}</td>
            <td>${ques.question}</td>
            <td>${ques.answers.size()}</td>
            <td class="action">
                [<a href="edit-question?id=${ques.id}"> Edit </a>|
                <a href="edit-question?id=${ques.id}&action=remove-question"> Delete </a>]</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
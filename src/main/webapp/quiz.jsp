<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/23/2022
  Time: 7:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz</title>
</head>
<link rel="stylesheet" href="css/styleZ.css">
<body>
<h1>Quiz</h1>
<h3>There are ${questions.size()} questions</h3>
<form action="check-answer" method="post">
    <c:forEach items="${questions}" var="ques" varStatus="qs">
        <p>
        <h4>${qs.index+1}. ${ques.question}</h4>
        <c:set var="choice" value="abcdefg" />
        <c:forEach items="${ques.answers}" var="ans" varStatus="as">
            <div>
                <input type="radio" name="answer[${qs.index+1}]" value="${choice.charAt(as.index)}">
                    ${choice.charAt(as.index)}. ${ans.answer}
            </div>
        </c:forEach>
        </p>
    </c:forEach>
    <input type="submit" value="Submit">
</form>
</body>
</html>

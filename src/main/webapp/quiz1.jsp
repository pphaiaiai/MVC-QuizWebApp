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
<h1>Quiz ${ yourScore != null ? "Solution" : ""}</h1>
<c:if test="${yourScore != null}">
    <h3>Your score : ${yourScore} / ${questions.size()}</h3>
</c:if>
<h3>There are ${questions.size()} questions</h3>
<a href="home">Home</a>
<form action="show-check-quiz" method="post">
    <c:forEach items="${questions}" var="ques" varStatus="qs">
        <p>
        <h4>${qs.index+1}. ${ques.question}</h4>
        <c:set var="choice" value="abcdefg"/>
        <c:forEach items="${ques.answers}" var="ans" varStatus="as">
            <c:choose>
                <c:when test="${yourScore != null}">
                    <div>
                        <input type="radio" name="answer[${qs.index+1}]"
                               value="${choice.charAt(as.index)}"
                            ${ (answer[qs.index+1]-97) == as.index ? "checked":"" }>
                            ${choice.charAt(as.index)}. ${ans.answer}
                            ${as.index == ques.correctIndex ? "<-- Correct":"" }
                    </div>
                </c:when>
                <c:otherwise>
                    <div>
                        <input type="radio" name="answer[${qs.index+1}]" value="${choice.charAt(as.index)}">
                            ${choice.charAt(as.index)}. ${ans.answer}
                    </div>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        </p>
    </c:forEach>
    <c:choose>
        <c:when test="${yourScore != null}">
            <a href="show-check-quiz">New Quiz</a>
        </c:when>
        <c:otherwise>
            <input type="submit" value="Submit">
        </c:otherwise>
    </c:choose>
</form>
</body>
</html>

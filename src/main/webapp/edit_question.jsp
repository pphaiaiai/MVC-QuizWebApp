<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sit.int202.quizproject.models.Question" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/30/2022
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz</title>
    <link rel="stylesheet" href="css/styleZ.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="card">
    <c:choose>
        <c:when test='${id == "new"}'>
            <h3 class="label">New Question</h3>
            <p>
            <form action="edit-question" method="post">
                <span class="label">Question : </span>
                <input type="text" name="text"  />
                <input type="hidden" name="id" value="new" />
                <input type="hidden" name="action" value="add-question" />
                <input type="submit" value="Save">
            </form>
            </p>
            <a href="list-questions">Back</a>
        </c:when>
        <c:otherwise>
        <h3 class="label">QID: ${questionbyid.id}</h3>
        <p>
        <div id="edit-ques-form" class="hide">
            <form action="edit-question" method="post">
                <span class="label">Question : </span>
                <input type="text" name="text" value="${questionbyid.question}"/>
                <input type="hidden" name="action" value="edit-question"/>
                <input type="hidden" name="id" value="${questionbyid.id}"/>
                <input type="submit" value="Save">
            </form>
        </div>
        <div id="edit-ques">
            <span class="label"><b>Question:</b></span>
                ${questionbyid.question} <span class="action">[<a id="edit-ques-but" href="#"> Edit </a>]</span>
        </div>
        </p>
        <c:set var="choice" value="abcdefghijklmnopqrstuvwxyz"/>
        <c:forEach items="${questionbyid.answers}" var="answer" varStatus="as">
            <div id="edit-answer-form-${as.index}" class="hide">
                <form action="edit-question" method="post">
                    <label for="isCorrect-edit">${choice.charAt(as.index)}.</label>
                    <input type="text" name="text" size="30" placeholder="edit answer" value="${answer.answer}"/>
                    <input id="isCorrect-edit" type="checkbox" name="isCorrect" ${answer.correct?"checked":""} >
                    <label for="isCorrect-edit">Correct?</label>
                    <input type="hidden" name="action" value="edit-answer"/>
                    <input type="hidden" name="oldText" value="${answer.answer}"/>
                    <input type="hidden" name="id" value="${questionbyid.id}"/>
                    <input type="submit" value="Save">
                </form>
            </div>
            <div id="edit-answer-${as.index}">
                          <span ${ answer.correct?'class="correct"':""}>
                                  ${choice.charAt(as.index)}. ${answer.answer}</span><span class="action">
                          [ <a href="#" onclick="editAnswer(${as.index})">Edit</a> |
                            <a href="edit-question?id=${questionbyid.id}&text=${answer.answer}&action=remove-answer">Delete</a> ]
                          </span>
            </div>
        </c:forEach>
        <br>
        <div id="new-answer" class="hide">
            <form action="edit-question" method="post">
                <input type="text" name="text" placeholder="Enter new answer"/>
                <input id="is-correct" type="checkbox" name="isCorrect"/>
                <label for="is-correct">Correct?</label>
                <input type="hidden" name="action" value="add-answer"/>
                <input type="hidden" name="id" value="${questionbyid.id}"/>
                <input type="submit" value="Add"/>
            </form>
        </div>
        <div>
            <a href="list-questions"> Back </a>&nbsp
            <a id="add-but" href="#"> Add Answer </a>
        </div>
        </c:otherwise>
    </c:choose>
    <script>
        $('#add-but').click(function () {
            if ($('#new-answer').hasClass('hide')) {
                $('#add-but').text("Close Answer");
            } else {
                $('#add-but').text("Add Answer");
            }
            $('#new-answer').toggleClass('hide');
        });
        $('#edit-ques-but').click(function () {
            if ($('#edit-ques-form').hasClass('hide')) {
                $('#edit-ques').addClass('hide');
            } else {
                $('#edit-ques').removeClass('hide');
            }
            $('#edit-ques-form').toggleClass('hide');
        });

        function editAnswer(index) {
            $('#edit-answer-' + index).toggleClass('hide');
            $('#edit-answer-form-' + index).toggleClass('hide');
        }
    </script>
</div>
</body>
</html>

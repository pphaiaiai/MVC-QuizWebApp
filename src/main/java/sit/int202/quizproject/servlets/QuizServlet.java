package sit.int202.quizproject.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.quizproject.models.Answer;
import sit.int202.quizproject.models.Question;
import sit.int202.quizproject.models.QuestionList;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "QuizServlet", value = "/show-quiz")
public class QuizServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuestionList questionList = new QuestionList() ;
        ArrayList<Question> questions = questionList.getQuestions() ;
        request.setAttribute("questions",questions);
        getServletContext().getRequestDispatcher("/quiz1.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

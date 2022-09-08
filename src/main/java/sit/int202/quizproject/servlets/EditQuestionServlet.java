package sit.int202.quizproject.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.quizproject.models.Answer;
import sit.int202.quizproject.models.Question;
import sit.int202.quizproject.models.QuestionList;

import java.io.IOException;

@WebServlet(name = "EditQuestionServlet", value = "/edit-question")
public class EditQuestionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuestionList questionList = new QuestionList();

        String strId = request.getParameter("id");
        String action = request.getParameter("action");

        if (strId != null && strId.length() > 0) {
            if (strId.equals("new")) {
                request.setAttribute("id", "new");
                getServletContext().getRequestDispatcher("/edit_question.jsp").forward(request, response);
                return;

            } else if (action != null && action.equals("remove-question")) {
                int id = Integer.parseInt(strId);
                questionList.remove(id);
                response.sendRedirect("list-questions");
                return;

            } else if (action != null && action.equals("remove-answer")) {
                String text = request.getParameter("text");
                int id = Integer.parseInt(strId);
                Question question = questionList.find(id);
                if(text !=null && text.length() > 0){
                    question.remove(text);
                }
                response.sendRedirect("edit-question?id=" + id);
                return;
            }
            else {
                int id = Integer.parseInt(strId);
                Question question = questionList.find(id);
                if (question != null) {
                    request.setAttribute("questionbyid", question);
                    getServletContext().getRequestDispatcher("/edit_question.jsp").forward(request, response);
                    return;
                }
                response.sendRedirect("list-questions");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("id");
        String text = request.getParameter("text");
        String action = request.getParameter("action");
        int id;
        try {
            id = Integer.parseInt(strId);
        } catch (NumberFormatException nfe) {
            id = -1;
        }

        QuestionList questionList = new QuestionList();
        Question question;

        if (action != null && text != null && text.length() > 0 && action.equals("edit-question")) {
            question = questionList.find(id);
            if (question != null) {
                question.setQuestion(text);
            }

        } else if (action != null && text != null && text.length() > 0 && action.equals("add-question")) {

            if (text.trim().length() > 0) {
                question = new Question(text);
                questionList.addQuestion(question);
//                response.sendRedirect("list-questions");
//                return ;
                id = question.getId();
            }

        } else if (action != null && text != null && text.length() > 0 && action.equals("add-answer")) {
            String correct = request.getParameter("isCorrect");

            boolean isCorrect;
            if (correct != null) {
                isCorrect = true;
            } else {
                isCorrect = false;
            }

            question = questionList.find(id);
            if (question != null) {
                question.addAnswer(text, isCorrect);
            }

        } else if (action != null && text != null && text.length() > 0 && action.equals("edit-answer")) {
            String correct = request.getParameter("isCorrect");
            String oldText = request.getParameter("oldText");

            boolean isCorrect;
            if (correct != null) {
                isCorrect = true;
            } else {
                isCorrect = false;
            }

            question = questionList.find(id);
            if (question != null) {
                Answer ans = question.find(oldText);
                if (ans != null) {
                    ans.setAnswer(text);
                    ans.setCorrect(isCorrect);
                }
            }
        } else {
            response.sendRedirect("list-questions");
            return;
        }

        response.sendRedirect("edit-question?id=" + id);
    }
}

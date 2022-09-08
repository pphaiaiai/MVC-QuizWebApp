package sit.int202.quizproject.models;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;

@Getter
@Setter
public class QuestionList {
    private static ArrayList<Question> questions = new ArrayList<>();

    static {
        Question q = new Question("What's your cat name?");
        q.addAnswer(new Answer("One"));
        q.addAnswer(new Answer("Two"));
        q.addAnswer(new Answer("Three"));
        q.addAnswer(new Answer("Ten", true));
        questions.add(q);

        q = new Question("What's your dog name?");
        q.addAnswer(new Answer("Ton"));
        q.addAnswer(new Answer("Toon"));
        q.addAnswer(new Answer("Tarn", true));
        q.addAnswer(new Answer("Tu"));
        questions.add(q);

        q = new Question("What's your bird name?");
        q.addAnswer(new Answer("Gojo", true));
        q.addAnswer(new Answer("Gogo"));
        q.addAnswer(new Answer("Gugu"));
        q.addAnswer(new Answer("Jogo"));
        questions.add(q);

        q = new Question("What's your girlfriend name?");
        q.addAnswer(new Answer("Pleng"));
        q.addAnswer(new Answer("Peng", true));
        q.addAnswer(new Answer("Pung"));
        q.addAnswer(new Answer("Pong"));
        questions.add(q);

        q = new Question("What's your AKA name?");
        q.addAnswer(new Answer("Phai"));
        q.addAnswer(new Answer("Pai"));
        q.addAnswer(new Answer("Pi", true));
        questions.add(q);
    }

    public void addQuestion(Question question) {
        questions.add(question);
    }

    public Question find(int id) {
        for (Question question : questions) {
            if (question.getId() == id) {
                return question;
            }
        }
        return null;
    }

    public void remove(int id) {
        Question question = this.find(id);
        if (question != null) {
            questions.remove(question);
        }
    }

    public ArrayList<Question> getQuestions() {
        return questions;
    }

//    public Question getAnswer(){
//        Question ans = new ArrayList<Answer>();
//
//        return answers;
//    }
}

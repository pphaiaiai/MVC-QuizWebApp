package sit.int202.quizproject.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;

@Getter
@Setter
@NoArgsConstructor
public class Question {
    public static int count;
    private int id;
    private String question;
    private ArrayList<Answer> answers;

    public Question(String question) {
        this.id = ++count;
        this.question = question;
        this.answers = new ArrayList<>();
    }

    public int getCorrectIndex(){
        int index = -1 ;
        for(int i=0; i<answers.size(); i++){
            if(answers.get(i).isCorrect()){
                index = i ;
                return index ;
            }
        }
        return index ;
    }

    public void addAnswer(Answer answer) {
        answers.add(answer);
    }

    public void addAnswer(String answer) {
        addAnswer(answer, false);
    }

    public void addAnswer(String answer, boolean isCorrect) {
        Answer newAnswer = new Answer(answer, isCorrect);
        answers.add(newAnswer);
    }

    public Answer find(String answer){
        for (Answer ans: answers ) {
            if (ans.getAnswer().equals(answer)) {
                return ans;
            }
        }
        return null;
    }

    public void remove(String id) {
        Answer answer = this.find(id);
        if (answer != null) {
            answers.remove(answer);
        }
    }
}

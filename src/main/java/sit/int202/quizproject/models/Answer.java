package sit.int202.quizproject.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Answer {
    private String answer;
    private boolean isCorrect;

    public Answer(String answer, boolean isCorrect) {
        this.answer = answer;
        this.isCorrect = isCorrect;
    }

    public Answer(String answer) {
        this(answer , false);
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public boolean getCorrect(){
        return isCorrect ;
    }
}

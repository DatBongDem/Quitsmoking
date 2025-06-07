/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.sql.Date;

/**
 *
 * @author Nghia
 */
public class QuizResult {

    public class QuizSubmission {

        private String IDMember;
        private String IDQuiz;
        private String Answer;

        public QuizSubmission() {
        }

        public QuizSubmission(String IDMember, String IDQuiz, String Answer) {
            this.IDMember = IDMember;
            this.IDQuiz = IDQuiz;
            this.Answer = Answer;

        }

        public String getIDMember() {
            return IDMember;
        }

        public void setIDMember(String IDMember) {
            this.IDMember = IDMember;
        }

        public String getIDQuiz() {
            return IDQuiz;
        }

        public void setIDQuiz(String IDQuiz) {
            this.IDQuiz = IDQuiz;
        }

        public String getAnswer() {
            return Answer;
        }

        public void setAnswer(String Answer) {
            this.Answer = Answer;
        }

    }

}

import 'dart:async';

import 'package:english_learning_app/models/exam_model.dart';

import '../models/question_model.dart';
import '../models/answer_model.dart';

class ExamViewModel {
  final List<QuestionModel> questions = QuestionModel.questions;
  ExamModel exam;
  int currentPage = 0;
  final int questionsPerPage = 5;
  int countdownTime = 0; // 5 phút
  Timer? timer;
  Map<int, int> selectedAnswers = {}; // Lưu ID của đáp án được chọn
  double totalScore = 0.0;



  ExamViewModel(this.exam){
    countdownTime = exam.examTime;
  }

  StreamController<int> countdownController = StreamController<int>.broadcast();

  void startCountdown(Function onTimeUp) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownTime == 0) {
        timer.cancel();
        onTimeUp();
      } else {
        countdownTime--;
        countdownController.add(countdownTime);
      }
    });
  }

  void stopCountdown() {
    timer?.cancel();
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  List<QuestionModel> getDisplayedQuestions() {
    final start = currentPage * questionsPerPage;
    final end = start + questionsPerPage;
    return questions.sublist(
      start,
      end > questions.length ? questions.length : end,
    );
  }

  void calculateScore() {
    totalScore = 0.0;
    for (var question in questions) {
      int? selectedAnswerID = selectedAnswers[question.questionID];
      if (selectedAnswerID != null) {
        AnswerModel selectedAnswer = question.answers.firstWhere(
              (answer) => answer.answerID == selectedAnswerID,
          orElse: () => AnswerModel(0, '', 0, question.questionID),
        );
        if (selectedAnswer.answerCorrect == 1) {
          totalScore += question.questionScore;
        }
      }
    }
  }

  void nextPage() {
    currentPage++;
  }

  void previousPage() {
    currentPage--;
  }

  bool isLastPage() {
    return (currentPage + 1) * questionsPerPage >= questions.length;
  }

  void dispose() {
    countdownController.close();
    stopCountdown();
  }
}

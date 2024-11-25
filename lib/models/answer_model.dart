class AnswerModel {
  final int _answerID;
  final String _answerContent;
  final int _answerCorrect;
  final int _questionID;

  AnswerModel(this._answerID, this._answerContent, this._answerCorrect,
      this._questionID);

  int get questionID => _questionID;

  int get answerCorrect => _answerCorrect;

  String get answerContent => _answerContent;

  int get answerID => _answerID;
}
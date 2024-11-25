import 'package:english_learning_app/models/answer_model.dart';

class QuestionModel {
    final int _questionID;
    final String _questionContent;
    final double _questionScore;
    final String _type;
    final int _examID;
    final List<AnswerModel> _answers;

    QuestionModel(this._questionID, this._questionContent, this._questionScore,
      this._type, this._examID, this._answers);

    static final List<QuestionModel> questions = [
        QuestionModel(
            1,
            'Câu hỏi 1: Thủ đô của Việt Nam là gì?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(1, 'Hà Nội', 1, 1), // Đáp án đúng
                AnswerModel(2, 'Hồ Chí Minh', 0, 1),
                AnswerModel(3, 'Đà Nẵng', 0, 1),
                AnswerModel(4, 'Hải Phòng', 0, 1),
            ],
        ),
        QuestionModel(
            2,
            'Câu hỏi 2: Con sông dài nhất thế giới là?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(5, 'Sông Nile', 1, 2), // Đáp án đúng
                AnswerModel(6, 'Sông Amazon', 0, 2),
                AnswerModel(7, 'Sông Hằng', 0, 2),
                AnswerModel(8, 'Sông Mekong', 0, 2),
            ],
        ),
        QuestionModel(
            3,
            'Câu hỏi 3: Ngày Quốc khánh của Việt Nam là ngày nào?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(9, '2/9', 1, 3), // Đáp án đúng
                AnswerModel(10, '30/4', 0, 3),
                AnswerModel(11, '1/5', 0, 3),
                AnswerModel(12, '1/6', 0, 3),
            ],
        ),
        QuestionModel(
            4,
            'Câu hỏi 4: Ai là tác giả của truyện Kiều?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(13, 'Nguyễn Du', 1, 4), // Đáp án đúng
                AnswerModel(14, 'Nguyễn Trãi', 0, 4),
                AnswerModel(15, 'Hồ Xuân Hương', 0, 4),
                AnswerModel(16, 'Phan Bội Châu', 0, 4),
            ],
        ),
        QuestionModel(
            5,
            'Câu hỏi 5: Đâu là một ngôn ngữ lập trình phổ biến?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(17, 'Python', 1, 5), // Đáp án đúng
                AnswerModel(18, 'HTML', 0, 5),
                AnswerModel(19, 'CSS', 0, 5),
                AnswerModel(20, 'SQL', 0, 5),
            ],
        ),
        QuestionModel(
            5,
            'Câu hỏi 5: Đâu là một ngôn ngữ lập trình phổ biến?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(17, 'Python', 1, 5), // Đáp án đúng
                AnswerModel(18, 'HTML', 0, 5),
                AnswerModel(19, 'CSS', 0, 5),
                AnswerModel(20, 'SQL', 0, 5),
            ],
        ),
        // Tiếp tục thêm các câu hỏi khác nếu cần
    ];

    List<AnswerModel> get answers => _answers;

  int get examID => _examID;

  String get type => _type;

  double get questionScore => _questionScore;

  String get questionContent => _questionContent;

  int get questionID => _questionID;
}
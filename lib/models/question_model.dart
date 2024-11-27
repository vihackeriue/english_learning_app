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
        // Câu hỏi 1: Từ vựng tiếng Anh - nghĩa của "apple"
        QuestionModel(
            1,
            'Câu hỏi 1: "Apple" trong tiếng Anh có nghĩa là gì?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(1, 'Táo', 1, 1), // Đáp án đúng
                AnswerModel(2, 'Chuối', 0, 1),
                AnswerModel(3, 'Cam', 0, 1),
                AnswerModel(4, 'Dưa hấu', 0, 1),
            ],
        ),

        // Câu hỏi 2: Ngữ pháp tiếng Anh - thì hiện tại đơn
        QuestionModel(
            2,
            'Câu hỏi 2: "She ___ to the park every day." Chọn từ đúng để điền vào chỗ trống.',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(5, 'goes', 1, 2), // Đáp án đúng
                AnswerModel(6, 'going', 0, 2),
                AnswerModel(7, 'gone', 0, 2),
                AnswerModel(8, 'to go', 0, 2),
            ],
        ),

        // Câu hỏi 3: Từ vựng tiếng Anh - nghĩa của "book"
        QuestionModel(
            3,
            'Câu hỏi 3: "Book" trong tiếng Anh có nghĩa là gì?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(9, 'Sách', 1, 3), // Đáp án đúng
                AnswerModel(10, 'Bút', 0, 3),
                AnswerModel(11, 'Bàn', 0, 3),
                AnswerModel(12, 'Cặp', 0, 3),
            ],
        ),

        // Câu hỏi 4: Ngữ pháp tiếng Anh - thì quá khứ đơn
        QuestionModel(
            4,
            'Câu hỏi 4: "He ___ a movie last night." Chọn từ đúng để điền vào chỗ trống.',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(13, 'watched', 1, 4), // Đáp án đúng
                AnswerModel(14, 'watch', 0, 4),
                AnswerModel(15, 'watching', 0, 4),
                AnswerModel(16, 'watches', 0, 4),
            ],
        ),

        // Câu hỏi 5: Từ vựng tiếng Anh - nghĩa của "computer"
        QuestionModel(
            5,
            'Câu hỏi 5: "Computer" trong tiếng Anh có nghĩa là gì?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(17, 'Máy tính', 1, 5), // Đáp án đúng
                AnswerModel(18, 'Điện thoại', 0, 5),
                AnswerModel(19, 'Máy ảnh', 0, 5),
                AnswerModel(20, 'Ti vi', 0, 5),
            ],
        ),

        // Câu hỏi 6: Ngữ pháp tiếng Anh - câu hỏi với "do"
        QuestionModel(
            6,
            'Câu hỏi 6: "___ you like coffee?" Chọn từ đúng để điền vào chỗ trống.',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(21, 'Do', 1, 6), // Đáp án đúng
                AnswerModel(22, 'Does', 0, 6),
                AnswerModel(23, 'Is', 0, 6),
                AnswerModel(24, 'Are', 0, 6),
            ],
        ),

        // Câu hỏi 7: Từ vựng tiếng Anh - nghĩa của "dog"
        QuestionModel(
            7,
            'Câu hỏi 7: "Dog" trong tiếng Anh có nghĩa là gì?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(25, 'Chó', 1, 7), // Đáp án đúng
                AnswerModel(26, 'Mèo', 0, 7),
                AnswerModel(27, 'Gà', 0, 7),
                AnswerModel(28, 'Cá', 0, 7),
            ],
        ),

        // Câu hỏi 8: Ngữ pháp tiếng Anh - thì hiện tại tiếp diễn
        QuestionModel(
            8,
            'Câu hỏi 8: "They ___ playing football now." Chọn từ đúng để điền vào chỗ trống.',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(29, 'are', 1, 8), // Đáp án đúng
                AnswerModel(30, 'is', 0, 8),
                AnswerModel(31, 'am', 0, 8),
                AnswerModel(32, 'was', 0, 8),
            ],
        ),

        // Câu hỏi 9: Từ vựng tiếng Anh - nghĩa của "school"
        QuestionModel(
            9,
            'Câu hỏi 9: "School" trong tiếng Anh có nghĩa là gì?',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(33, 'Trường học', 1, 9), // Đáp án đúng
                AnswerModel(34, 'Bệnh viện', 0, 9),
                AnswerModel(35, 'Chợ', 0, 9),
                AnswerModel(36, 'Cửa hàng', 0, 9),
            ],
        ),

        // Câu hỏi 10: Ngữ pháp tiếng Anh - câu hỏi với "can"
        QuestionModel(
            10,
            'Câu hỏi 10: "Can you ___ this for me?" Chọn từ đúng để điền vào chỗ trống.',
            1.0,
            'trac-nghiem',
            101,
            [
                AnswerModel(37, 'do', 1, 10), // Đáp án đúng
                AnswerModel(38, 'does', 0, 10),
                AnswerModel(39, 'doing', 0, 10),
                AnswerModel(40, 'done', 0, 10),
            ],
        ),

        // Tiếp tục thêm các câu hỏi khác về từ vựng và ngữ pháp tiếng Anh nếu cần
    ];


    List<AnswerModel> get answers => _answers;

  int get examID => _examID;

  String get type => _type;

  double get questionScore => _questionScore;

  String get questionContent => _questionContent;

  int get questionID => _questionID;
}
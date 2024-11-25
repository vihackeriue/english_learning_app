
class ExamModel {
    final int _examID;
    final String _examName;
    final String _description;
    final String _examDate;
    final int _examTime;
    final int _level;
    final int _maxNumberOfExam;
    final double _passingScore;
    final int _status;
    final String _type;
    final int _courseID;

    ExamModel(
      this._examID,
      this._examName,
      this._description,
      this._examDate,
      this._examTime,
      this._level,
      this._maxNumberOfExam,
      this._passingScore,
      this._status,
      this._type,
      this._courseID);

    int get examID => _examID;
  static List<ExamModel> sampleExams = [
        ExamModel(
            1,
            "English Exam A1",
            "This is a basic level English exam for beginners.",
            "2024-12-01",
            300,
            1, // Level 1 (Basic)
            100, // Maximum number of exams
            70.0, // Passing score
            1, // Status 1 (Active)
            "Online", // Type (Online exam)
            101, // Course ID
        ),
        ExamModel(
            2,
            "Math Exam B1",
            "Intermediate math exam covering algebra and geometry.",
            "2024-12-05",
            500,
            2, // Level 2 (Intermediate)
            50, // Maximum number of exams
            75.0, // Passing score
            1, // Status 1 (Active)
            "Offline", // Type (Offline exam)
            102, // Course ID
        ),
        ExamModel(
            3,
            "Physics Exam B2",
            "A physics exam for students with intermediate knowledge.",
            "2024-12-10",
            300,
            2, // Level 2 (Intermediate)
            60, // Maximum number of exams
            80.0, // Passing score
            0, // Status 0 (Inactive)
            "Online", // Type (Online exam)
            103, // Course ID
        ),
        ExamModel(
            4,
            "History Exam C1",
            "Advanced level exam on World History.",
            "2024-12-15",
            300,
            3, // Level 3 (Advanced)
            30, // Maximum number of exams
            85.0, // Passing score
            1, // Status 1 (Active)
            "Offline", // Type (Offline exam)
            104, // Course ID
        ),
        ExamModel(
            5,
            "Programming Exam A2",
            "Exam covering basic programming concepts and logic.",
            "2024-12-20",
            300,
            1, // Level 1 (Basic)
            120, // Maximum number of exams
            65.0, // Passing score
            1, // Status 1 (Active)
            "Online", // Type (Online exam)
            105, // Course ID
        ),
    ];

    String get examName => _examName;

    String get description => _description;

    String get examDate => _examDate;

    int get examTime => _examTime;

    int get level => _level;

    int get maxNumberOfExam => _maxNumberOfExam;

    double get passingScore => _passingScore;

    int get status => _status;

    String get type => _type;

    int get courseID => _courseID;
}
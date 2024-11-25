import 'package:english_learning_app/constrants/app_colors.dart';
import 'package:english_learning_app/models/vocabulary_model.dart';
import 'package:english_learning_app/views/screens/student/practice_1_screen.dart';
import 'package:english_learning_app/views/screens/student/practice_2_screen.dart';
import 'package:english_learning_app/views/screens/student/practice_3_screen.dart';
import 'package:english_learning_app/views/screens/student/practice_4_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PracticeDialog extends StatefulWidget {
  final double progress;
  final List<VocabularyModel> vocabList;


  PracticeDialog(this.progress,this.vocabList);

  @override
  _PracticeDialogState createState() => _PracticeDialogState();
}

class _PracticeDialogState extends State<PracticeDialog> {
  late List<Map<String, dynamic>> practiceExercises;

  @override
  void initState() {
    super.initState();
    _initializeExercises();
  }

  void _initializeExercises() {
    practiceExercises = [
      {"title": "Bài 1", "isComplete": widget.progress >= 20},
      {"title": "Bài 2", "isComplete": widget.progress >= 40},
      {"title": "Bài 3", "isComplete": widget.progress >= 60},
      {"title": "Bài 4", "isComplete": widget.progress >= 80},
    ];
  }

  Future<void> _navigateToPracticeScreen(BuildContext context, int index) async {
    double? newProgress;
    Navigator.of(context).pop();
    // Điều hướng đến các màn hình luyện tập và nhận giá trị progress mới
    if (index == 0) {
      newProgress = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Practice1Screen(widget.vocabList)),
      );
    } else if (index == 1) {
      newProgress = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Practice2Screen()),
      );
    } else if (index == 2) {
      newProgress = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Practice3Screen()),
      );
    } else if (index == 3) {
      newProgress = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Practice4Screen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: AppColors.darkBlueBlack,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              title: Text(
                'Bài luyện tập',
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: practiceExercises.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> exercise = entry.value;
                  bool canPractice = index == 0 || practiceExercises[index - 1]['isComplete'];
                  bool isComplete = exercise['isComplete'];
                  bool isCurrent = !isComplete && canPractice;

                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isComplete
                                ? Colors.green
                                : isCurrent
                                ? AppColors.darkPurpleBlue
                                : Colors.grey.shade300,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Row(
                          children: [
                            Icon(
                              exercise['isComplete'] ? Icons.check_circle : Icons.circle,
                              color: exercise['isComplete'] ? Colors.green : Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                exercise['title'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.darkPurpleBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                isComplete
                                    ? Icons.refresh
                                    : isCurrent
                                    ? Icons.play_circle_fill
                                    : Icons.lock,
                                color: isComplete
                                    ? Colors.green
                                    : isCurrent
                                    ? AppColors.darkPurpleBlue
                                    : Colors.grey,
                              ),
                              onPressed: canPractice
                                  ? () => _navigateToPracticeScreen(context, index)
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      if (index < practiceExercises.length - 1)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Divider(thickness: 1, color: Colors.grey.shade300),
                        ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

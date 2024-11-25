import 'package:english_learning_app/constrants/app_colors.dart';
import 'package:english_learning_app/models/exam_model.dart';
import 'package:english_learning_app/models/lesson_model.dart';
import 'package:english_learning_app/view_model/lesson_viewmodel.dart';
import 'package:english_learning_app/views/screens/student/exam_screen.dart';
import 'package:english_learning_app/views/screens/student/lesson_screen.dart';
import 'package:english_learning_app/views/widget/tab/lesson_list_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class CourseDetailScreen extends StatefulWidget {
  final int courseId;
  final String courseName;

  CourseDetailScreen({required this.courseId, required this.courseName});

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(

        title: Text(widget.courseName, style: TextStyle(color: Colors.white.withOpacity(0.8)),),
        iconTheme: IconThemeData(color: Colors.white),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white, // Màu chữ cho tab được chọn
          unselectedLabelColor: Colors.grey, // Màu chữ cho tab không được chọn
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ), // Kiểu chữ cho tab được chọn
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
          ), // Kiểu chữ cho tab không được chọn
          indicatorColor: Colors.white, // Màu của thanh chỉ báo tab
          tabs: [
            Tab(text: 'Bài học'),
            Tab(text: 'Bài thi'),
          ],
        ),
        backgroundColor: AppColors.darkBlueBlack,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: TabBarView(
        controller: _tabController,
        children: [
          LessonListTab(widget.courseId),
          ExamTab(),
        ],
      ),
    );
  }
}
class ExamTab extends StatelessWidget {
  // Danh sách các bài thi mẫu
  final List<ExamModel> exams = ExamModel.sampleExams;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exams.length,
      itemBuilder: (context, index) {
        final exam = exams[index]; // Lấy bài thi tại vị trí index
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamScreen(exam), // Chuyển đến màn hình thi
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.school, color: Colors.blue), // Icon của môn học
                      SizedBox(width: 8),
                      Text(
                        'Tên bài thi: ${exam.examName}', // Hiển thị tên bài thi
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('Cấp độ: ${exam.level == 1 ? "Dễ" : exam.level == 2 ? "Trung bình" : "Khó"}'),
                  Text('Thời gian: ${exam.examTime}'),
                  Text('Ngày hết hạn: ${exam.examDate}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


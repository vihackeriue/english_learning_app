import 'package:english_learning_app/constrants/app_constrants.dart';
import 'package:english_learning_app/models/exam_model.dart';
import 'package:english_learning_app/models/vocabulary_model.dart';
import 'package:english_learning_app/view_model/exam_detail_viewmodel.dart';
import 'package:english_learning_app/view_model/exam_list_viewmodel.dart';
import 'package:english_learning_app/view_model/lesson_viewmodel.dart';
import 'package:english_learning_app/view_model/my_course_viewmodel.dart';
import 'package:english_learning_app/view_model/practice_2_viewmodel.dart';
import 'package:english_learning_app/view_model/practice_3_viewmodel.dart';
import 'package:english_learning_app/view_model/statistics_score_viewmodel.dart';
import 'package:english_learning_app/view_model/translate_viewmodel.dart';
import 'package:english_learning_app/view_model/vocabulary_viewmodel.dart';
import 'package:english_learning_app/views/screens/get_start_screen.dart';
import 'package:english_learning_app/views/screens/student/chat_ai_screen.dart';
import 'package:english_learning_app/views/screens/student/course_screen.dart';
import 'package:english_learning_app/views/screens/login_screen.dart';
import 'package:english_learning_app/views/screens/student/home_student_screen.dart';
import 'package:english_learning_app/views/screens/student/my_vocabulary_screen.dart';
import 'package:english_learning_app/views/screens/profile_screen.dart';
import 'package:english_learning_app/views/screens/student/reminder_screen.dart';
import 'package:english_learning_app/views/screens/student/statistics_screen.dart';
import 'package:english_learning_app/views/screens/student/translate_screen.dart';
import 'package:english_learning_app/views/screens/teacher/course_management_screen.dart';
import 'package:english_learning_app/views/screens/teacher/home_teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();





  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.setString('access_token', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJob2FuZ21pbmhAZ21haWwuY29tIiwiaWF0IjoxNzM0ODU5NzY2LCJleHAiOjE3MzQ5NDYxNjZ9._cYvF1UZamA6VELVcl_JMdVUhE43MV121k7qqpHe654');
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TranslateViewModel()),
        ChangeNotifierProvider(create: (_) => MyCourseViewmodel()),
        ChangeNotifierProvider(create: (_) => LessonViewModel()),
        ChangeNotifierProvider(create: (_) => VocabularyViewmodel()),
        Provider<ExamDetailViewmodel>(create: (_) => ExamDetailViewmodel()),
        // Thêm các provider khác ở đây nếu có
        ChangeNotifierProvider(create: (_) => ExamListViewmodel()),
        ChangeNotifierProvider(create: (_) => StatisticsScoreViewmodel()),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'English Learning App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/student': (context) => StudentNavigation(),
          '/teacher': (context) => TeacherNavigation(),
          '/my-vocabulary': (context) => MyVocabularyScreen(),
          // '/course-detail': (context) => CourseDetailScreen(),
          '/get-start': (context) => GetStartScreen(),
          '/reminder': (context) => ReminderScreen(),
          '/chat-ai': (context) => ChatAiScreen(),
        },
      
      );
  }
}

class StudentNavigation extends StatefulWidget {
  @override
  _StudentNavigationState createState() => _StudentNavigationState();
}

class _StudentNavigationState extends State<StudentNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeStudentScreen(),
    CourseScreen(),
    TranslateScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Trang chủ"),
          NavigationDestination(icon: Icon(Icons.class_rounded), label: "Khóa học"),
          NavigationDestination(icon: Icon(Icons.translate_rounded), label: "Dịch"),
          NavigationDestination(icon: Icon(Icons.person), label: "Hồ sơ"),
        ],
      ),
    );
  }
}


class TeacherNavigation extends StatefulWidget {
  @override
  _TeacherNavigationState createState() => _TeacherNavigationState();
}

class _TeacherNavigationState extends State<TeacherNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeTeacherScreen(),
    CourseManagementScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Trang chủ"),
          NavigationDestination(icon: Icon(Icons.class_rounded), label: "Khóa học"),
          NavigationDestination(icon: Icon(Icons.person), label: "Hồ sơ"),
        ],
      ),
    );
  }
}




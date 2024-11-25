import 'package:english_learning_app/models/vocabulary_model.dart';
import 'package:english_learning_app/view_model/lesson_viewmodel.dart';
import 'package:english_learning_app/view_model/my_course_viewmodel.dart';
import 'package:english_learning_app/view_model/practice_2_viewmodel.dart';
import 'package:english_learning_app/view_model/practice_3_viewmodel.dart';
import 'package:english_learning_app/view_model/translate_viewmodel.dart';
import 'package:english_learning_app/view_model/vocabulary_viewmodel.dart';
import 'package:english_learning_app/views/screens/get_start_screen.dart';
import 'package:english_learning_app/views/screens/student/course_screen.dart';
import 'package:english_learning_app/views/screens/login_screen.dart';
import 'package:english_learning_app/views/screens/student/home_student_screen.dart';
import 'package:english_learning_app/views/screens/student/my_vocabulary_screen.dart';
import 'package:english_learning_app/views/screens/student/profile_screen.dart';
import 'package:english_learning_app/views/screens/student/statistics_screen.dart';
import 'package:english_learning_app/views/screens/student/translate_screen.dart';
import 'package:english_learning_app/views/screens/teacher/course_management_screen.dart';
import 'package:english_learning_app/views/screens/teacher/home_teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Practice2ViewModel()),
        ChangeNotifierProvider(create: (_) => Practice3ViewModel()),
        ChangeNotifierProvider(create: (_) => TranslateViewModel()),
        ChangeNotifierProvider(create: (_) => MyCourseViewmodel()),
        ChangeNotifierProvider(create: (_) => LessonViewModel()),
        ChangeNotifierProvider(create: (_) => VocabularyViewmodel()),

        // Thêm các provider khác ở đây nếu có
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
      initialRoute: '/student',
      routes: {
        '/login': (context) => LoginScreen(),
        '/student': (context) => StudentNavigation(),
        '/teacher': (context) => TeacherNavigation(),
        '/my-vocabulary': (context) => MyVocabularyScreen(),
        // '/course-detail': (context) => CourseDetailScreen(),
        '/get-start': (context) => GetStartScreen(),
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
    StatisticsScreen(),
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
          NavigationDestination(icon: Icon(Icons.add_chart_outlined), label: "Thống kê"),

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




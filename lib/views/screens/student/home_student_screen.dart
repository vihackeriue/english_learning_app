
import 'package:carousel_slider/carousel_slider.dart';
import 'package:english_learning_app/constrants/app_colors.dart';
import 'package:english_learning_app/models/course_model.dart';
import 'package:english_learning_app/models/reminder_model.dart';
import 'package:english_learning_app/services/reminder_service.dart';
import 'package:english_learning_app/view_model/my_course_viewmodel.dart';
import 'package:english_learning_app/views/component/course_card.dart';
import 'package:english_learning_app/views/component/section_header.dart';
import 'package:english_learning_app/views/screens/student/course_detail_screen.dart';
import 'package:english_learning_app/views/widget/dialog/show_join_course_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeStudentScreen extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudentScreen> {

  final TextEditingController _controller = TextEditingController();
  String _searchText = '';

  final ReminderViewModel _viewModel = ReminderViewModel();
  Reminder? _nextReminder;
  @override
  void initState() {
    super.initState();
    _loadAllCourse();
    _loadNextReminder();
  }

  Future<void> _loadNextReminder() async {
    final reminders = await _viewModel.loadReminders();

    if (reminders.isNotEmpty) {
      reminders.sort((a, b) => a.time.compareTo(b.time)); // Sắp xếp theo thời gian
      final now = DateTime.now();
      final upcomingReminders =
      reminders.where((r) => r.time.isAfter(now)).toList();

      setState(() {
        _nextReminder = upcomingReminders.isNotEmpty ? upcomingReminders.first : null;
      });
    }
  }
  void _loadAllCourse() {
    Future.microtask(() =>
        Provider.of<MyCourseViewmodel>(context, listen: false).fetchAllCourses());
  }
  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} ngày ${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }
  final List<String> imgList = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];
  List<CourseModel> courses = CourseModel.getCourses();
  @override
  Widget build(BuildContext context) {
    final courseViewModel = Provider.of<MyCourseViewmodel>(context);

    List<CourseModel> unattendedCourses = courseViewModel.courses
        .where((course) => course.enrollmentStatus == 'NOT_ENROLLED')
        .toList();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(

            decoration: BoxDecoration(
              gradient: AppColors.backgroundMainColor
            ),

            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Thanh tìm kiếm
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: 'Tìm kiếm ...',
                            prefixIcon: Icon(Icons.search),
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(

                            ),
                            fillColor: Colors.white,
                          ),

                          onChanged: (text) {
                            setState(() {
                              _searchText = text;
                            });
                          },
                        ),

                        // Hiển thị kết quả tìm kiếm
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Slider
                  Container(
                    child: CarouselSlider(items: imgList.map((item) => Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                      ),
                    )).toList(),
                        options: CarouselOptions(
                          height: 200.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(

                    children: [

                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Độ lệch bóng
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              'Hoạt động tiếp theo',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: 12.0),

                            Center(
                              child: _nextReminder == null
                                  ? Text(
                                'Không có nhắc nhở nào sắp tới',
                                style: TextStyle(fontSize: 18),
                              )
                                  : Container(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Color(0xFF342771), width: 1.0),
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFF4F4F9),
                                        Color(0xFF342771),
                                      ],
                                      stops: [0.96, 0],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nhắc nhở: ${_nextReminder!.content}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Thời gian: ${_formatDateTime(_nextReminder!.time)}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Nút Luyện tập

                                // Nút Xem thêm
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/reminder').then((_) {
                                      // Khi quay lại màn hình, tải lại dữ liệu
                                      _loadNextReminder();
                                    });
                                  },
                                  icon: Icon(Icons.chevron_right, color: AppColors.brightOrange,),
                                  label: Text('Xem thêm', style: TextStyle(color: AppColors.brightOrange),),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.darkPurpleBlue
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )


                    ],
                  ),

                  SectionHeader("Khóa học thịnh hành"),
                  Container(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.22,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: courses.length,
                          itemBuilder: (context, index){
                            return CourseCard(course: courses[index]);
                          }),
                    ),
                  ),
                  SizedBox(height: 20),
                  SectionHeader("Các khóa học"),
                  Container(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.5,
                      child: ListView.builder(
                        itemCount: unattendedCourses.length,
                        itemBuilder: (context, index) {

                          final course = unattendedCourses[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFF342771).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                  12), // Bo góc cho viền gradient
                            ),
                            child: Card(
                              elevation: 5,
                              shadowColor: Color(0xFF4A4E69),
                              color: AppColors.deepPurpleBlue,
                              margin: EdgeInsets.all(2),
                              // Khoảng cách để hiển thị viền gradient
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Bo góc cho Card bên trong
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                title: Text(
                                  course.courseName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(height: 5),
                                    Text(
                                        'Giới hạn sinh viên: ${course.maxQuantity}',
                                        style: TextStyle(
                                            color:
                                            Colors.white.withOpacity(0.7))),
                                    SizedBox(height: 5),

                                  ],
                                ),
                                trailing: ElevatedButton(
                                  onPressed: () async {
                                    final result = await showDialog(
                                      context: context,
                                      builder: (context) => ShowJoinCourseDialog(course.courseID),
                                    );
                                    if (result != null && result['success'] == true) {
                                      // Thực hiện reload sau khi tham gia
                                      _loadAllCourse();
                                    }
                                  },
                                  child: Text('Tham gia', style: TextStyle(color: AppColors.lightGray, fontSize: 16),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.brightOrange,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      )),
                                ),

                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Hành động khi bấm nút
            Navigator.pushNamed(context, '/chat-ai');
          },
          backgroundColor: AppColors.brightOrange, // Màu nền nút
          child: Icon(Icons.chat, color: Colors.white,), // Icon bên trong nút
        ),
      ),

    );
  }

}


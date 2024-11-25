import 'dart:convert';

import 'package:english_learning_app/constrants/app_constrants.dart';
import 'package:english_learning_app/models/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyCourseViewmodel extends ChangeNotifier {
  List<CourseModel> _courses = [];
  bool _isLoading = false;

  List<CourseModel> get courses => _courses;

  bool get isLoading => _isLoading;

  Future<void> fetchMyCourses() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Lấy token từ SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('access_token');

      if (token == null) {
        throw Exception("Token không tồn tại");
      }
      final response = await http.get(
        Uri.parse("${apiUrl}/user-Courses/me"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${tokenTest}',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
        _courses = jsonData.map((json) => CourseModel.fromJson(json)).toList();
        print(_courses);
      } else {
        print('Lỗi: ${response.statusCode}');
        throw Exception('Lỗi');
      }
    } catch (e) {
      print('Lỗi khi lấy khóa học: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllCourses() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Lấy token từ SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('access_token');

      if (token == null) {
        throw Exception("Token không tồn tại");
      }
      final response = await http.get(
        Uri.parse("${apiUrl}/courses/current-user"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${tokenTest}',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
        _courses = jsonData.map((json) => CourseModel.fromJson(json)).toList();
        print(_courses);
      } else {
        print('Lỗi: ${response.statusCode}');
        throw Exception('Lỗi');
      }
    } catch (e) {
      print('Lỗi khi lấy khóa học: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}

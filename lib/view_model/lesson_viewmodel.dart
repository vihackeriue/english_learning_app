import 'dart:convert';

import 'package:english_learning_app/constrants/app_constrants.dart';
import 'package:english_learning_app/models/lesson_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LessonViewModel extends ChangeNotifier {
  List<LessonModel> _lessons = [];
  bool _isLoading = false;

  List<LessonModel> get lessons => _lessons;

  bool get isLoading => _isLoading;

  Future<void> fetchLessons(int courseID) async {
    _isLoading = true;
    notifyListeners();
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('access_token');

      if (token == null) {
        throw Exception("Token không tồn tại");
      }
      final response = await http.get(
        Uri.parse("${apiUrl}/lessons/user?courseId=$courseID"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${tokenTest}',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            json.decode(utf8.decode(response.bodyBytes));
        _lessons = jsonData.map((json) => LessonModel.fromJson(json)).toList();
      }else {
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

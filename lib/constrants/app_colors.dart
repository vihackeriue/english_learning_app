import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
   // Màu chính (tím đậm)

  static const Color backgroundColor = Color(0xFFEDECF5); // Màu nền
  static const Color  darkBlueBlack = Color(0xFF1A1A2E); // Màu nhấn
  static const Color  deepPurpleBlue = Color(0xFF1F1F39);
  static const Color darkPurpleBlue = Color(0xFF342771); // màu xanh tím đậm
  static const Color darkPurple = Color(0xFF663399); // màu tím đậm
  static const Color lightGray = Color(0xFFF4F4F9); // màu xám nhạt
  static const Color brightPink = Color(0xFFF40076); // màu xám nhạt
  static const Color brightOrange = Color(0xFFF76400); // cam sáng
  // Bạn cũng có thể thêm các màu gradient nếu muốn.
  static const LinearGradient backgroundMainColor = LinearGradient(
    colors: [
      Color(0xFFF40076),
      Color(0xFF342771),
    ],
    stops: [0.1, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
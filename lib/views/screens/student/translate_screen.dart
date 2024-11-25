import 'package:english_learning_app/constrants/app_colors.dart';
import 'package:english_learning_app/view_model/translate_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  @override
  Widget build(BuildContext context) {
    final translateViewModel = Provider.of<TranslateViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundMainColor
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset(
                  'assets/animations/translate_icon.json',
                  // Đảm bảo bạn đã thêm file JSON của Lottie trong thư mục assets
                  height: 200,
                  width: 200,
                  repeat: true, // Lặp lại animation
                  reverse: true,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nhập từ vựng",
                    filled: true,
                    fillColor: AppColors.backgroundColor,



                  ),
                  style: TextStyle(color: AppColors.deepPurpleBlue, fontSize: 18, fontWeight: FontWeight.w500),
                  maxLines: 4,
                  onChanged: (value) =>
                      translateViewModel.updateInputText(value),
                ),
                SizedBox(
                  height: 10,
                ),
                // Language Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.deepPurpleBlue,
                      ),
                      child: DropdownButton<String>(
                        style: TextStyle(color: AppColors.brightOrange),
                        value: translateViewModel.inputLanguage,
                        items: [
                          DropdownMenuItem(value: 'en', child: Text('English')),
                          DropdownMenuItem(
                              value: 'vi', child: Text('Vietnamese')),
                        ],
                        onChanged: (value) {
                          if (value != null)
                            translateViewModel.updateInputLanguage(value);
                        },
                        underline: SizedBox(),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward, // Chọn icon bạn muốn hiển thị
                      color: AppColors.lightGray, // Màu sắc của icon
                      size: 24, // Kích thước của icon
                    ),
                    Container(

                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.deepPurpleBlue,
                      ),
                      child: DropdownButton<String>(
                        value: translateViewModel.outputLanguage,
                        style: TextStyle(color: AppColors.brightOrange),
                        items: [
                          DropdownMenuItem(value: 'en', child: Text('English')),
                          DropdownMenuItem(
                              value: 'vi', child: Text('Vietnamese')),
                        ],
                        onChanged: (value) {
                          if (value != null)
                            translateViewModel.updateOutputLanguage(value);
                        },
                        underline: SizedBox(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: translateViewModel.translate,
                  child: Text(
                    "Dịch",
                    style: TextStyle(color: AppColors.lightGray, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.deepPurpleBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Kết quả...",
                    filled: true,
                    fillColor: AppColors.backgroundColor,
                  ),
                  style: TextStyle(color: AppColors.deepPurpleBlue, fontSize: 18, fontWeight: FontWeight.w500),
                  maxLines: 4,
                  readOnly: true,
                  controller: TextEditingController(
                      text: translateViewModel.outputText),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

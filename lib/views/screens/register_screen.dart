import 'package:english_learning_app/constrants/app_colors.dart';
import 'package:english_learning_app/view_model/register_viewmodel.dart';
import 'package:english_learning_app/views/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  String role = "USER"; // Default role
  late final RegisterViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = RegisterViewModel();
    viewModel.role = role;// Khởi tạo viewModel khi bắt đầu
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.pink, Colors.blue],
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.transparent,
              margin: EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: Lottie.asset(
                      'assets/animations/lesson.json',
                      // Đảm bảo bạn đã thêm file JSON của Lottie trong thư mục assets
                      height: 150,
                      width: 150,
                      repeat: true, // Lặp lại animation
                      reverse: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 15.0, 8.0, 0.0),
                    child: TextField(
                      onChanged: (value) => viewModel.email = value,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        iconColor: Colors.white,
                        hintText: "example@gmail.com",
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 15.0, 8.0, 0.0),
                    child: TextField(
                      onChanged: (value) => viewModel.phone = value,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red),
                        icon: Icon(Icons.phone),
                        iconColor: Colors.white,
                        labelText: "Số điện thoại",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 15.0, 8.0, 0.0),
                    child: TextField(
                      onChanged: (value) => viewModel.fullName = value,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        icon: Icon(Icons.account_circle),
                        iconColor: Colors.white,
                        hintText: "Họ và tên",
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: "Họ và tên",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 5.0, 8.0, 15.0),
                    child: TextField(
                      onChanged: (value) => viewModel.password = value,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        iconColor: Colors.white,
                        labelText: "Mật khẩu",
                        labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 5.0, 8.0, 15.0),
                    child: TextField(
                      onChanged: (value) => viewModel.rePassword = value,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      obscureText: true,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red),
                        icon: Icon(Icons.lock),
                        iconColor: Colors.white,
                        labelText: "Nhập Lại Mật Khẩu",
                        labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      RadioListTile(
                        title: Text("User", style: TextStyle(color: AppColors.lightGray),),
                        value: "USER",
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value.toString();
                            viewModel.role = role; // Update role in viewModel
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Teacher",style: TextStyle(color: AppColors.lightGray),),
                        value: "TEACHER",
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value.toString();
                            viewModel.role = role; // Update role in viewModel
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () => viewModel.register(context), // Register with viewModel
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        child: Text(
                          "ĐĂNG KÝ",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 10),
                    child: Container(
                      padding: EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Đã có tài khoản?",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              ),
                              TextButton(
                                onPressed: OnclickChangeWidget,
                                child: Text(
                                  "ĐĂNG NHẬP",
                                  style: TextStyle(color: Colors.pink),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Quên Mật Khẩu?",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void OnclickChangeWidget() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}

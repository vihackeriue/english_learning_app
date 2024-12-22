import 'package:english_learning_app/constrants/app_colors.dart';
import 'package:english_learning_app/view_model/login_viewmodel.dart';
import 'package:english_learning_app/views/component/button_costom.dart';
import 'package:english_learning_app/views/screens/profile_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  SharedPreferences? prefs;
  String? fullName;


  @override
  void initState() {
    super.initState();
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    prefs = await SharedPreferences.getInstance();
    fullName = prefs?.getString('full_name_user');
  }

  @override
  Widget build(BuildContext context) {
    final String fullName = "Nguyen Van Vi";
    final String email= "Nguyen Van Vi";
    final String phone = "Nguyen Van Vi";
    final LoginViewModel viewModel = LoginViewModel();
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundMainColor
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 50, bottom: 5),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        )
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4), // Độ dày của viền
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2.5, // Độ dày của viền
                            ),
                          ),
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.height*0.06,
                            backgroundImage: AssetImage("assets/images/user.jpg"),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '$fullName',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.deepPurpleBlue
                          ),
                          textAlign: TextAlign.center,
                        ),
          
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
          
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.deepPurpleBlue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [



                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // card premium account
                  ButtonCustom("Thông tin cá nhân", (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileDetailScreen()),
                    );
                  }),
                  SizedBox(height: 10,),
                  ButtonCustom("Cài đặt", (){}),
                  SizedBox(height: 10,),
                  ButtonCustom("Giới thiệu", (){}),
                  SizedBox(height: 10,),
                  ButtonCustom("Đăng Xuất", (){
                    viewModel.logout(context);
                  }),
                  SizedBox(height: 100,),
                ],
              ),
          
            ],
          
          ),
        ),
      ),
    );
  }
}

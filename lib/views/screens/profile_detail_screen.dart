import 'package:english_learning_app/constrants/app_colors.dart';
import 'package:flutter/material.dart';
class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final String fullName = "Nguyen Van Vi";
  final String email= "Nguyenvi@gmail.com";
  final String phone = "075557905450";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Full Name

            Text("Họ Và Tên",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkBlueBlack),),
            SizedBox(height: 10,),
            Container(

              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.deepPurpleBlue
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                '$fullName',
                style: TextStyle(fontSize: 18, color: AppColors.lightGray),
              ),
            ),

            // Email
            Text("Email",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkBlueBlack),),
            SizedBox(height: 10,),
            Container(

              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.deepPurpleBlue
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                '$email',
                style: TextStyle(fontSize: 18, color: AppColors.lightGray),
              ),
            ),

            // Phone
            Text("Số điện thoại",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkBlueBlack),),
            SizedBox(height: 10,),
            Container(

              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.deepPurpleBlue
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                '$phone',
                style: TextStyle(fontSize: 18, color: AppColors.lightGray),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Divider(thickness: 1, color: Colors.black.withOpacity(0.5)),
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text(
                "Thay đổi thông tin",
                style: TextStyle(color: AppColors.brightOrange, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.deepPurpleBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){},
              child: Text(
                "Thay đổi mật khẩu",
                style: TextStyle(color: AppColors.brightOrange, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(
                  color: AppColors.darkBlueBlack, // Màu viền
                  width: 2,            // Độ dày viền
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

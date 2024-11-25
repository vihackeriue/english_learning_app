
import 'package:english_learning_app/views/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}
class _LoginScreenState extends State<RegisterScreen> {

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

              )
          ),
          alignment: Alignment.center,
          child: Container(
            child: Card(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              color: Colors.transparent,
              margin: EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 10),
                    child: Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: FlutterLogo()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 15.0, 8.0, 0.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          iconColor: Colors.white,
                          hintText: "example@gmail.com",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 15.0, 8.0, 0.0),

                    child: TextField(
                      // onChanged: registerViewModel.setPhoneNumber,
                      // controller: _phoneController,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                          // errorText: registerViewModel.errorPhone,
                          errorStyle: TextStyle(color: Colors.red),
                          icon: Icon(Icons.email),
                          iconColor: Colors.white,
                          labelText: "Số điện thoại",
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 5.0, 8.0, 15.0),
                    child: TextField(
                      // onChanged: loginViewModel.setPassword,
                      // controller: _passwordController,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      obscureText: true,
                      decoration: InputDecoration(
                        // errorText: loginViewModel.passwordError,
                          icon: Icon(Icons.lock),
                          iconColor: Colors.white,
                          labelText: "Mật khẩu",
                          labelStyle: TextStyle(color: Colors.white, fontSize: 16)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 5.0, 8.0, 15.0),
                    child: TextField(
                      // controller: _repasswordController,
                      // onChanged: registerViewModel.setRePassword,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      obscureText: true,
                      decoration: InputDecoration(
                        // errorText: registerViewModel.errorRePass,
                          errorStyle: TextStyle(color: Colors.red),
                          icon: Icon(Icons.lock),
                          iconColor: Colors.white,
                          labelText: "Nhập Lại Mật Khẩu",
                          labelStyle: TextStyle(color: Colors.white, fontSize: 16)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: _OnclickButtonRegister,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0))
                            ),
                          ),

                          child: Text("ĐĂNG KÝ", style: TextStyle(fontSize: 16, color: Colors.white),)),
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
                              Text("Đã có tài khoản?", style: TextStyle(fontSize: 12, color: Colors.white),),
                              TextButton(onPressed: OnclickChangeWidget,
                                  child: Text("ĐĂNG NHẬP", style: TextStyle(color: Colors.pink),)

                              )
                            ],
                          ),
                          TextButton(onPressed: null,
                              child: Text("Quên Mật Khẩu?", style: TextStyle(fontSize: 12, color: Colors.red),)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ),

          ),
        )
    );
  }
  void OnclickChangeWidget() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
  _OnclickButtonRegister(){
    setState(() {

    });

  }

}
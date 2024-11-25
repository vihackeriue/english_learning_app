//
//
// import 'package:music_app_project/model/user_model.dart';
// import 'package:music_app_project/reponsitory/user_repository.dart';
//
// class RegisterViewModel {
//
//       final UserRepository repository = UserRepository();
//       UserModel _userModel = UserModel('', '', '', '');
//       String? _errorEmail;
//       String? _errorPhone;
//       String? _errorPassword;
//       String? _errorRePass;
//
//       String? _rePassword;
//
//
//
//       void setRePassword(String value) {
//         _rePassword = value;
//       }
//
//       String? get errorEmail => _errorEmail;
//       String? get errorPhone => _errorPhone;
//       String? get errorPassword => _errorPassword;
//       String? get errorRePass => _errorRePass;
//
//
//
//   bool ValidateFormRegister(){
//         bool isValidate = true;
//         // validate email
//         if (_userModel.email == null || _userModel.email.isEmpty) {
//           _errorEmail = "Vui Lòng Nhập Email";
//           isValidate = false;
//         } else {
//           // check email @gmail.com
//           RegExp regex = RegExp(r"^[a-zA-Z0-9._%+-]+@gmail.com$");
//           if(!regex.hasMatch(_userModel.email)){
//             _errorEmail = "Vui Lòng Nhập Đúng Định Đạng @gmail.com";
//             isValidate = false;
//
//           }else {
//             _errorEmail = null;
//           }
//
//         }
//         // validate password
//         if (_userModel.password == null || _userModel.password.isEmpty) {
//           _errorPassword = "Vui Lòng Nhập Mật Khẩu";
//           isValidate = false;
//         } else {
//           _errorPassword = null;
//         }
//         // validate repassword
//         if(_rePassword == null || _rePassword == '' ){
//
//           _errorRePass = "Vui Lòng Nhập Lại Mật Khẩu";
//           isValidate = false;
//         }else if(_rePassword != _userModel.password){
//           _errorRePass = "Vui Lòng Nhập Lại Đúng Mật Khẩu";
//           isValidate = false;
//         } else _errorRePass = null;
//
//         // validate phone number
//         if(_userModel.phoneNumber == null || _userModel.phoneNumber.isEmpty){
//           _errorPhone = "Vui Lòng Nhập Số điện thoại";
//           isValidate = false;
//         }else _errorPhone = null;
//
//         return isValidate;
//       }
//       Future<bool> Register(UserModel user, Function onSuccess, onRegisterError) async {
//         return repository.Register(user, onSuccess, onRegisterError);
//       }
//       void setEmail(String email) {
//         _userModel.email = email;
//       }
//       void setPassword(String password) {
//         _userModel.password = password;
//       }
//
//       void setPhoneNumber(String phone){
//         _userModel.phoneNumber = phone;
//       }
//
//
//
// }
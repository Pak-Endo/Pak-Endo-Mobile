
import 'package:flutter/material.dart';
import 'package:pak_endo/pages/forget_password.dart';
import 'package:pak_endo/pages/homepage.dart';
import 'package:pak_endo/pages/login_member_id.dart';
import 'package:pak_endo/pages/login_member_password.dart';
import 'package:pak_endo/pages/signup.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Event management App",
      home:memberpasswordloginpage(),
      initialRoute: '/memberidlogin',
      routes: {
        '/memberidlogin':(context) => memberIdloginpage(),
        '/passwordlogin':(context) => memberpasswordloginpage(),
        '/forgetpassword':(context) => ForgetPassword(),
        '/signup':(context) => register(),
        '/home':(context) => homepage()
      },
    );
  }
}
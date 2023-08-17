import 'package:flutter/material.dart';
import 'package:pak_endo/pages/Signin.dart';
import 'package:pak_endo/pages/UserMain.dart';
import 'package:pak_endo/pages/details_page.dart';
import 'package:pak_endo/pages/forget_password.dart';
import 'package:pak_endo/pages/homepage.dart';
import 'package:pak_endo/pages/listevents.dart';
import 'package:pak_endo/pages/login_member_password.dart';
import 'package:pak_endo/pages/register.dart';
import 'package:pak_endo/pages/signup.dart';
import 'package:pak_endo/widgets/FeedbackForm.dart';

class AppRoutes{
  static Map<String, WidgetBuilder> routes={
    '/passwordlogin':(context) =>  memberpasswordloginpage(),
        '/forgetpassword':(context) =>  ForgetPassword(),
        '/signup':(context) =>  register(),
        '/home':(context) =>  homepage(),
        '/signin':(context)=> memberIdSigninpage(),
        '/listevents':(context)=> UpComingEvents(),
        '/detailspage':(context) => DetailsPage(),
        '/feedbackform':(context) => FeedbackForm(),
        '/register':(context) => Register(),
        '/usermain':(context) => UserMain(),
  };
}
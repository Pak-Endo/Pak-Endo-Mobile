import 'package:flutter/material.dart';
import 'package:pak_endo/Model/event.dart';
import 'package:pak_endo/View/pages/AuthPages/Signin.dart';
import 'package:pak_endo/View/pages/AuthPages/SplashScreen.dart';
import 'package:pak_endo/View/pages/UserMain.dart';
import 'package:pak_endo/View/pages/details_page.dart';
import 'package:pak_endo/View/pages/AuthPages/forget_password.dart';
import 'package:pak_endo/View/pages/homepage.dart';
import 'package:pak_endo/View/pages/listevents.dart';
import 'package:pak_endo/View/pages/AuthPages/login_member_password.dart';
import 'package:pak_endo/View/pages/AuthPages/signup.dart';
import 'package:pak_endo/View/pages/widgets/FeedbackForm.dart';

class AppRoutes{
  static Map<String, WidgetBuilder> routes={
    // '/passwordlogin':(context) =>  memberpasswordloginpage(),
        '/forgetpassword':(context) =>  ForgetPassword(),
        '/signup':(context) =>  register(),
        '/home':(context) =>  homepage(),
        '/signin':(context)=> memberIdSigninpage(),
        '/listevents':(context)=> UpComingEvents(),
        '/detailspage': (context, {Event? event}) => DetailsPage(event: event),
        '/feedbackform':(context) => FeedbackForm(),
        '/usermain':(context) => UserMain(),
        '/splashscreen':(context) => SplashScreen(),
  };
}

import 'package:flutter/material.dart';
import 'package:pak_endo/pages/Signin.dart';
import 'package:pak_endo/pages/details_page.dart';
import 'package:pak_endo/pages/forget_password.dart';
import 'package:pak_endo/pages/homepage.dart';
import 'package:pak_endo/pages/login_member_password.dart';
import 'package:pak_endo/pages/register.dart';
import 'package:pak_endo/pages/signup.dart';
import 'package:pak_endo/pages/listevents.dart';
import 'package:pak_endo/widgets/FeedbackForm.dart';
import 'package:pak_endo/widgets/previous_event_card.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Event management App",
      home:homepage(),
      initialRoute: '/signin',
      routes: {
        '/passwordlogin':(context) =>  memberpasswordloginpage(),
        '/forgetpassword':(context) =>  ForgetPassword(),
        '/signup':(context) =>  register(),
        '/home':(context) =>  homepage(),
        '/signin':(context)=> memberIdSigninpage(),
        '/listevents':(context)=> UpComingEvents(),
        '/detailspage':(context) => DetailsPage(),
        '/eventcard2':(context) => PreviousEventCard(),
        '/feedbackform':(context) => FeedbackForm(),
        '/register':(context) => Register()
      },
    );
  }
}
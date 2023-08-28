
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pak_endo/Approutes.dart';

void main(){
  runApp( const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Endo Pak App",
      initialRoute: '/splashscreen',
      routes: AppRoutes.routes,
    );
  }
}
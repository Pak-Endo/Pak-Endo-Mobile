
import 'package:flutter/material.dart';
import 'package:pak_endo/Approutes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Endo Pak App",
      initialRoute: '/signin',
      routes: AppRoutes.routes,
    );
  }
}
import 'package:flutter/material.dart';

import '../Constants/app_colors.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Card(
                margin: EdgeInsets.only(top:30,bottom:30),
                color: Colors.white38,
                child:Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                            height: 30,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: fieldtitle("Forget Password"),
                    ),

                    const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Enter Registered Email where you can get password reset link"),
                          ),
                    
                    const SizedBox(
                            height: 3,
                          ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customfield('Enter Registered Email', _emailcontroller),
                    ),
                    const SizedBox(
                            height: 10,
                          ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: custombutton("Send Link"),
                    )
                  ],
                ))
              ),
            ),
          )
        ],
        ),
    );
  }

  Widget fieldtitle(String title) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(

          title,
          style: const TextStyle(
            fontSize: 30,
            color: Appcolors.appmaincolor,
             fontWeight: FontWeight.bold),
        ));
  }

Widget customfield(String hint, TextEditingController controller) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Icon(Icons.email),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 5),
            child: TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintText: hint,
                ),
                validator: (value) {
                  if (value == null) {
                    return "Please Enter Email";
                  }
                  return null;
                }),
          )),
        ],
      ),
    );
  }

   Widget custombutton(String text) {
    return GestureDetector(
      onTap: () {
       Navigator.pushReplacementNamed(context, "/memberidlogin");
      },
      child: Container(
          // GestureDetector(),
          margin: EdgeInsets.only(bottom: 25),
          height: 50,
          decoration: const BoxDecoration(
              color: Appcolors.appmaincolor,
              borderRadius: BorderRadius.all(Radius.circular(42))),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.2),
            ),
          ),
        
      ),
    );
  }
}
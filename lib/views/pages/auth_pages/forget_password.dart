import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Constants/app_colors.dart';
import '../../../Controllers/PasswordResetController.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _passwordResetController = Get.put(PasswordResetController());
  final _emailcontroller = TextEditingController();

  Future<void> resetpassword() async {
    final email = _emailcontroller.text;
    try {
          final isLinkSent =
              await _passwordResetController.sendResetLink(email);

          if (isLinkSent) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'Password reset link sent successfully',
                style: TextStyle(color: Colors.green),
              ),
              duration: Duration(seconds: 4),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'Sending password reset link failed',
                style: TextStyle(color: Colors.red),
              ),
              duration: Duration(seconds: 3),
            ));
          }
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'An error occurred while sending the password reset link',
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(seconds: 3),
          ));
        }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset(
              "assets/login_background.png",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              // color: Colors.black.withOpacity(0.4),
              // colorBlendMode: BlendMode.colorDodge
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Appcolors.appbluecolor.withOpacity(0.5),
                  Appcolors.appgreencolor.withOpacity(0.5),
                ])),
          ),
          
          Center(
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                          height: 45,
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
                          child: Text("Enter Registered Email where you can get password reset link",style: TextStyle(color: Colors.white),),
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
              )),
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
          style:  TextStyle(
            fontSize: 30,
            color:Colors.white,
            letterSpacing: 3.0,
             fontWeight: FontWeight.bold,
             fontFamily: "BebasNeue"),
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
              child: Icon(Icons.email,
              color: Appcolors.Appbuttoncolor,
              )
              
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
       Navigator.pushReplacementNamed(context, "/signin");
      },
      child: Container(
          // GestureDetector(),
          margin: EdgeInsets.only(bottom: 25),
          height: 50,
          decoration: const BoxDecoration(
              color: Appcolors.Appbuttoncolor,
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
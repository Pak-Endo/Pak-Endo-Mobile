import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:pak_endo/widgets/DropdownWidget.dart';

import '../Constants/app_colors.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
   TextEditingController _membercontroller = TextEditingController();

  String _email = "";
  String _password = "";
  String _name = "";

  @override
  void dispose() {
    // TODO: implement dispose
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  void cleartext() {
    _namecontroller.clear();
    _emailcontroller.clear();
    _passwordcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.black,
            child: Image.asset(
              "assets/login_background.png",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Container(
            color: Colors.black38,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white70,
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.app_registration,
                          size: 80,
                          color: Appcolors.appmaincolor,
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        const Text(
                          "Register Yourself",
                          style: TextStyle(
                              letterSpacing: 2.5,
                              fontSize: 20,
                              color: Color.fromARGB(255, 242, 245, 248),
                              fontFamily: "Lobster-Regular"),
                        ),
      
                        const SizedBox(
                          height: 8,
                        ),
                         MyDropdownWidget(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Form(
                              key: _formkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          fieldtitle(" Enter First Name"),
                                          customfield(
                                              'First name', _namecontroller),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          fieldtitle(" Enter Last Name"),
                                          customfield(
                                              'Last name', _namecontroller),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  fieldtitle(" member_id"),
                                  member_idcustomfield("eg:- PES/E/01", _membercontroller),
                                  const SizedBox(height: 10),
                                  fieldtitle(" Phone Number"),
                                  member_idcustomfield("+9230000000000", _membercontroller),
                                  const SizedBox(height: 10),
                                  fieldtitle(" Enter your email"),
                                  member_idcustomfield("abc@123.com", _membercontroller),
                                  const SizedBox(height: 10),
                                  fieldtitle("   Password"),
                                  passwordfield(
                                      'Enter Password', _passwordcontroller),
                                  fieldtitle("   Confirm Password"),
                                  passwordfield('Enter confirm Password',
                                      _passwordcontroller),
                                  const SizedBox(height: 10),
                                  custombutton("Register"),
                                  // register(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fieldtitle(String title) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }

  Widget customfield(String hint, TextEditingController controller) {
    return Container(
      height: 50,
      width: 160,
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
              child: const Icon(
                Icons.email,
                color: Appcolors.appmaincolor,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 5),
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value == null) {
                  return "Please Fill the Field";
                } else if (controller == _emailcontroller ||
                    !value.contains("@")) {
                  return "Please Enter Valid Email";
                }
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.blueGrey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: hint,
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget member_idcustomfield(String hint, TextEditingController controller) {
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
              child: Icon(
                Icons.email,
                color: Appcolors.appmaincolor,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 5),
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value == null) {
                  return "Please Fill the Field";
                } else if (controller == _emailcontroller ||
                    !value.contains("@")) {
                  return "Please Enter Valid Email";
                }
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.blueGrey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: hint,
              ),
            ),
          )),
        ],
      ),
    );
  }







  Widget passwordfield(String hint, TextEditingController controller) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 10),
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
              child: Icon(
                Icons.password,
                color: Appcolors.appmaincolor,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 5),
            child: TextFormField(
              controller: _passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.blueGrey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: hint,
              ),
              validator: (value) {
                if (value == null) {
                  return "Please Enter Password";
                } else if (value.length < 6) {
                  return "Please Enter Strong Password";
                }
                return null;
              },
            ),
          )),
        ],
      ),
    );
  }

  Widget custombutton(String text) {
    return GestureDetector(
      onTap: () {
        // if (_formkey.currentState!.validate()) {
        setState(() {
          _email = _emailcontroller.text;
          _password = _passwordcontroller.text;
          _name = _namecontroller.text;
        });
        // }

        cleartext();
        Navigator.pushReplacementNamed(context, "/memberidlogin");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
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

  Widget register() {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextButton(
                onPressed: (() {
                  Navigator.pushNamed(context, "/memberidlogin");
                }),
                child: const Text(
                  "Goto login",
                  style: TextStyle(
                      color: Colors.black54,
                      letterSpacing: 1.5,
                      fontFamily: "Lobster-Regular",
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )),
          )
        ],
      ),
    );
  }
}

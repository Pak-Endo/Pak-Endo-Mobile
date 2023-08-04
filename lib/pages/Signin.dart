// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:flutter/material.dart';
import '../Constants/app_colors.dart';

class memberIdSigninpage extends StatefulWidget {
  const memberIdSigninpage({Key? key}) : super(key: key);

  @override
  State<memberIdSigninpage> createState() => _memberIdloginpageState();
}

class _memberIdloginpageState extends State<memberIdSigninpage> {
  final _formkey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  String _email = "";
  String _password = "";

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: ImageIcon(AssetImage(
                      "assets/Logo_Icon.png",
                      ),
                      size: 140,
                      ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          letterSpacing: 3.5,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 242, 245, 248),
                          fontFamily: "BebasNeue"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            fieldtitle("   Member ID"),
                            customfield(
                                'Enter your member_id', _emailcontroller),
                            const SizedBox(height: 50),
                            custombutton("Next"),
                            const SizedBox(
                              height: 35,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: const Text(
                                textAlign: TextAlign.center,
                                "Exclusive access for Endo-Pak members only. Sign in to continue.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            // Expanded(child: Container())
                            // const SizedBox.Expanded,
                            Container(
                              margin: EdgeInsets.only(top: 60, left: 70),
                              child: Row(
                                children: [
                                  const Text(
                                    "Don't have an Account?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context, "/signup");
                                      },
                                      child: const Text(
                                        "Signup",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Appcolors.Appbuttoncolor),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fieldtitle(String title) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              child: Icon(
                Icons.email,
                color: Appcolors.Appbuttoncolor,
              ),
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
        setState(() {
          if (_formkey.currentState?.validate() ?? false) {
            _email = _emailcontroller.text;
            _password = _passwordcontroller.text;
          }
        });
        Navigator.pushReplacementNamed(context, "/passwordlogin");

        // login_method();
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

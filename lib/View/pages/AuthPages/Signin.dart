// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/SharedPreferences.dart';
import '../../../Constants/app_colors.dart';
import '../../../Controllers/memberSigninControllers.dart';

class memberIdSigninpage extends StatefulWidget {
  const memberIdSigninpage({Key? key}) : super(key: key);

  @override
  State<memberIdSigninpage> createState() => _memberIdloginpageState();
}

class _memberIdloginpageState extends State<memberIdSigninpage> {
  final _formkey = GlobalKey<FormState>();
  final _memberidcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _authenticationController = Get.put(AuthenticationController());
  String _memberid="";
  String _password="";


  // final MemberController _memberController = MemberController();


  @override
  void dispose() {
    _memberidcontroller.dispose();
    super.dispose();
  }

  Future<void> signinPass() async {
    try {
             final isVerified = await _authenticationController.verifyCredentials(
              _memberidcontroller.text,
              _passwordcontroller.text,
            );

            if (isVerified) {
              Navigator.pushNamed(context, "/usermain");
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.white,
                content: Text(
                  'Login Successful',
                  style: TextStyle(color: Colors.black),
                ),
                duration: Duration(seconds: 3),
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Incorrect credentials',
                  style: TextStyle(color: Colors.white),
                ),
                duration: Duration(seconds: 4),
              ));
            }
          } catch (error) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'An error occurred while verifying the credentials',
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 4),
            ));
          }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.06),
                    child: ImageIcon(
                      AssetImage(
                        "assets/Logo_Icon.png",
                      ),
                      size: MediaQuery.of(context).size.height * 0.209,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
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
                   SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                    Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                textAlign: TextAlign.center,
                                "Exclusive access for Endo-Pak members only. Sign in to continue.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Poppins-Medium",
                                ),
                              ),
                            ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.002,
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
                                'Enter your member id', _memberidcontroller),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025),
                            fieldtitle("   Password"),
                            passwordfield(
                                'Enter Password', _passwordcontroller),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.038),
                            custombutton("Next"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.02,
                            ),
                          
                            // Expanded(child: Container())
                            // const SizedBox.Expanded,
                            Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.01,
                                  left:
                                      MediaQuery.of(context).size.width * 0.18),
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
                                        Navigator.pushReplacementNamed(
                                            context, "/signup");
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
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.18),
                              child: Row(
                                children: [
                                  const Text(
                                    "Continue without login?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                       Navigator.pushReplacementNamed(
                                            context, "/homepage");
                                      },
                                      child:  Text(
                                        "Click here",
                                        style: TextStyle(
                                          
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Appcolors.Appbuttoncolor),
                                      ))
                                ],
                              ),
                            ),
                            
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
                controller: _memberidcontroller,
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
        Constants.prefs?.setBool("Loggedin", true);
        setState(() {
          if (_formkey.currentState?.validate() ?? false) {
            _memberid = _memberidcontroller.text;
            _password=_passwordcontroller.text;
          }
        });
        signinPass();
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
                color: Appcolors.Appbuttoncolor,
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
                } 
                return null;
              },
            ),
          )),
        ],
      ),
    );
  }
}

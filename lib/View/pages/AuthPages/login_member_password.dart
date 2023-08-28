// // ignore_for_file: camel_case_types


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// import '../../../Constants/SharedPreferences.dart';
// import '../../../Constants/app_colors.dart';
// import '../../../Controllers/memberSigninControllers.dart';

// class memberpasswordloginpage extends StatefulWidget {
//   final String memberID;
//   const memberpasswordloginpage({Key? key, required this.memberID}) : super(key: key);

//   @override
//   State<memberpasswordloginpage> createState() => _memberpasswordloginpageState();
// }

// class _memberpasswordloginpageState extends State<memberpasswordloginpage> {
//   final _authenticationController = Get.put(AuthenticationController());
//   final _formkey = GlobalKey<FormState>();
//   final _passwordcontroller = TextEditingController();

//   String _password = "";
//   @override
//   void dispose() {
//     _passwordcontroller.dispose();
//     super.dispose();
//   }
//   Future<void> signinPass() async {
//     try {
//              final isVerified = await _authenticationController.verifyCredentials(
//               widget.memberID,
//               _password,
//             );

//             if (isVerified) {
//               Navigator.pushNamed(context, "/usermain");
//               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                 backgroundColor: Colors.white,
//                 content: Text(
//                   'Login Successful',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 duration: Duration(seconds: 3),
//               ));
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                 backgroundColor: Colors.red,
//                 content: Text(
//                   'Incorrect credentials',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 duration: Duration(seconds: 4),
//               ));
//             }
//           } catch (error) {
//             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               backgroundColor: Colors.red,
//               content: Text(
//                 'An error occurred while verifying the credentials',
//                 style: TextStyle(color: Colors.white),
//               ),
//               duration: Duration(seconds: 4),
//             ));
//           }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Container(
//             child: Image.asset(
//               "assets/login_background.png",
//               fit: BoxFit.fill,
//               height: double.infinity,
//               width: double.infinity,
//               alignment: Alignment.center,
//               // color: Colors.black.withOpacity(0.4),
//               // colorBlendMode: BlendMode.colorDodge
//             ),
//           ),
//           Container(
//             color: Colors.black.withOpacity(0.6),
//           ),
//           Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                   Appcolors.appbluecolor.withOpacity(0.5),
//                   Appcolors.appgreencolor.withOpacity(0.5),
//                 ])),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child:Container(
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Container(
//                     margin: EdgeInsets.only(top: 100),
//                     child: const ImageIcon(AssetImage(
//                       "assets/Logo_Icon.png",
//                       ),
//                       size: 140,
//                       ),
//                   ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text(
//                         "Login",
//                         style: TextStyle(
//                             letterSpacing: 2.5,
//                             fontSize: 40,
//                             color: Color.fromARGB(255, 242, 245, 248),),
//                       ),

//                       const SizedBox(
//                         height: 10,
//                       ),

//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Container(
//                           alignment: Alignment.centerLeft,
//                           child: Form(
//                             key: _formkey,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 fieldtitle("   Password"),
//                                 customfield(
//                                     'Enter your password', _passwordcontroller),
//                                 const SizedBox(height: 5),
//                                 Container(
//                                   margin: EdgeInsets.only(bottom: 35),
//                                   alignment: Alignment.bottomRight,
//                                   child: TextButton(
//                                     onPressed: () {
//                                       Navigator.pushNamed(
//                                           context, "/forgetpassword");
//                                     },
//                                     child: const Text(
//                                       "Forget password?",
//                                       style:
//                                           TextStyle(color:Appcolors.Appbuttoncolor),
//                                     ),
//                                   ),
//                                 ),
//                                 custombutton("Submit"),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }


//   Widget fieldtitle(String title) {
//     return Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         child: Text(
//           title,
//           style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ));
//   }


//   Widget customfield(String hint, TextEditingController controller) {
//     return Container(
//       height: 50,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 20,
//             offset: Offset(2, 2),
//           )
//         ],
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: Icon(Icons.email,color: Appcolors.Appbuttoncolor,),
//             ),
//           ),
//           Expanded(
//               child: Padding(
//             padding: const EdgeInsets.only(bottom: 3, left: 5),
//             child: TextFormField(
//                 controller: _passwordcontroller,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.blueGrey),
//                   contentPadding: EdgeInsets.symmetric(vertical: 10),
//                   hintText: hint,
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return "Please Enter Email";
//                   }
//                   return null;
//                 }),
//           )),
//         ],
//       ),
//     );
//   }


//   Widget custombutton(String text) {
//     return GestureDetector(
//       onTap: () {
//         Constants.prefs?.setBool("Loggedin", true);
//         setState(() {
//           if (_formkey.currentState?.validate() ?? false) {
//             _password = _passwordcontroller.text;
//           }
//         });
//         Navigator.pushNamed( context, "/usermain");
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//             'login Successful',
//             style: TextStyle(color:Appcolors.appgreencolor,),
//           ),
//           duration: Duration(seconds: 3),
//         ));

//         // login_method();
//       },
//       child: Container(
//         // GestureDetector(),
//         margin: const EdgeInsets.only(bottom: 25),
//         height: 50,
//         decoration: const BoxDecoration(
//             color: Appcolors.Appbuttoncolor,
//             borderRadius: BorderRadius.all(Radius.circular(42))),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 letterSpacing: 2.2),
//           ),
//         ),
//       ),
//     );
//   }
// }
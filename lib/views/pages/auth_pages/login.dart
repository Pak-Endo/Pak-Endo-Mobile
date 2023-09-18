import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/constants/app_colors.dart';
import 'package:pak_endo/controllers/auth_controller.dart';
import 'package:pak_endo/routes/navigations.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _formKey = GlobalKey<FormState>();
  String memberId = '';
  String password = '';

  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(fit: StackFit.expand, children: [
            getBackground(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getHeader(),
                      Form(
                          key: _formKey,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// EMAIL ADDRESS
                                fieldtitle("Member ID or Email"),
                                customfield(
                                    'Enter your member id or Email address'),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025),

                                ///PASSWORD
                                fieldtitle("Password"),
                                passwordfield('Enter Password'),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.038),

                                ///BUTTON
                                customButton("Next"),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.001),

                                /// BOTTOM TEXT ACTIONS
                                textActions(),
                              ]))
                    ]))
          ]),
        ));
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

  Widget customfield(hint) {
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.email,
              color: Appcolors.Appbuttoncolor,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 5),
            child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: hint,
                ),
                onSaved: (e) => memberId = e!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Email";
                  }
                  return null;
                }),
          )),
        ],
      ),
    );
  }

  customButton(String text) {
    return GestureDetector(
        onTap: loginBtn,
        child: Center(
            child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                height: 50,
                width: MediaQuery.of(Get.context!).size.width / 2,
                decoration: const BoxDecoration(
                    color: Appcolors.Appbuttoncolor,
                    borderRadius: BorderRadius.all(Radius.circular(42))),
                child: Center(
                    child: Text(text,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.2))))));
  }

  Widget passwordfield(hint) {
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
              child: const Icon(
                Icons.password,
                color: Appcolors.Appbuttoncolor,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 5),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.blueGrey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: hint,
              ),
              onSaved: (e) => password = e!,
              validator: (value) {
                if (value == null || value.isEmpty) {
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

  getBackground() {
    return Stack(
      children: [
        Image.asset(
          "assets/login_background.png",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          // color: Colors.black.withOpacity(0.4),
          // colorBlendMode: BlendMode.colorDodge
        ),
        Container(color: Colors.black.withOpacity(0.6)),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Appcolors.appbluecolor.withOpacity(0.5),
                Appcolors.appgreencolor.withOpacity(0.5)
              ])),
        ),
      ],
    );
  }

  getHeader() {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(Get.context!).size.height * 0.06),
          child: ImageIcon(const AssetImage("assets/Logo_Icon.png"),
              size: MediaQuery.of(Get.context!).size.height * 0.19)),
      SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.01),
      const Text("Login",
          style: TextStyle(
              letterSpacing: 3.5,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 242, 245, 248),
              fontFamily: "BebasNeue")),
      SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.01),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            textAlign: TextAlign.center,
            "Exclusive access for Endo-Pak members only. Sign in to continue.",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Poppins-Medium")),
      ),
      SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.039)
    ]);
  }

  loginBtn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final isVerified = await _authController.login(memberId, password);

      if (isVerified) {
        navigatorKey.currentState!.pushNamed(PageRoutes.landing);
      }
    }
  }

  textActions() {
    return Column(
      children: [
        Center(
          child: TextButton(
              onPressed: () =>
                  navigatorKey.currentState!.pushNamed(PageRoutes.signup),
              child: RichText(
                  text: const TextSpan(
                      text: 'Don\'t have an Account?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      children: <TextSpan>[
                    TextSpan(
                        text: ' Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Appcolors.Appbuttoncolor))
                  ]))),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
                onPressed: () => navigatorKey.currentState!
                    .pushReplacementNamed(PageRoutes.home),
                child: const Text("Click here to continue without login",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Appcolors.Appbuttoncolor))))
      ],
    );
  }
}

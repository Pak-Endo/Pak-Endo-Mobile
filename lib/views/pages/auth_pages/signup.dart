import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/controllers/auth_controller.dart';
import 'package:pak_endo/model/profile_model.dart';
import 'package:pak_endo/routes/navigations.dart';
import 'package:pak_endo/views/widgets/CustomWidgets/dropdown_widget.dart';

import '../../../constants/app_colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool value = false;
  final AuthController controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  String selectedValue = "Prof Dr.";
  String gender = 'Male';

  String _email = "";
  String _password = "";
  String _qualification = "";
  String _firstname = "";
  String _lastname = "";
  String _phoneNo = "";
  String prefix = "";
  String _city = "";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      getBackground(),
      SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            getHeaders(),
            Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// DROPDOWN
                      fieldTitle("Choose one"),
                      getPrefix(),
                      const SizedBox(height: 15),

                      /// FIRST AND LAST NAME
                      getName(),
                      const SizedBox(height: 15),

                      /// GENDER
                      getGender(),
                      const SizedBox(height: 10),

                      /// PHONE NO.
                      customField(
                          Icons.phone_android,
                          'Phone Number (Optional)',
                          '+92 300 0000000',
                          (val) => _phoneNo = val),
                      const SizedBox(height: 10),

                      /// EMAIL
                      customField(Icons.email, 'Enter your email',
                          'abc@123.com', (val) => _email = val),
                      const SizedBox(height: 10),

                      ///PASSWORD
                      customField(Icons.password, 'Password', 'Enter Password',
                          (val) => _password = val, true),
                      const SizedBox(height: 10),

                      ///QUALIFICATION
                      customField(
                          Icons.library_books,
                          'Qualification (Optional)',
                          'Enter Qualification',
                          (val) => _qualification = val),
                      const SizedBox(height: 10),

                      ///CITY
                      customField(Icons.location_city, 'City',
                          'Enter City name', (val) => _city = val),
                      const SizedBox(height: 20),

                      ///BUTTON
                      customButton("Register")
                    ]))
          ]))
    ]));
  }

  Widget fieldTitle(String title) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)));
  }

  Widget customField(IconData icon, String title, String hint, onSave,
      [bool? isPassword]) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      fieldTitle(title),
      Container(
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 20, offset: Offset(2, 2))
              ]),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: Appcolors.Appbuttoncolor),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 3, left: 5),
                    child: TextFormField(
                        obscureText: isPassword == null ? false : true,
                        validator: (value) {
                          if (title == 'Phone Number (Optional)' ||
                              title == 'Qualification (Optional)') {
                            return null;
                          }
                          if (value == null || value.isEmpty) {
                            return "Please Fill the Field";
                          }
                          return null;
                        },
                        onSaved: onSave,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: const TextStyle(color: Colors.blueGrey),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            hintText: hint))))
          ]))
    ]);
  }

  Widget customButton(String text) {
    return GestureDetector(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();
          bool isRegistered = await controller.signup(ProfileModel(
              firstName: _firstname,
              lastName: _lastname,
              password: _password,
              email: _email,
              prefix: selectedValue,
              phoneNumber: _phoneNo,
              gender: controller.selectedGender.value,
              city: _city));

          if (isRegistered) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                    'Your account is in review for approval please wait for confirmation',
                    style: TextStyle(color: Colors.green)),
                duration: Duration(seconds: 3)));
            navigatorKey.currentState!.pop();
          }
        }
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 25, top: 5),
          height: 50,
          width: 180,
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
      ),
    );
  }

  getBackground() {
    return Stack(children: [
      Image.asset("assets/login_background.png",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center),
      Container(color: Colors.black.withOpacity(0.6)),
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
            Appcolors.appbluecolor.withOpacity(0.5),
            Appcolors.appgreencolor.withOpacity(0.5)
          ]))),
    ]);
  }

  getHeaders() {
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 35),
          child:
              const ImageIcon(AssetImage("assets/Logo_Icon.png"), size: 130)),
      const SizedBox(height: 15),
      const Text("Register Yourself",
          style: TextStyle(
              letterSpacing: 2.8,
              fontSize: 25,
              color: Color.fromARGB(255, 242, 245, 248),
              fontFamily: "BebasNeue")),
      const SizedBox(height: 15)
    ]);
  }

  getPrefix() {
    return MyDropdownWidget(
        onValueChanged: (newValue) => selectedValue = newValue);
  }

  getName() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Flexible(
          child: customField(
              Icons.person, 'First Name', 'John', (val) => _firstname = val)),
      const SizedBox(width: 15),
      Flexible(
          child: customField(
              Icons.person, 'Last Name', 'Doe.', (val) => _lastname = val))
    ]);
  }

  getGender() {
    return Obx(() {
      final selectedGender = controller.selectedGender.value;
      return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Gender",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Container(
                margin: const EdgeInsets.only(left: 15),
                child: Checkbox(
                    activeColor: Appcolors.appbluecolor,
                    value: selectedGender == 'Male',
                    onChanged: (value) =>
                        controller.selectedGender.value = 'Male')),
            const Text("Male",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: Checkbox(
                    activeColor: Appcolors.appbluecolor,
                    value: selectedGender == 'Female',
                    onChanged: (value) =>
                        controller.selectedGender.value = 'Female')),
            const Text("Female",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold))
          ]);
    });
  }
}

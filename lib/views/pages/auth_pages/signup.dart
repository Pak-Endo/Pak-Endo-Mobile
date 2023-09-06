import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_endo/views/widgets/CustomWidgets/dropdown_widget.dart';

import '../../../Constants/app_colors.dart';
import '../../../Controllers/MemberRegistrationController.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool value = false;
  final _registrationController = Get.put(RegistrationController());
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _firstnamecontroller = TextEditingController();
  TextEditingController _phonenumbercontroller = TextEditingController();
  TextEditingController _lastnamecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();
  TextEditingController _citycontroller = TextEditingController();

  String _email = "";
  String _password = "";
  String _confirmpassword = "";
  String _firstname = "";
  String _lastname = "";
  String _phonenumber = "";
  String prefix = "";
  bool myvalue = false;
  bool malecheckbox = false;
  bool femalecheckbox = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _firstnamecontroller.dispose();
    _lastnamecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    _citycontroller.dispose();
    super.dispose();
  }

  void cleartext() {
    _firstnamecontroller.clear();
    _lastnamecontroller.clear();
    _emailcontroller.clear();
    _passwordcontroller.clear();
    _confirmpasswordcontroller.clear();
    _citycontroller.clear();
  }

  String checkboxselection() {
    if (malecheckbox) {
      return "Mr";
    } else if (femalecheckbox) {
      return "Mrs";
    } else {
      return "Not Selected";
    }
  }

  String selectedValue = "Prof Dr.";
  void onDropdownValueChanged(String newValue) {
    // Update the selected value whenever the dropdown value changes
    selectedValue = newValue;
    print("Selected Value: $selectedValue");
  }

  Future<void> registermember() async {
    try {
      final isRegistered = await _registrationController.registerUser(
        firstName: _firstnamecontroller.text,
        lastName: _lastnamecontroller.text,
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
        phoneNumber: _phonenumbercontroller.text,
        gender: checkboxselection(),
        city: _citycontroller.text,
        selectedValue: selectedValue,
      );

      if (isRegistered) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'User registered successfully',
            style: TextStyle(color: Colors.green),
          ),
          duration: Duration(seconds: 3),
        ));
        cleartext();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'User registration failed',
            style: TextStyle(color: Colors.red),
          ),
          duration: Duration(seconds: 4),
        ));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'An error occurred while registering the user',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 4),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        child: const ImageIcon(
                          AssetImage(
                            "assets/Logo_Icon.png",
                          ),
                          size: 130,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Register Yourself",
                        style: TextStyle(
                            letterSpacing: 2.8,
                            fontSize: 25,
                            color: Color.fromARGB(255, 242, 245, 248),
                            fontFamily: "BebasNeue"),
                      ),
                      const SizedBox(
                        height: 15,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        fieldtitle(" Choose one"),
                                        MyDropdownWidget(
                                          onValueChanged:
                                              onDropdownValueChanged,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.035,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        fieldtitle(" First Name"),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: customfield('First name',
                                              _firstnamecontroller),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                fieldtitle(" Last Name"),
                                member_idcustomfield(
                                    "Enter Last Name", _lastnamecontroller),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Gender",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Checkbox(
                                          value: malecheckbox,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              malecheckbox = value ?? false;
                                              femalecheckbox = !malecheckbox;
                                            });
                                          },
                                        ),
                                      ),
                                      const Text(
                                        "Male",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Checkbox(
                                          value: femalecheckbox,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              femalecheckbox = value ?? false;
                                              malecheckbox = !femalecheckbox;
                                            });
                                          },
                                        ),
                                      ),
                                      const Text(
                                        "Female",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                fieldtitle(" Phone Number (Optional)"),
                                member_idcustomfield(
                                    "+92 300 0000000", _phonenumbercontroller),
                                const SizedBox(height: 10),
                                fieldtitle(" Enter your email"),
                                member_idcustomfield(
                                    "abc@123.com", _emailcontroller),
                                const SizedBox(height: 10),
                                fieldtitle("   Password"),
                                passwordfield(
                                    'Enter Password', _passwordcontroller),
                                    const SizedBox(height: 10),
                                fieldtitle("   Confirm Password"),
                                passwordfield('Enter confirm Password',
                                    _confirmpasswordcontroller),
                                const SizedBox(height: 10),
                                fieldtitle("  City"),
                                member_idcustomfield(
                                    "Enter City name", _citycontroller),
                                const SizedBox(height: 20),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.065),
                                  child: custombutton("Register"),
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
      height: MediaQuery.of(context).size.height * 0.07,
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
                color: Appcolors.Appbuttoncolor,
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
                color: Appcolors.Appbuttoncolor,
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
          _firstname = _firstnamecontroller.text;
          _lastname = _lastnamecontroller.text;
          _confirmpassword = _confirmpasswordcontroller.text;
          _phonenumber = _phonenumbercontroller.text;
        });
        // }

        cleartext();
        Navigator.pushReplacementNamed(context, "/signin");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 25, top: 5, left: 40),
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
    );
  }
}

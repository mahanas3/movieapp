import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_textfield.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();

    final emailcontroller1 = TextEditingController();

    final passwordcontroller1 = TextEditingController();

    final confirmpassword = TextEditingController();

    final contactcontroller = TextEditingController();

    var _formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'popins2'),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    'Please fill the input below here',
                    style:
                        TextStyle(fontFamily: 'popins2', color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  text1: 'Full Name',
                  text2: 'Name',
                  icon1: const Icon(Icons.contacts_outlined),
                  controller: namecontroller,
                  validator: (value) {
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    );
                    if (value!.isEmpty) return 'Enter valid name';
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  text1: 'Your No',
                  text2: 'Phone no',
                  icon1: const Icon(Icons.phone_android),
                  controller: contactcontroller,
                  validator: (value) {
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9]"));
                    if (!value!.isNotEmpty) return 'Enter valid phone';
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  text1: 'Your Email',
                  text2: 'Email',
                  icon1: const Icon(Icons.email_outlined),
                  controller: emailcontroller1,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)) {
                      return 'Enter valid Email!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  text1: 'Your password',
                  text2: 'password',
                  icon1: const Icon(Icons.lock_open),
                  controller: passwordcontroller1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid password!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  text1: 'Confirm your password',
                  text2: 'password',
                  icon1: const Icon(Icons.lock_open),
                  controller: confirmpassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid password!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 55,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: const Color(0xff4361EE)),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          context.read<FirebaseProvider>().signUpProvider(
                              emailcontroller1.text,
                              passwordcontroller1.text,
                              context);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('islogedIn', true);
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'popins2'),
                      )),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40, left: 30),
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                            fontFamily: 'popins2', color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signintext');
                          },
                          child: const Text(
                            'SignIn',
                            style: TextStyle(
                                color: Color(0xff4361EE),
                                fontFamily: 'popins2'),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

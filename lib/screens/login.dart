import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:movieapp/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_textfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();

    final passwordcontroller = TextEditingController();

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
                  padding: EdgeInsets.only(top: 100, left: 30),
                  child: Image(image: AssetImage('assets/images/login.png')),
                ),
                 Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.heightCalc(context, 30),
                        fontFamily: 'popins2'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text(
                    'Please Sign in to continue',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'popins2'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  text1: 'Enter your Email',
                  text2: 'Email',
                  icon1: const Icon(Icons.email_outlined),
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.endsWith('@gmail.com')) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  text1: 'Enter your password',
                  text2: 'password',
                  icon1: const Icon(Icons.lock_open),
                  controller: passwordcontroller,
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
                SizedBox(
                  height: Dimensions.heightCalc(context, 55),
                  width: Dimensions.widthCalc(context, 200),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: const Color(0xff4361EE)),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          context.read<FirebaseProvider>().loginProvider(
                              emailcontroller.text,
                              passwordcontroller.text,
                              context);
                        }
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('islogedIn', true);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'popins2'),
                      )),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40, left: 45),
                      child: Text(
                        'Dont have an account?',
                        style: TextStyle(
                            fontFamily: 'popins2', color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signuptext');
                          },
                          child: const Text(
                            'SignUp',
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

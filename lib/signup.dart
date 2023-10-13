import 'package:flutter/material.dart';
import 'package:movieapp/screens/custom_textfiled.dart';
import 'package:movieapp/screens/login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();

    final emailcontroller1 = TextEditingController();

    final passwordcontroller1 = TextEditingController();

    final confirmpassword = TextEditingController();

    final contactcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 60),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Please fill the input below here',
                  style: TextStyle(fontFamily: 'popins2', color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                  text1: 'Full Name',
                  text2: 'Name',
                  icon1: const Icon(Icons.contacts_outlined),
                  controller: namecontroller),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  text1: 'Your No',
                  text2: 'Phone no',
                  icon1: const Icon(Icons.phone_android),
                  controller: contactcontroller),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  text1: 'Your Email',
                  text2: 'Email',
                  icon1: const Icon(Icons.email_outlined),
                  controller: emailcontroller1),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  text1: 'Your password',
                  text2: 'password',
                  icon1: const Icon(Icons.lock_open),
                  controller: passwordcontroller1),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  text1: 'Confirm your password',
                  text2: 'password',
                  icon1: const Icon(Icons.email_outlined),
                  controller: emailcontroller1),
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
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'popins2'),
                    )),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 40, left: 25),
                    child: Text(
                      'Already have an account?',
                      style:
                          TextStyle(fontFamily: 'popins2', color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text(
                          'SignIn',
                          style: TextStyle(
                              color: Color(0xff4361EE), fontFamily: 'popins2'),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

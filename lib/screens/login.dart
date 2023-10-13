import 'package:flutter/material.dart';
import 'package:movieapp/screens/custom_textfiled.dart';
import 'package:movieapp/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();

    final passwordcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100, left: 60),
                child: Image(image: AssetImage('assets/images/login.png')),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 150),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text(
                  'Please Sign in to continue',
                  style: TextStyle(color: Colors.white, fontFamily: 'popins2'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  text1: 'Enter your Email',
                  text2: 'Email',
                  icon1: const Icon(Icons.email_outlined),
                  controller: emailcontroller),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  text1: 'Enter your password',
                  text2: 'password',
                  icon1: const Icon(Icons.lock_open),
                  controller: passwordcontroller),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 55,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: const Color(0xff4361EE)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()));
                    },
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'popins2'),
                    )),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 40, left: 25),
                    child: Text(
                      'Dont have an account?',
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
                          'SignUp',
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/auth/forgot_password_screen.dart';
import 'package:test2/auth/sign_up_screen.dart';
import 'package:test2/home_screen.dart';
import 'package:test2/ui_helper.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  login(String email, String password) async {
    if (email == null && password == null) {
      return UiHelper.customAlertBox(context, "Enter Required Field");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePageScreen(),
                )));
      } on FirebaseAuthException catch (e) {
        return UiHelper.customAlertBox(context, e.code.toString());
      }
    }
  }

  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customTextFormField(
                emailTEController, "Enter Email", Icons.mail, false),
            UiHelper.customTextFormField(
                passwordTEController, "Enter Password", Icons.password, true),
            UiHelper.customButton(() {
              login(emailTEController.text.trim(), passwordTEController.text);
            }, "Login"),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Haven't Account?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.blueAccent),
                    ))
              ],
            ),
            TextButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage(),));
                },
                child: const Text("Forgot Password"))
          ],
        ),
      ),
    );
  }
}

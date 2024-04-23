import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test2/auth/login_screen.dart';
import 'package:test2/home_screen.dart';
import 'package:test2/ui_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  signUp(String email, String password) async {
    if (email == null && password == null) {
      UiHelper.customAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailTEController.text.trim(),
                password: passwordTEController.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageScreen(),));
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
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Sing Up",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customTextFormField(
                emailTEController, "Enter email", Icons.email, false),
            UiHelper.customTextFormField(
                passwordTEController, "Enter Password", Icons.password, true),
            UiHelper.customButton(() {
              signUp(emailTEController.text.trim(), passwordTEController.text);
            }, "Sign Up"),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account??",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreenPage(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      "LogIn ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

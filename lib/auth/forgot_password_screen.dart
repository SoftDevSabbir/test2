import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test2/ui_helper.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailTEController = TextEditingController();
  forgotPassword(String email) async {
    if (email == null) {
      return UiHelper.customAlertBox(context, "Enter Your Valid Email");
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reset password",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customTextFormField(emailTEController, "Enter Your Email",
                Icons.email_outlined, false),
            const SizedBox(height: 25),
            UiHelper.customButton(() {
              forgotPassword(emailTEController.text.trim().toString());
            }, "Next")
          ],
        ),
      ),
    );
  }
}

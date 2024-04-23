import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/auth/login_screen.dart';

import 'home_screen.dart';

class CheakUser extends StatefulWidget {
  const CheakUser({super.key});

  @override
  State<CheakUser> createState() => _CheakUserState();
}

class _CheakUserState extends State<CheakUser> {
  @override
  Widget build(BuildContext context) {
    return cheakuser();
  }
 cheakuser(){
    final user=  FirebaseAuth.instance.currentUser;
    if(user!=null){
      print("User Loged in");
      return const HomePageScreen();

    }else{
      print("User was Log Out");
      return const LoginScreenPage();
    }
 }
}

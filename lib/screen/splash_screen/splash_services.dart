import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxapp/screen/auth/login_screen.dart';
import 'package:maxapp/screen/home_screen/home_screen.dart';
class Splashservices{
  void isLogin(BuildContext context){
    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user!=null){
      Timer(const Duration(seconds: 6), () {
        //Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
      });

    }else{
      Timer(const Duration(seconds: 6), () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));
      });
    }

  }
}
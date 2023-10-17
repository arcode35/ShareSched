import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:myapp/main.dart';
import 'package:myapp/pages/register.dart';
=======
import 'package:myapp/pages/login.dart';
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
//import 'package:myapp/pages/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    return  const LoginScreen();
  }
}
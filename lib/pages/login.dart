import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_widgets.dart';
import 'home.dart';
import 'register.dart';
import 'home.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Log In',
            style: GoogleFonts.exo(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 50),
        const Form(
          child: Column(
            children: [
              EmailField(),
              SizedBox(height: 30),
              PasswordField(),
              SizedBox(height: 10),
              CreateAccountButton(),
              SizedBox(height: 10),
              LoginButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email / User",
          hintText: 'Enter email / user',
          hintStyle: GoogleFonts.montserrat(),
          labelStyle: GoogleFonts.montserrat(),
          prefixIcon: const Icon(Icons.person),
          border: const OutlineInputBorder(),
        ),
        onChanged: (String Value) {},
        validator: (value) {
          return value!.isEmpty ? 'Please Enter Email' : null;
        },
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: 'Enter password',
          hintStyle: GoogleFonts.montserrat(),
          labelStyle: GoogleFonts.montserrat(),
          prefixIcon: const Icon(Icons.password),
          border: const OutlineInputBorder(),
        ),
        onChanged: (String Value) {},
        validator: (value) {
          return value!.isEmpty ? 'Please Enter Password' : null;
        },
      ),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterScreen()),
          );
        },
        child: Text('Create an account', style: GoogleFonts.montserrat()),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        color: Colors.black,
        textColor: Colors.white,
        child: Text(
          'Log In',
          style: GoogleFonts.exo(fontSize: 20, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

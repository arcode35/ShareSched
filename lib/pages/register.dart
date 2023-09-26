import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Register',
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
              ConfirmPasswordField(),
              SizedBox(height: 10),
              SignUpButton(),
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
          labelText: "Email",
          hintText: 'Enter email',
          hintStyle: GoogleFonts.montserrat(),
          labelStyle: GoogleFonts.montserrat(),
          prefixIcon: const Icon(Icons.email),
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

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: 'Confirm password',
          hintStyle: GoogleFonts.montserrat(),
          labelStyle: GoogleFonts.montserrat(),
          prefixIcon: const Icon(Icons.password),
          border: const OutlineInputBorder(),
        ),
        onChanged: (String Value) {},
        validator: (value) {
          return value!.isEmpty ? 'Please Confirm Password' : null;
        },
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {},
        color: Colors.black,
        textColor: Colors.white,
        child: Text('Sign Up',
            style: GoogleFonts.exo(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}

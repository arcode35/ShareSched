import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:myapp/services/auth.dart';
import 'custom_widgets.dart';

class RegisterScreen extends StatelessWidget {

  // String email = '';
  // String password = '';
=======

import 'package:myapp/models/user.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/repositories/user_respository.dart';
import 'package:myapp/services/auth.dart';
import 'custom_widgets.dart';

import 'package:myapp/pages/upload_schedule.dart';
import 'login.dart';
import 'custom_widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background
          const BackgroundWidget(),
          SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                // Logo
                const LogoWidget(
                  height: 300,
                  width: 300,
                  logoText: "",
                  alignment: Alignment.topCenter,
                ),
                // Registration Form
                Center(
                  child: RegisterForm(),
                ),
                const SizedBox(height: 20),
                TextField(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

<<<<<<< HEAD
// class RegisterForm extends StatelessWidget {
//   const RegisterForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text('Register',
//             style: GoogleFonts.exo(
//               fontSize: 35,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             )),
//         const SizedBox(height: 50),
//         const Form(
//           child: Column(
//             children: [
//               EmailField(),
//               SizedBox(height: 30),
//               PasswordField(),
//               SizedBox(height: 10),
//               ConfirmPasswordField(),
//               SizedBox(height: 10),
//               SignUpButton(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //final AuthService _auth = AuthService();
  String email = '';
  String password = '';
=======
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9

class TextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Already have an account? ",
        style: GoogleFonts.quicksand(fontSize: 16, color: Colors.white),
        children: [
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Text(
                'Log in',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void onSignUpButtonPressed() async{
    final AuthService _auth = AuthService();
    // save registration details to database here?
    String email = emailController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
    print("Email: $email");
    print("Username: $username");
    print("Password: $password");
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Sign Up',
            style: GoogleFonts.quicksand(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
<<<<<<< HEAD
        const SizedBox(height: 50),
        Form(
          child: Column(
            children: [
              EmailField(
                onChanged: (String newValue) {
                  setState(() {
                    email = newValue;
                  });
                },
              ),
              SizedBox(height: 30),
              PasswordField(
                onChanged: (String newValue) {
                  setState(() {
                    password = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              ConfirmPasswordField(
                onChanged: (String newValue) {
                  // You can handle the confirmation password value here if needed
                },
              ),
              SizedBox(height: 10),
              SignUpButton(
                email: email,
                password: password,
              ),
=======

        const SizedBox(height: 20),
        Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              EmailField(
                controller: emailController,
              ),
              const SizedBox(height: 20),
              UsernameField(controller: usernameController),
              const SizedBox(height: 20),
              PasswordField(controller: passwordController),
              const SizedBox(height: 20),
              SignUpButton(buttonPressed: onSignUpButtonPressed),
              const SizedBox(height: 20),
              const AuthButtons(),
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
            ],
          ),
        ),
      ],
    );
  }
}


// class EmailField extends StatelessWidget {
//   const EmailField({super.key});
//   //String email = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 35),
//       child: TextFormField(
//         keyboardType: TextInputType.emailAddress,
//         decoration: InputDecoration(
//           labelText: "Email",
//           hintText: 'Enter email',
//           hintStyle: GoogleFonts.montserrat(),
//           labelStyle: GoogleFonts.montserrat(),
//           prefixIcon: const Icon(Icons.email),
//           border: const OutlineInputBorder(),
//         ),
//         onChanged: (String Value) {
//           // setState(() => email = val);
//         },
//         validator: (value) {
//           return value!.isEmpty ? 'Please Enter Email' : null;
//         },
//       ),
//     );
//   }
// }
class EmailField extends StatelessWidget {
<<<<<<< HEAD
  final Function(String)? onChanged;

  const EmailField({Key? key, this.onChanged}) : super(key: key);
=======

  TextEditingController controller = TextEditingController();

  EmailField({required this.controller});

>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
<<<<<<< HEAD
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
        onChanged: onChanged, // Call the provided onChanged callback
        validator: (value) {
          return value!.isEmpty ? 'Please Enter Email' : null;
        },
=======

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email Label
          const Text(
            '   EMAIL',
            style: TextStyle(
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w800,
              fontSize: 13.0,
              letterSpacing: 1.5,
              height: 1.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          // Email Text Field
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'name@email.com',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/page-1/images/custom/email_icon.png',
                    width: 24, height: 24),
              ),
              filled: true,
              fillColor: Colors.white,
              // Rounded edges
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onChanged: (String value) {
              // Handle changes
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}


class UsernameField extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  UsernameField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username Label
          const Text(
            '   USERNAME',
            style: TextStyle(
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w800,
              fontSize: 13.0,
              letterSpacing: 1.5,
              height: 1.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          // Username Text Field
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'johndoe',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/page-1/images/custom/user_icon.png',
                    width: 24, height: 24),
              ),
              filled: true,
              fillColor: Colors.white,
              // Rounded edges
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onChanged: (String value) {
              // Handle changes
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
        ],
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
      ),
    );
  }
}


// class PasswordField extends StatelessWidget {
//   const PasswordField({super.key});
//   String password = ' ';
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 35),
//       child: TextFormField(
//         keyboardType: TextInputType.visiblePassword,
//         decoration: InputDecoration(
//           labelText: "Password",
//           hintText: 'Enter password',
//           hintStyle: GoogleFonts.montserrat(),
//           labelStyle: GoogleFonts.montserrat(),
//           prefixIcon: const Icon(Icons.password),
//           border: const OutlineInputBorder(),
//         ),
//         onChanged: (String Value) {
//           // setState(() => password = val);
//         },
//         validator: (value) {
//           return value!.isEmpty ? 'Please Enter Password' : null;
//         },
//       ),
//     );
//   }
// }

class PasswordField extends StatelessWidget {
<<<<<<< HEAD
  final Function(String)? onChanged;

  const PasswordField({Key? key, this.onChanged}) : super(key: key);
=======
  TextEditingController controller = TextEditingController();
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9

  PasswordField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
<<<<<<< HEAD
      child: TextFormField(
        obscureText: true, // Mask the entered text for passwords
        decoration: InputDecoration(
          labelText: "Password",
          hintText: 'Enter password',
          hintStyle: GoogleFonts.montserrat(),
          labelStyle: GoogleFonts.montserrat(),
          prefixIcon: const Icon(Icons.lock), // Use an appropriate icon for passwords
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged, // Call the provided onChanged callback
        validator: (value) {
          return value!.isEmpty ? 'Please Enter Password' : null;
        },
=======

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username Label
          const Text(
            '   PASSWORD',
            style: TextStyle(
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w800,
              fontSize: 13.0,
              letterSpacing: 1.5,
              height: 1.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          // Username Text Field
          TextFormField(
            controller: controller,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: '********',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/page-1/images/custom/lock_icon.png',
                    width: 24, height: 24),
              ),
              filled: true,
              fillColor: Colors.white,
              // Rounded edges
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onChanged: (String value) {
              // Handle changes
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ],
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
      ),
    );
  }
}

<<<<<<< HEAD

// class ConfirmPasswordField extends StatelessWidget {
//   const ConfirmPasswordField({super.key});
//   String password = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 35),
//       child: TextFormField(
//         keyboardType: TextInputType.visiblePassword,
//         decoration: InputDecoration(
//           labelText: "Confirm Password",
//           hintText: 'Confirm password',
//           hintStyle: GoogleFonts.montserrat(),
//           labelStyle: GoogleFonts.montserrat(),
//           prefixIcon: const Icon(Icons.password),
//           border: const OutlineInputBorder(),
//         ),
//         onChanged: (String Value) {
//           setState(() => password = val);
//         },
//         validator: (value) {
//           return value!.isEmpty ? 'Please Confirm Password' : null;
//         },
//       ),
//     );
//   }
// }

class ConfirmPasswordField extends StatelessWidget {
  final Function(String)? onChanged;
  
  const ConfirmPasswordField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true, // Mask the entered text for passwords
        decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: 'Confirm password',
          hintStyle: GoogleFonts.montserrat(),
          labelStyle: GoogleFonts.montserrat(),
          prefixIcon: const Icon(Icons.lock), // Use an appropriate icon for passwords
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged, // Call the provided onChanged callback
        validator: (value) {
          return value!.isEmpty ? 'Please Confirm Password' : null;
        },
      ),
    );
  }
}
=======
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9


// class SignUpButton extends StatelessWidget {
//   const SignUpButton({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 100),
//       child: MaterialButton(
//         minWidth: double.infinity,
//         onPressed: () async {
//           print(email);
//           print(password);
//         },
//         color: Colors.black,
//         textColor: Colors.white,
//         child: Text('Sign Up',
//             style: GoogleFonts.exo(fontSize: 20, color: Colors.white)),
//       ),
//     );
//   }
// }

class SignUpButton extends StatelessWidget {
<<<<<<< HEAD
  final AuthService _auth = AuthService();
  final String email;
  final String password;

   SignUpButton({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () async {
          // print(email); // Access the email parameter
          // print(password); // Access the password parameter
          dynamic result = await _auth.registerWithEmailAndPassword(email, password);
        },
        color: Colors.black,
        textColor: Colors.white,
        child: Text('Sign Up', style: GoogleFonts.exo(fontSize: 20, color: Colors.white)),
=======
  const SignUpButton({required this.buttonPressed});

  final Function buttonPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 335,
      height: 52,
      onPressed: (){
        buttonPressed();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UploadScreen()));
      },
      color: const Color(0xFF1264D1),
      textColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: const BorderSide(color: Colors.black, width: 0.3),
      ),
      child: const Text(
        'SIGN UP',
        style: TextStyle(
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w700,
          fontSize: 15,
          letterSpacing: 1.25,
        ),
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
      ),
    );
  }
}


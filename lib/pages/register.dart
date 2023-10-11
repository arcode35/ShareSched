import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/services/auth.dart';
import 'custom_widgets.dart';

class RegisterScreen extends StatelessWidget {

  // String email = '';
  // String password = '';

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
  final Function(String)? onChanged;

  const EmailField({Key? key, this.onChanged}) : super(key: key);

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
        onChanged: onChanged, // Call the provided onChanged callback
        validator: (value) {
          return value!.isEmpty ? 'Please Enter Email' : null;
        },
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
  final Function(String)? onChanged;

  const PasswordField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
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
      ),
    );
  }
}


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
          final user = User(
            email: email,
            password: password, 
            uid: '',
            //fullName: 
            
          );
          // print(email); // Access the email parameter
          // print(password); // Access the password parameter
          dynamic result = await _auth.registerWithEmailAndPassword(email, password);
        },
        color: Colors.black,
        textColor: Colors.white,
        child: Text('Sign Up', style: GoogleFonts.exo(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}


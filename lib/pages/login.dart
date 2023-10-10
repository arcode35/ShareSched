import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/services/auth.dart';
import 'custom_widgets.dart';
import 'register.dart';

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

// class LoginForm extends StatelessWidget {
//   const LoginForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text('Log In',
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
//               CreateAccountButton(),
//               SizedBox(height: 10),
//               LoginButton(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Log In',
          style: GoogleFonts.exo(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
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
              CreateAccountButton(),
              SizedBox(height: 10),
              LoginButton(
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
//         onChanged: (String Value) {},
//         validator: (value) {
//           return value!.isEmpty ? 'Please Enter Email' : null;
//         },
//       ),
//     );
//   }
// }
class EmailField extends StatelessWidget {
  final Function(String)? onChanged;

  const EmailField({Key? key, this.onChanged});

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
//         onChanged: (String Value) {},
//         validator: (value) {
//           return value!.isEmpty ? 'Please Enter Password' : null;
//         },
//       ),
//     );
//   }
// }
class PasswordField extends StatelessWidget {
  final Function(String)? onChanged;

  const PasswordField({Key? key, this.onChanged});

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
        onChanged: onChanged, // Call the provided onChanged callback
        obscureText: true, // Mask the entered text for passwords
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
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        },
        child: Text('Create an account', style: GoogleFonts.montserrat()),
      ),
    );
  }
}

// class LoginButton extends StatelessWidget {
//   const LoginButton({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 100),
//       child: MaterialButton(
//         minWidth: double.infinity,
//         onPressed: () {},
//         color: Colors.black,
//         textColor: Colors.white,
//         child: Text('Log In',
//             style: GoogleFonts.exo(fontSize: 20, color: Colors.white)),
//       ),
//     );
//   }
// }

class LoginButton extends StatelessWidget {
  final AuthService _auth = AuthService();
  final String email;
  final String password;
  final Key? key; // Add a named key parameter

  LoginButton({
    required this.email,
    required this.password,
    this.key,
  }) : super(key: key); // Pass the key parameter to the super constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () async {
          // Handle login logic here
          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
          print('logged in');
          print(result.uid);
        },
        color: Colors.black,
        textColor: Colors.white,
        child: Text(
          'Log In',
          style: GoogleFonts.exo(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}


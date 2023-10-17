import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/services/auth.dart';
import 'custom_widgets.dart';
import 'register.dart';
import 'package:myapp/navigation/navigation_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  alignment: Alignment.center,
                ),
                // Login Form
                Center(
                  child: LoginForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

<<<<<<< HEAD
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

=======

class LoginForm extends StatefulWidget {
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
<<<<<<< HEAD
  String email = '';
  String password = '';
=======
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onLoginButtonPressed() async{
    final AuthService _auth = AuthService();
    // Save to login details to database here?
    String email = emailController.text;
    String password = passwordController.text;
    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
    print("Email: $email");
    print("Password: $password");
    print(result.uid);
    
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
<<<<<<< HEAD
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
=======
        Text('Log In',
            style: GoogleFonts.quicksand(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 20),
        Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              EmailField(controller: emailController),
              const SizedBox(height: 20),
              PasswordField(controller: passwordController),
              const SizedBox(height: 20),
              LoginButton(buttonPressed: onLoginButtonPressed),
              const SizedBox(height: 20),
              const AuthButtons(),
              const SizedBox(height: 20),
              TextField(),
              const SizedBox(height: 20),
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
            ],
          ),
        ),
      ],
    );
  }
}

<<<<<<< HEAD


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
=======
class TextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Don't have an account? ",
        style: GoogleFonts.quicksand(fontSize: 16, color: Colors.white),
        children: [
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              },
              child: Text(
                'Sign up',
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


class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({required this.controller});
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
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
      ),
    );
  }
}


<<<<<<< HEAD
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

=======
class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordField({required this.controller});
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
<<<<<<< HEAD
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
=======
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
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9

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
<<<<<<< HEAD
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
=======


  final Function buttonPressed;

  const LoginButton({super.key, required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 300,
      height: 52,
      onPressed: () async{
        buttonPressed();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomNavigationBar(),
            ));
      },
      color: const Color(0xFF1264D1),
      textColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: const BorderSide(color: Colors.black, width: 0.3),
      ),
      child: const Text(
        'LOG IN',
        style: TextStyle(
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w700,
          fontSize: 15,
          letterSpacing: 1.25,
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
        ),
      ),
    );
  }
}


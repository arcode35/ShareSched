import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_widgets.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

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
                  child: SearchForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  TextEditingController friendName = TextEditingController();

  void onSearchButtonPressed() {
    // add search db logic here
    String username = friendName.text;
    print("Username: $username");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Add Friends',
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
              AddFriendsField(controller: friendName),
              const SizedBox(height: 70),
              SearchButton(
                buttonPressed: onSearchButtonPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddFriendsField extends StatelessWidget {
  TextEditingController controller;

  AddFriendsField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username Label
          const Text(
            '   SEARCH',
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
              labelText: 'Add friends with their username!',
              prefixIcon: const Icon(Icons.search),
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
                return 'Please enter a username';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  final Function buttonPressed;

  const SearchButton({super.key, required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 335,
      height: 52,
      onPressed: () {
        buttonPressed();
      },
      color: const Color(0xFF1264D1),
      textColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: const BorderSide(color: Colors.black, width: 0.3),
      ),
      child: const Text(
        'SEARCH',
        style: TextStyle(
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w700,
          fontSize: 17,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

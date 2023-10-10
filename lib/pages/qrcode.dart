import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_widgets.dart';

class QRScreen extends StatelessWidget {
  @override
  const QRScreen({super.key});

  Widget build(BuildContext build) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const BackgroundWidget2(),
        const Positioned(
          top: 70,
          child: NameWidget(),
        ),
        const SizedBox(
          height: 200,
        ),
        IconWidget(),
      ],
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  Widget build(BuildContext build) {
    return Text('QR Code',
        style: GoogleFonts.quicksand(
          fontSize: 32,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ));
  }
}

class IconWidget extends StatelessWidget {
  @override
  IconWidget({super.key});

  Widget build(BuildContext build) {
    return const Icon(
      Icons.qr_code,
      size: 300,
      color: Colors.white,
    );
  }
}

class SearchButton extends StatelessWidget {
  final Function buttonPressed;

  const SearchButton({super.key, required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 300,
      height: 50,
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

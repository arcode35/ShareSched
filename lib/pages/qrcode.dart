import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_widgets.dart';

class QRScreen extends StatelessWidget {
  @override
  const QRScreen({super.key});

  Widget build(BuildContext build) {
    return const Stack(
      children: [
        BackgroundWidget(),
        NameWidget(),
      ],
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  Widget build(BuildContext build) {
    return Container(
      alignment: Alignment.center,
      child: Text('Welcome to the QR PAGE!',
          style: GoogleFonts.orbitron(color: Colors.white)),
    );
  }
}

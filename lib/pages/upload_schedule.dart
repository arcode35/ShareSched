import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_widgets.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreen createState() => _UploadScreen();
}

class _UploadScreen extends State<UploadScreen> {
  final ImagePicker picker = ImagePicker();
  File? _image;

  Future<void> imagePicker() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          BackgroundWidget(),
          UploadText(),
          UploadButton(onPressed: imagePicker),
        ],
      ),
    );
  }
}

class UploadText extends StatelessWidget {
  const UploadText({super.key});
  @override
  Widget build(BuildContext build) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        Text('Upload',
            style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        Text('Snap a photo of your schedule to auto-fill course details.',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 15,
            ))
      ],
    );
  }
}

class UploadButton extends StatelessWidget {
  Function onPressed;
  UploadButton({super.key, required this.onPressed});
  Widget build(BuildContext build) {
    return Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () => onPressed(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(53, 51, 205, 1),
          ),
          child: Text('Upload Schedule!',
              style: GoogleFonts.quicksand(color: Colors.black, fontSize: 18)),
        ));
  }
}

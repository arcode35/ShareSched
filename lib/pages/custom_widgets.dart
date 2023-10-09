import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/page-1/images/custom/logo.png',
        fit: BoxFit.cover,
        height: 100,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      bottomOpacity: 20,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;
  final Alignment alignment;
  final String logoText;
  const LogoWidget(
      {super.key,
      this.height = 300,
      this.width = 300,
      this.logoText = "ShareSched",
      this.alignment = Alignment.center});

  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
          height: height,
          width: width,
          child: Stack(
            alignment: alignment,
            children: [
              Image.asset('assets/page-1/images/custom/logo.png'),
              Text(
                logoText,
                style: GoogleFonts.quicksand(
                    fontSize: 28,
                    height: 14.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ],
          )),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("Background widget building");
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color.fromRGBO(0, 0, 0, 1), Color.fromRGBO(53, 51, 205, 1)],
        ),
      ),
    );
  }
}

class BackgroundWidget2 extends StatelessWidget {
  const BackgroundWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    print("Background widget 2 building");
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromARGB(255, 6, 5, 34),
    );
  }
}

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext build) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 110,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Image.asset(
              "assets/page-1/images/custom/google.png",
              height: 20,
              width: 20,
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
            width: 110,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Image.asset(
                  "assets/page-1/images/custom/apple.png",
                  height: 16.85,
                  width: 20,
                ))),
        const SizedBox(width: 5),
        SizedBox(
            width: 110,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Image.asset(
                "assets/page-1/images/custom/facebook.png",
                height: 20,
                width: 20,
              ),
            )),
      ],
    );
  }
}

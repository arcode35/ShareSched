import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class UploadScheduleScreen extends StatefulWidget {
  @override
  _UploadScheduleScreen createState() => _UploadScheduleScreen();
}

class _UploadScheduleScreen extends State<UploadScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
        ],
      ),
    );
  }
}

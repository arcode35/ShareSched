import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:myapp/models/class_model.dart';
import 'package:myapp/models/course_data.dart';
import 'package:myapp/models/course_model.dart';
import 'package:myapp/models/schedule_model.dart';
import 'package:myapp/services/remote_service.dart';
import 'package:myapp/services/upload_image.dart';
import 'custom_widgets.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


List<ClassModel> classes = [];


class UploadScreen extends StatefulWidget {
  @override
  _UploadScreen createState() => _UploadScreen();
}

class _UploadScreen extends State<UploadScreen> {
  
  //inal TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
  final logger = Logger();
  final ImagePicker picker = ImagePicker();
  File? _image;
    bool textScanning = false;
    
  String scannedText = "";


  Future<void> takeImage() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
     Uint8List? bytes = await photo?.readAsBytes();
    if (photo != null) {
      textScanning = true;
      setState(() {
        _image = File(photo.path);
      });

      
      //process image
      String resp = await StoreData().uploadImageToStorage('sched.png', bytes );

         //_processImage();
            List<String> coursesList = await getCoursesAsString();

        for (String courseString in coursesList) {
          print(courseString);
        }
      
      
    }
  }

  Future<void> uploadImage() async {
    //callApi("CS", "2337", "23", "003");
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    Uint8List? bytes = await photo?.readAsBytes();
    if (photo != null) {
      textScanning = true;
      setState(() {
        _image = File(photo.path);
      });

      
      //process image
      String resp = await StoreData().uploadImageToStorage('sched.png', bytes );

         //_processImage();
      
      }
  }

  Future<void> callApi(String? sP, String? cN, String? cY, String sN) async{
    CourseData? courseD;
    ScheduleModel? scheduleM;
    var isLoaded = false;
    final course = CourseModel(
      subjectPrefix:sP,
      courseNumber: cN,
      catalogYear: cY,
      sectionNumber:sN,
      );

      courseD = await RemoteService().getCourseData(course);
      if(courseD != null) {
        setState(() {
          print(courseD?.data?.first?.id);
        });

        scheduleM = await RemoteService().getScheduleModel(courseD, course);
        if(courseD != null) {
          isLoaded = true;
          // DateTime? now = scheduleM?.data?.first.meetings?.first.startTime;
          // String formattedDate = now!.toIso8601String();
          // print(scheduleM?.data?.first.meetings?.first.endTime);
        }

      }

      if(isLoaded){
        final professorsAsString = scheduleM?.data?.first.professors?.join(',');
        final classM = ClassModel(
          subjectPrefix: sP,
          courseNumber: cN,
          catalogYear: cY,
          sectionNumber: sN,
          start_time: (scheduleM?.data?.first.meetings?.first.startTime)?.toIso8601String(),
          end_time: (scheduleM?.data?.first.meetings?.first.endTime)?.toIso8601String(),
          building: scheduleM?.data?.first.meetings?.first.location?.building as String,
          room: scheduleM?.data?.first.meetings?.first.location?.room as String,
          map_uri: scheduleM?.data?.first.meetings?.first.location?.mapUri as String,
          meetingDays: scheduleM?.data?.first.meetings?.first.meetingDays,
          professor: professorsAsString,
          );

        classes.add(classM);
        
        print(classes);
        //printCourses();
      }

  }


// void printCourses() async {
//   final QuerySnapshot<Map<String, dynamic>> snapshot =
//       await FirebaseFirestore.instance.collection('courses').get();

//   for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
//     final data = doc.data();

//     // Add your if-else check here
//     if (data.containsKey('course') && data.containsKey('number') && data.containsKey('section')) {
//       print('Course: ${data['course']}, Number: ${data['number']}, Section: ${data['section']}');
//     } else {
//       print('Invalid data format for course: $data');
//     }
//   }
// }

Future<List<String>> getCoursesAsString() async {
  final QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('courses').get();

  List<String> coursesList = [];

  for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
    final data = doc.data();

   // Add your if-else check here
    if (data.containsKey('course') &&
        data.containsKey('number') &&
        data.containsKey('section')) {
      String courseString =
          'Course: ${data['course']}, Number: ${data['number']}, Section: ${data['section']}';
      coursesList.add(courseString);
    } else {
      String invalidDataString = 'Invalid data format for course: $data';
      coursesList.add(invalidDataString);
    }
  }
  
  return coursesList;
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          const BackgroundWidget(),
          Container(
            alignment: Alignment.topCenter,
            child: const UploadText(),
          ),
          Container(
            alignment: Alignment.center,
            child: const ImageIcon(
              AssetImage('assets/page-1/images/ocr.png'),
              size: 500,
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TakePictureButton(buttonPressed: takeImage),
                  const SizedBox(
                    width: 20,
                  ),
                  UploadButton(buttonPressed: uploadImage),

                ],
              )
            ],
          )
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
  final Function buttonPressed;

  const UploadButton({super.key, required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 180,
        height: 52,
        onPressed: () => buttonPressed(),
        color: const Color(0xFF1264D1),
        textColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: const BorderSide(color: Colors.black, width: 0.3),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.image,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Upload Picture',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                letterSpacing: 1.25,
              ),
            ),
          ],
        ));
  }
}

class TakePictureButton extends StatelessWidget {
  final Function buttonPressed;

  const TakePictureButton({super.key, required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 180,
        height: 52,
        onPressed: () => buttonPressed(),
        color: const Color(0xFF1264D1),
        textColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: const BorderSide(color: Colors.black, width: 0.3),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.camera_enhance,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Take Picture',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                letterSpacing: 1.25,
              ),
            ),
          ],
        ));
  }
}
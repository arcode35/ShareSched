import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_planner/time_planner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Schedule();
  }
}

class ScheduleForm extends StatelessWidget {
  const ScheduleForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Text('Schedule',
            style: GoogleFonts.quicksand(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 20),
      ],
    );
  }
}

class AddFriendsField extends StatelessWidget {
  const AddFriendsField({super.key});

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

class ClassWidget extends StatefulWidget {
  String courseName;
  ClassWidget({super.key, required this.courseName});
  @override
  _ClassWidget createState() => _ClassWidget(courseName: courseName);
}

class _ClassWidget extends State<ClassWidget> {
  String courseName;
  _ClassWidget({required this.courseName});
  Widget build(BuildContext build) {
    return TimePlannerTask(
      color: Color.fromRGBO(53, 51, 205, 1),
      dateTime: TimePlannerDateTime(day: 0, hour: 14, minutes: 30),
      minutesDuration: 90,
      onTap: () {
        print('Task tapped!');
      },
      child: Text(
        courseName,
        style: TextStyle(color: Colors.grey[350], fontSize: 12),
      ),
    );
  }
}

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  List<TimePlannerTask> tasks = [
    TimePlannerTask(
      // background color for task
      color: const Color.fromRGBO(53, 51, 205, 1),

      // day: Index of header, hour: Task will be begin at this hour
      // minutes: Task will be begin at this minutes
      dateTime: TimePlannerDateTime(day: 1, hour: 14, minutes: 30),
      // Minutes duration of task
      minutesDuration: 90,
      // Days duration of task (use for multi days task)
      daysDuration: 1,
      onTap: () {
        print("Tapped");
      },
      child: Text(
        'Linear Algebra',
        style: TextStyle(
            color: Colors.grey[350], fontSize: 12, fontFamily: 'Quicksand'),
      ),
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimePlanner(
        startHour: 8,
        endHour: 20,
        headers: const [
          TimePlannerTitle(
              title: 'Monday',
              titleStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Quicksand',
              )),
          TimePlannerTitle(
              title: 'Tuesday',
              titleStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Quicksand',
              )),
          TimePlannerTitle(
              title: 'Wednesday',
              titleStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Quicksand',
              )),
          TimePlannerTitle(
              title: 'Thursday',
              titleStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Quicksand',
              )),
          TimePlannerTitle(
              title: 'Friday',
              titleStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Quicksand',
              )),
        ],
        tasks: tasks,
        style: TimePlannerStyle(
            backgroundColor: Colors.black,
            dividerColor: const Color.fromRGBO(53, 51, 205, 1),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        use24HourFormat: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String _course = 'CS101';
  DateTime _date = DateTime.now();
  final students = ['S001', 'S002', 'S003']; // mock
  final present = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mark Attendance')),
      body: Column(
        children: [
          ListTile(title: Text('Course: $_course'), trailing: IconButton(icon: const Icon(Icons.calendar_today), onPressed: () {})),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, i) {
                final s = students[i];
                return CheckboxListTile(
                  value: present.contains(s),
                  title: Text(s),
                  onChanged: (v) => setState(() => v == true ? present.add(s) : present.remove(s)),
                );
              },
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Save'))
        ],
      ),
    );
  }
}
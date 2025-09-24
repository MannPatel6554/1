import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';

class FacultyDashboard extends StatelessWidget {
  const FacultyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Faculty Dashboard',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: ListTile(title: const Text('Courses'), subtitle: const Text('View assigned courses'))),
          Card(child: ListTile(title: const Text('Attendance'), subtitle: const Text('Mark student attendance'))),
          Card(child: ListTile(title: const Text('Grades'), subtitle: const Text('Enter student grades'))),
          Card(child: ListTile(title: const Text('Announcements'), subtitle: const Text('Post course announcements'))),
        ],
      ),
    );
  }
}
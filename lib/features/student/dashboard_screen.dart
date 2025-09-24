import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Student Dashboard',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: ListTile(title: const Text('Profile'), subtitle: const Text('Program/Branch/Year'))),
          Card(child: ListTile(title: const Text('Fees'), subtitle: const Text('Fee status'))),
          Card(child: ListTile(title: const Text('Hostel'), subtitle: const Text('Block/Room'))),
          Card(child: ListTile(title: const Text('Academics'), subtitle: const Text('Attendance %'))),
        ],
      ),
      fab: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.help)),
    );
  }
}
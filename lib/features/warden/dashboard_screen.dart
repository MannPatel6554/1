import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';

class WardenDashboard extends StatelessWidget {
  const WardenDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Warden Dashboard',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: ListTile(title: const Text('Room Allocation'), subtitle: const Text('Manage student room assignments'))),
          Card(child: ListTile(title: const Text('Occupancy Overview'), subtitle: const Text('View hostel occupancy status'))),
          Card(child: ListTile(title: const Text('Maintenance Requests'), subtitle: const Text('Handle room maintenance'))),
          Card(child: ListTile(title: const Text('Hostel Rules'), subtitle: const Text('Manage hostel policies'))),
        ],
      ),
    );
  }
}
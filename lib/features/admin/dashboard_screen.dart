import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Admin Dashboard',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: ListTile(title: const Text('Students'), subtitle: const Text('Manage student records'))),
          Card(child: ListTile(title: const Text('Faculty'), subtitle: const Text('Manage faculty records'))),
          Card(child: ListTile(title: const Text('Fees Management'), subtitle: const Text('Fee structure & collections'))),
          Card(child: ListTile(title: const Text('Reports'), subtitle: const Text('Generate system reports'))),
          Card(child: ListTile(title: const Text('System Settings'), subtitle: const Text('Configure system parameters'))),
        ],
      ),
    );
  }
}
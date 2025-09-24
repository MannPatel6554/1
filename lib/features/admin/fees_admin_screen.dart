import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';

class FeesAdminScreen extends StatelessWidget {
  const FeesAdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Fees Admin',
      body: Center(child: Text('Create / Update fee entries UI goes here')),
    );
  }
}
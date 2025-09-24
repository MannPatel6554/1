import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';
import '../../data/repositories/hostel_repo.dart';

class OccupancyScreen extends StatefulWidget {
  const OccupancyScreen({super.key});
  @override
  State<OccupancyScreen> createState() => _OccupancyScreenState();
}

class _OccupancyScreenState extends State<OccupancyScreen> {
  final repo = HostelRepo();
  late Future<List<Map<String, dynamic>>> _inv;

  @override
  void initState() {
    super.initState();
    _inv = repo.inventory();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Occupancy',
      body: FutureBuilder(
        future: _inv,
        builder: (context, snap) {
          if (!snap.hasData) return const Center(child: CircularProgressIndicator());
          final list = snap.data!;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, i) {
              final e = list[i];
              return ListTile(
                title: Text('${e['block']} - ${e['room_no']}'),
                subtitle: Text('Capacity: ${e['capacity']} • Occupied: ${e['occupied']}'),
              );
            },
          );
        },
      ),
    );
  }
}
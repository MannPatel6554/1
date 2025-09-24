import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widgets/empty_state.dart';
import '../../data/repositories/fees_repo.dart';

class FeesScreen extends ConsumerWidget {
  final String studentId;
  const FeesScreen({super.key, required this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = FeesRepo();
    return Scaffold(
      appBar: AppBar(title: const Text('Fees')),
      body: FutureBuilder(
        future: repo.listForStudent(studentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          final list = snapshot.data as List;
          if (list.isEmpty) return const EmptyState('No transactions yet');
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, i) {
              final t = list[i];
              return ListTile(
                title: Text('Txn: ${t.txnId} — ${t.amount}'),
                subtitle: Text('${t.status ?? ''} — ${t.date}'),
                trailing: IconButton(
                  icon: const Icon(Icons.open_in_new),
                  onPressed: () async {
                    final url = await repo.downloadReceiptSignedUrl(t.receiptUrl ?? '');
                    if (url != null) {
                      // open
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Receipt not available')));
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
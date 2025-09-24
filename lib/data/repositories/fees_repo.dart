import 'package:supabase_flutter/supabase_flutter.dart';
import '../supabase_client.dart';
import '../models/fee_txn.dart';

class FeesRepo {
  final SupabaseClient client = SupabaseManager.client;

  Future<List<FeeTxn>> listForStudent(String studentId) async {
    final res = await client.from('fee_ledger').select().eq('student_id', studentId) as List<dynamic>;
    return res.map((e) => FeeTxn.fromMap(e as Map<String, dynamic>)).toList();
  }

  Future<String?> downloadReceiptSignedUrl(String path) async {
    try {
      final url = await client.storage.from('receipts').createSignedUrl(path, 60);
      return url;
    } catch (_) {
      return null;
    }
  }
}
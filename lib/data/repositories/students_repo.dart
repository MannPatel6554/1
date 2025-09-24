import 'package:supabase_flutter/supabase_flutter.dart';
import '../supabase_client.dart';
import '../models/student.dart';

class StudentsRepo {
  final SupabaseClient client = SupabaseManager.client;

  Future<Student?> getByUserId(String userId) async {
    final res = await client.from('students').select().eq('user_id', userId).maybeSingle();
    if (res == null) return null;
    return Student.fromMap(res as Map<String, dynamic>);
  }

  Future<List<Student>> searchByName(String q) async {
    final res = await client.from('students').select().ilike('first_name', '%$q%');
    return (res as List).map((e) => Student.fromMap(e as Map<String, dynamic>)).toList();
  }

  Future<void> create(Map<String, dynamic> payload) async {
    await client.from('students').insert(payload);
  }

  Future<void> update(String studentId, Map<String, dynamic> payload) async {
    await client.from('students').update(payload).eq('student_id', studentId);
  }
}
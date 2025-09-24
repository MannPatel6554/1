import '../supabase_client.dart';

class AnnouncementsRepo {
  final client = SupabaseManager.client;

  Future<void> post(Map<String, dynamic> payload) async {
    await client.from('announcements').insert(payload);
    // publish via realtime automatically; clients listening will get it
  }

  Future<List<Map<String, dynamic>>> list() async {
    final res = await client.from('announcements').select().order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(res as List);
  }
}
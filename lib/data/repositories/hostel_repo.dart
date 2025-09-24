import '../supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HostelRepo {
  final SupabaseClient client = SupabaseManager.client;

  Future<List<Map<String, dynamic>>> inventory() async {
    final res = await client.from('hostel_inventory').select();
    return List<Map<String, dynamic>>.from(res as List);
  }

  Future<void> requestChange(Map<String, dynamic> ticket) async {
    await client.from('hostel_tickets').insert(ticket);
  }

  Future<void> allocate(String studentId, String block, String roomNo) async {
    await client.from('hostel_allocations').insert({'student_id': studentId, 'block': block, 'room_no': roomNo});
    // update occupied count - naive example
    await client.rpc('increment_room_occupied', params: {'p_block': block, 'p_room_no': roomNo}).catchError((_) {});
  }
}
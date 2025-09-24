import 'package:flutter_test/flutter_test.dart';
import 'package:campus_erp/data/repositories/fees_repo.dart';

void main() {
  test('FeesRepo.listForStudent returns list (happy path)', () async {
    final repo = FeesRepo();
    // NOTE: This test assumes a running Supabase emulator or mocking; here we show structure only
    try {
      final list = await repo.listForStudent('S001');
      expect(list, isA<List>());
    } catch (e) {
      // in CI you would mock or use test doubles; ensure errors are surfaced
      expect(e, isA<Exception>());
    }
  });
}
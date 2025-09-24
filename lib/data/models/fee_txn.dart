class FeeTxn {
  final String txnId;
  final String studentId;
  final double amount;
  final String? mode;
  final DateTime? date;
  final String? status;
  final String? receiptUrl;

  FeeTxn({required this.txnId, required this.studentId, required this.amount, this.mode, this.date, this.status, this.receiptUrl});

  factory FeeTxn.fromMap(Map<String, dynamic> m) => FeeTxn(
        txnId: m['txn_id'] as String,
        studentId: m['student_id'] as String,
        amount: (m['amount'] as num).toDouble(),
        mode: m['mode'] as String?,
        date: m['date'] == null ? null : DateTime.parse(m['date']),
        status: m['status'] as String?,
        receiptUrl: m['receipt_url'] as String?,
      );
}
class Student {
  final String studentId;
  final String? firstName;
  final String? lastName;
  final String? program;
  final String? branch;
  final int? year;

  Student({required this.studentId, this.firstName, this.lastName, this.program, this.branch, this.year});

  factory Student.fromMap(Map<String, dynamic> m) => Student(
        studentId: m['student_id'] as String,
        firstName: m['first_name'] as String?,
        lastName: m['last_name'] as String?,
        program: m['program'] as String?,
        branch: m['branch'] as String?,
        year: m['year'] as int?,
      );
}
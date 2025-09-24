enum UserRole { student, faculty, admin, warden }

UserRole roleFromString(String? s) {
  switch (s) {
    case 'faculty':
      return UserRole.faculty;
    case 'admin':
      return UserRole.admin;
    case 'warden':
      return UserRole.warden;
    case 'student':
    default:
      return UserRole.student;
  }
}
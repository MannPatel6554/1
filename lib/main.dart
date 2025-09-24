import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CampusERP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/student',
      builder: (context, state) => const StudentDashboard(),
    ),
    GoRoute(
      path: '/teacher',
      builder: (context, state) => const TeacherDashboard(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminDashboard(),
    ),
  ],
);

// Simple Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('CampusERP Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.school,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'CampusERP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Demo login logic
                        final email = _emailController.text;
                        if (email.contains('student')) {
                          context.go('/student');
                        } else if (email.contains('teacher')) {
                          context.go('/teacher');
                        } else {
                          context.go('/admin');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text('Login', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Demo Users:'),
            const Text('student@demo.com - Student'),
            const Text('teacher@demo.com - Teacher'),
            const Text('admin@demo.com - Admin'),
          ],
        ),
      ),
    );
  }
}

// Student Dashboard
class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.go('/login'),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildDashboardCard('Attendance', Icons.checklist, Colors.green, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const AttendanceScreen(),
            ));
          }),
          _buildDashboardCard('Grades', Icons.grade, Colors.orange, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const GradesScreen(),
            ));
          }),
          _buildDashboardCard('Assignments', Icons.assignment, Colors.purple, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const AssignmentsScreen(),
            ));
          }),
          _buildDashboardCard('Timetable', Icons.schedule, Colors.blue, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const TimetableScreen(),
            ));
          }),
          _buildDashboardCard('Profile', Icons.person, Colors.red, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ));
          }),
          _buildDashboardCard('Fees', Icons.payment, Colors.teal, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const FeesScreen(),
            ));
          }),
          _buildDashboardCard('Hostel Problem', Icons.report_problem, Colors.deepOrange, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const HostelProblemScreen(),
            ));
          }),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

// Teacher Dashboard
class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.go('/login'),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildDashboardCard('My Classes', Icons.class_, Colors.blue, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const TeacherClassesScreen(),
            ));
          }),
          _buildDashboardCard('Attendance', Icons.checklist, Colors.green, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const TeacherAttendanceScreen(),
            ));
          }),
          _buildDashboardCard('Grades', Icons.grade, Colors.orange, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const TeacherGradesScreen(),
            ));
          }),
          _buildDashboardCard('Students', Icons.people, Colors.purple, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const TeacherStudentsScreen(),
            ));
          }),
          _buildDashboardCard('Assignments', Icons.assignment, Colors.red, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const TeacherAssignmentsScreen(),
            ));
          }),
          _buildDashboardCard('Reports', Icons.assessment, Colors.teal, () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const TeacherReportsScreen(),
            ));
          }),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

// Admin Dashboard
class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.go('/login'),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildDashboardCard('Students', Icons.people, Colors.blue, () {}),
          _buildDashboardCard('Teachers', Icons.person, Colors.green, () {}),
          _buildDashboardCard('Classes', Icons.class_, Colors.orange, () {}),
          _buildDashboardCard('Attendance', Icons.checklist, Colors.purple, () {}),
          _buildDashboardCard('Reports', Icons.assessment, Colors.red, () {}),
          _buildDashboardCard('Settings', Icons.settings, Colors.teal, () {}),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

// Attendance Screen Example
class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Attendance'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Overall Attendance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(value: 0.85, backgroundColor: Colors.grey.shade300, color: Colors.green),
                  const SizedBox(height: 5),
                  const Text('85% (17/20 days)', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(5, (index) => Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: index % 2 == 0 ? Colors.green : Colors.red,
                child: Icon(
                  index % 2 == 0 ? Icons.check : Icons.close,
                  color: Colors.white,
                ),
              ),
              title: Text('Day ${index + 1}'),
              subtitle: Text('Date: ${20 + index}/09/2024'),
              trailing: Text(
                index % 2 == 0 ? 'Present' : 'Absent',
                style: TextStyle(
                  color: index % 2 == 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

// Grades Screen
class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Grades'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Overall GPA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('8.5/10.0', style: TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...['Mathematics', 'Physics', 'Chemistry', 'English', 'Computer Science'].map((subject) => Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  subject[0],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(subject),
              subtitle: const Text('Grade: A'),
              trailing: const Text(
                '85/100',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )).toList(),
        ],
      ),
    );
  }
}

// Assignments Screen
class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Assignments'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Summary Card
          Card(
            color: Colors.purple.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Assignment Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSummaryItem('Pending', '3', Colors.orange),
                      _buildSummaryItem('Completed', '8', Colors.green),
                      _buildSummaryItem('Overdue', '1', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Assignment List
          _buildAssignmentCard('Mathematics - Algebra Problems', 'Due: 25 Sep 2024', 'Pending', Colors.orange, 'Submit solutions for equations 1-20'),
          _buildAssignmentCard('Physics - Lab Report', 'Due: 22 Sep 2024', 'Overdue', Colors.red, 'Complete experiment analysis report'),
          _buildAssignmentCard('English - Essay Writing', 'Due: 28 Sep 2024', 'Pending', Colors.orange, 'Write 500 words on environmental protection'),
          _buildAssignmentCard('Computer Science - Programming', 'Due: 30 Sep 2024', 'Pending', Colors.orange, 'Create a calculator app in Flutter'),
          _buildAssignmentCard('Chemistry - Compound Study', 'Submitted: 20 Sep 2024', 'Completed', Colors.green, 'Research on organic compounds'),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String count, Color color) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildAssignmentCard(String title, String date, String status, Color color, String description) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            status == 'Completed' ? Icons.check : status == 'Overdue' ? Icons.warning : Icons.assignment,
            color: Colors.white,
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            Text(description, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(status, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ),
      ),
    );
  }
}

// Timetable Screen
class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Timetable'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Today's Classes
          Card(
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Today\'s Classes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Tuesday, 24 September 2024', style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Class Schedule
          _buildClassCard('9:00 - 9:50 AM', 'Mathematics', 'Prof. Sharma', 'Room 101', Colors.blue),
          _buildClassCard('10:00 - 10:50 AM', 'Physics', 'Dr. Kumar', 'Lab 2', Colors.green),
          _buildClassCard('11:00 - 11:50 AM', 'English', 'Ms. Patel', 'Room 205', Colors.orange),
          _buildClassCard('1:00 - 1:50 PM', 'Chemistry', 'Prof. Singh', 'Lab 1', Colors.purple),
          _buildClassCard('2:00 - 2:50 PM', 'Computer Science', 'Mr. Gupta', 'Computer Lab', Colors.red),
          _buildClassCard('3:00 - 3:50 PM', 'Physical Education', 'Coach Verma', 'Playground', Colors.teal),
        ],
      ),
    );
  }

  Widget _buildClassCard(String time, String subject, String teacher, String room, Color color) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            time.split(':')[0],
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(subject, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(teacher),
            Text(room, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          ],
        ),
        trailing: Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  const Text('Rahul Patel', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text('Student ID: STU001', style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Active', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Personal Information
          _buildInfoSection('Personal Information', [
            _buildInfoRow('Full Name', 'Rahul Kumar Patel'),
            _buildInfoRow('Date of Birth', '15 March 2005'),
            _buildInfoRow('Gender', 'Male'),
            _buildInfoRow('Blood Group', 'B+'),
          ]),

          // Academic Information
          _buildInfoSection('Academic Information', [
            _buildInfoRow('Class', '12th Standard'),
            _buildInfoRow('Section', 'A'),
            _buildInfoRow('Roll Number', '15'),
            _buildInfoRow('Academic Year', '2024-25'),
          ]),

          // Contact Information
          _buildInfoSection('Contact Information', [
            _buildInfoRow('Email', 'rahul.patel@school.edu'),
            _buildInfoRow('Mobile', '+91 98765 43210'),
            _buildInfoRow('Address', '123 Main Street, Mumbai, Maharashtra'),
            _buildInfoRow('Parent Contact', '+91 98765 43211'),
          ]),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey.shade700)),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

// Fees Screen
class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fee Management'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Fee Summary
          Card(
            color: Colors.teal.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Fee Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFeeItem('Total Fee', '₹50,000', Colors.blue),
                      _buildFeeItem('Paid', '₹35,000', Colors.green),
                      _buildFeeItem('Pending', '₹15,000', Colors.red),
                    ],
                  ),
                  const SizedBox(height: 15),
                  LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 5),
                  const Text('70% Paid', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Fee Structure
          _buildFeeSection('Annual Fee Structure', [
            _buildFeeRow('Tuition Fee', '₹30,000', 'Paid', Colors.green),
            _buildFeeRow('Development Fee', '₹5,000', 'Paid', Colors.green),
            _buildFeeRow('Library Fee', '₹2,000', 'Pending', Colors.red),
            _buildFeeRow('Sports Fee', '₹3,000', 'Pending', Colors.red),
            _buildFeeRow('Lab Fee', '₹5,000', 'Pending', Colors.red),
            _buildFeeRow('Transport Fee', '₹5,000', 'Pending', Colors.red),
          ]),

          // Payment History
          _buildFeeSection('Payment History', [
            _buildPaymentRow('15 Aug 2024', '₹20,000', 'Tuition Fee (Partial)', 'Success'),
            _buildPaymentRow('10 Jul 2024', '₹15,000', 'Tuition Fee + Development', 'Success'),
            _buildPaymentRow('05 Jun 2024', '₹5,000', 'Admission Fee', 'Success'),
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Payment gateway will open here')),
          );
        },
        icon: const Icon(Icons.payment),
        label: const Text('Pay Now'),
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _buildFeeItem(String label, String amount, Color color) {
    return Column(
      children: [
        Text(amount, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildFeeSection(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildFeeRow(String item, String amount, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(item)),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(status, style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String date, String amount, String description, String status) {
    return Card(
      color: Colors.grey.shade50,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.check, color: Colors.white),
        ),
        title: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            Text(date, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
        trailing: Text(status, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// Teacher Classes Screen
class TeacherClassesScreen extends StatelessWidget {
  const TeacherClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Classes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Teaching Summary
          Card(
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Teaching Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSummaryItem('Total Classes', '5', Colors.blue),
                      _buildSummaryItem('Students', '150', Colors.green),
                      _buildSummaryItem('Subjects', '2', Colors.orange),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Class List
          _buildClassCard('Mathematics - 12th A', '30 Students', 'Room 101', '9:00-9:50 AM', Colors.blue),
          _buildClassCard('Mathematics - 12th B', '28 Students', 'Room 102', '10:00-10:50 AM', Colors.blue),
          _buildClassCard('Mathematics - 11th A', '32 Students', 'Room 101', '11:00-11:50 AM', Colors.blue),
          _buildClassCard('Physics - 12th A', '30 Students', 'Lab 1', '1:00-1:50 PM', Colors.green),
          _buildClassCard('Physics - 11th B', '30 Students', 'Lab 2', '2:00-2:50 PM', Colors.green),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String count, Color color) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildClassCard(String className, String students, String room, String time, Color color) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            className.split(' ')[0][0],
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(className, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(students),
            Text('$room • $time', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

// Teacher Attendance Screen
class TeacherAttendanceScreen extends StatelessWidget {
  const TeacherAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Management'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Today's Classes
          Card(
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Today\'s Attendance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Tuesday, 24 September 2024', style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildAttendanceItem('Classes', '5', Colors.blue),
                      _buildAttendanceItem('Present', '142', Colors.green),
                      _buildAttendanceItem('Absent', '8', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Class Attendance
          _buildAttendanceCard('Mathematics - 12th A', '28/30 Present', '93%', Colors.green, 'Completed'),
          _buildAttendanceCard('Mathematics - 12th B', '26/28 Present', '93%', Colors.green, 'Completed'),
          _buildAttendanceCard('Mathematics - 11th A', 'Pending', '--', Colors.orange, 'Pending'),
          _buildAttendanceCard('Physics - 12th A', 'Pending', '--', Colors.orange, 'Pending'),
          _buildAttendanceCard('Physics - 11th B', 'Pending', '--', Colors.orange, 'Pending'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Mark attendance feature will open here')),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildAttendanceItem(String label, String count, Color color) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildAttendanceCard(String className, String attendance, String percentage, Color color, String status) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            status == 'Completed' ? Icons.check : Icons.schedule,
            color: Colors.white,
          ),
        ),
        title: Text(className, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(attendance),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(percentage, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
            Text(status, style: TextStyle(fontSize: 12, color: color)),
          ],
        ),
      ),
    );
  }
}

// Teacher Grades Screen
class TeacherGradesScreen extends StatelessWidget {
  const TeacherGradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Management'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Grading Summary
          Card(
            color: Colors.orange.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Grading Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildGradeItem('A Grade', '45', Colors.green),
                      _buildGradeItem('B Grade', '68', Colors.blue),
                      _buildGradeItem('C Grade', '32', Colors.orange),
                      _buildGradeItem('Below C', '5', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Recent Tests
          _buildGradeCard('Mathematics Unit Test 3', '12th A', 'Avg: 78%', 'Completed', Colors.green),
          _buildGradeCard('Physics Lab Practical', '12th A', 'Avg: 85%', 'Completed', Colors.green),
          _buildGradeCard('Mathematics Monthly Test', '11th A', 'Pending', 'Pending', Colors.orange),
          _buildGradeCard('Physics Unit Test 2', '12th B', 'Avg: 72%', 'Completed', Colors.green),
          _buildGradeCard('Mathematics Assignment 5', '12th B', 'Pending', 'Pending', Colors.orange),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add new test/assignment grades')),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Widget _buildGradeItem(String label, String count, Color color) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildGradeCard(String testName, String className, String average, String status, Color color) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            status == 'Completed' ? Icons.grade : Icons.assignment,
            color: Colors.white,
          ),
        ),
        title: Text(testName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(className),
            Text(average, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(status, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ),
      ),
    );
  }
}

// Teacher Students Screen
class TeacherStudentsScreen extends StatelessWidget {
  const TeacherStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Students'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Student Summary
          Card(
            color: Colors.purple.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Student Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStudentItem('Total', '150', Colors.blue),
                      _buildStudentItem('Excellent', '45', Colors.green),
                      _buildStudentItem('Good', '78', Colors.orange),
                      _buildStudentItem('Need Help', '27', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Student List (Top/Bottom performers)
          const Text('Top Performers', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildStudentCard('Rahul Patel', 'STU001', '12th A', '95%', 'Present', Colors.green),
          _buildStudentCard('Priya Sharma', 'STU002', '12th A', '92%', 'Present', Colors.green),
          _buildStudentCard('Amit Kumar', 'STU003', '12th B', '89%', 'Present', Colors.green),
          
          const SizedBox(height: 15),
          const Text('Need Attention', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildStudentCard('Ravi Singh', 'STU045', '11th A', '45%', 'Absent', Colors.red),
          _buildStudentCard('Neha Gupta', 'STU067', '12th B', '52%', 'Present', Colors.orange),
        ],
      ),
    );
  }

  Widget _buildStudentItem(String label, String count, Color color) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildStudentCard(String name, String id, String className, String grade, String attendance, Color color) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            name[0],
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$id • $className'),
            Text('Today: $attendance', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
        trailing: Text(grade, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16)),
      ),
    );
  }
}

// Teacher Assignments Screen
class TeacherAssignmentsScreen extends StatelessWidget {
  const TeacherAssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment Management'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Assignment Summary
          Card(
            color: Colors.red.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Assignment Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildAssignmentSummary('Active', '8', Colors.blue),
                      _buildAssignmentSummary('Submitted', '145', Colors.green),
                      _buildAssignmentSummary('Pending', '23', Colors.orange),
                      _buildAssignmentSummary('Overdue', '7', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Recent Assignments
          const Text('Recent Assignments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildTeacherAssignmentCard(
            'Mathematics Chapter 5 Problems',
            '12th A • Due: 28 Sep 2024',
            '25/30 Submitted',
            '83%',
            Colors.green,
            'Active'
          ),
          _buildTeacherAssignmentCard(
            'Physics Lab Report - Optics',
            '12th A • Due: 26 Sep 2024',
            '28/30 Submitted',
            '93%',
            Colors.green,
            'Active'
          ),
          _buildTeacherAssignmentCard(
            'Mathematics Unit Test Prep',
            '11th A • Due: 30 Sep 2024',
            '15/32 Submitted',
            '47%',
            Colors.orange,
            'Active'
          ),
          _buildTeacherAssignmentCard(
            'Algebra Practice Set 3',
            '12th B • Due: 24 Sep 2024',
            '26/28 Submitted',
            '93%',
            Colors.red,
            'Overdue'
          ),
          _buildTeacherAssignmentCard(
            'Physics Numerical Problems',
            '11th B • Due: 25 Sep 2024',
            '29/30 Submitted',
            '97%',
            Colors.green,
            'Completed'
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create new assignment feature will open here')),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _buildAssignmentSummary(String label, String count, Color color) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTeacherAssignmentCard(String title, String classInfo, String submissions, String percentage, Color color, String status) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            status == 'Completed' ? Icons.check : 
            status == 'Overdue' ? Icons.warning : Icons.assignment,
            color: Colors.white,
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(classInfo),
            Text(submissions, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(percentage, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(status, style: const TextStyle(color: Colors.white, fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}

// Teacher Reports Screen
class TeacherReportsScreen extends StatelessWidget {
  const TeacherReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Reports'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Reports Summary
          Card(
            color: Colors.teal.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Monthly Performance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('September 2024', style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildReportItem('Classes Taught', '45', Colors.blue),
                      _buildReportItem('Avg Attendance', '89%', Colors.green),
                      _buildReportItem('Avg Score', '78%', Colors.orange),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Class Performance Reports
          const Text('Class Performance Reports', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildReportCard(
            'Mathematics - 12th A',
            'Monthly Performance Report',
            'Avg: 82% • Attendance: 92%',
            '28/30 Students Above 70%',
            Colors.green
          ),
          _buildReportCard(
            'Mathematics - 12th B', 
            'Monthly Performance Report',
            'Avg: 75% • Attendance: 87%',
            '24/28 Students Above 70%',
            Colors.orange
          ),
          _buildReportCard(
            'Physics - 12th A',
            'Lab Performance Report',
            'Avg: 88% • Attendance: 95%',
            '29/30 Students Above 70%',
            Colors.green
          ),
          _buildReportCard(
            'Mathematics - 11th A',
            'Unit Test Analysis',
            'Avg: 65% • Attendance: 84%',
            '20/32 Students Above 70%',
            Colors.red
          ),

          const SizedBox(height: 20),

          // Individual Student Reports
          const Text('Student Progress Reports', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildStudentReportCard('Rahul Patel', 'STU001', '12th A', 'Excellent', '96%', '98%', Colors.green),
          _buildStudentReportCard('Priya Sharma', 'STU002', '12th A', 'Very Good', '92%', '95%', Colors.green),
          _buildStudentReportCard('Amit Kumar', 'STU003', '12th B', 'Good', '78%', '85%', Colors.blue),
          _buildStudentReportCard('Ravi Singh', 'STU045', '11th A', 'Need Improvement', '45%', '72%', Colors.red),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Generate detailed report feature')),
          );
        },
        child: const Icon(Icons.assessment),
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _buildReportItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildReportCard(String title, String reportType, String summary, String details, Color color) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: const Icon(Icons.bar_chart, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(reportType, style: const TextStyle(fontSize: 12)),
            Text(summary),
            Text(details, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  Widget _buildStudentReportCard(String name, String id, String className, String performance, String score, String attendance, Color color) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$id • $className'),
            Text('Performance: $performance', style: TextStyle(fontSize: 12, color: color)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
            Text('Att: $attendance', style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}

// Hostel Problem Screen
class HostelProblemScreen extends StatefulWidget {
  const HostelProblemScreen({super.key});

  @override
  State<HostelProblemScreen> createState() => _HostelProblemScreenState();
}

class _HostelProblemScreenState extends State<HostelProblemScreen> {
  final TextEditingController _problemController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();
  String _selectedProblemType = 'Electrical';
  String _selectedPriority = 'Medium';
  bool _hasPhoto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Hostel Problem Report'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Stats
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text('Your Complaint Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatusCard('Open', '2', Colors.orange),
                      _buildStatusCard('In Progress', '1', Colors.blue),
                      _buildStatusCard('Resolved', '8', Colors.green),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Report New Problem
            const Text('Report New Problem', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Room Number
                  TextField(
                    controller: _roomController,
                    decoration: const InputDecoration(
                      labelText: 'Room Number',
                      hintText: 'Enter your room number',
                      prefixIcon: Icon(Icons.meeting_room),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Problem Type Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedProblemType,
                    decoration: const InputDecoration(
                      labelText: 'Problem Type',
                      prefixIcon: Icon(Icons.category),
                      border: OutlineInputBorder(),
                    ),
                    items: ['Electrical', 'Plumbing', 'AC/Heating', 'Furniture', 'Internet', 'Cleanliness', 'Security', 'Other']
                        .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedProblemType = value!),
                  ),
                  const SizedBox(height: 15),

                  // Priority Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedPriority,
                    decoration: const InputDecoration(
                      labelText: 'Priority',
                      prefixIcon: Icon(Icons.priority_high),
                      border: OutlineInputBorder(),
                    ),
                    items: ['Low', 'Medium', 'High', 'Emergency']
                        .map((priority) => DropdownMenuItem(value: priority, child: Text(priority)))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedPriority = value!),
                  ),
                  const SizedBox(height: 15),

                  // Problem Description
                  TextField(
                    controller: _problemController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Problem Description',
                      hintText: 'Describe the problem in detail...',
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Photo Upload Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          _hasPhoto ? Icons.check_circle : Icons.camera_alt,
                          size: 40,
                          color: _hasPhoto ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _hasPhoto ? 'Photo Selected ✓' : 'Add Photo (Optional)',
                          style: TextStyle(
                            color: _hasPhoto ? Colors.green : Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() => _hasPhoto = !_hasPhoto);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(_hasPhoto ? 'Photo selected!' : 'Photo removed'),
                                backgroundColor: _hasPhoto ? Colors.green : Colors.grey,
                              ),
                            );
                          },
                          icon: Icon(_hasPhoto ? Icons.refresh : Icons.add_a_photo),
                          label: Text(_hasPhoto ? 'Change Photo' : 'Select Photo'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_roomController.text.isNotEmpty && _problemController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Problem reported successfully! Complaint ID: #HST001'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          _roomController.clear();
                          _problemController.clear();
                          setState(() => _hasPhoto = false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill all required fields'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Submit Problem Report', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Previous Complaints
            const Text('Your Previous Complaints', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildComplaintCard(
              'HST008',
              'AC not working properly',
              'A-204',
              'AC/Heating',
              'In Progress',
              'Sept 20, 2024',
              Colors.blue,
            ),
            _buildComplaintCard(
              'HST007',
              'WiFi connectivity issues',
              'A-204',
              'Internet',
              'Resolved',
              'Sept 18, 2024',
              Colors.green,
            ),
            _buildComplaintCard(
              'HST006',
              'Leaking water tap in bathroom',
              'A-204',
              'Plumbing',
              'Resolved',
              'Sept 15, 2024',
              Colors.green,
            ),
            _buildComplaintCard(
              'HST005',
              'Fan making loud noise',
              'A-204',
              'Electrical',
              'Open',
              'Sept 22, 2024',
              Colors.orange,
            ),
            _buildComplaintCard(
              'HST004',
              'Door lock not working',
              'A-204',
              'Security',
              'Resolved',
              'Sept 10, 2024',
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(String label, String count, Color color) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildComplaintCard(String id, String problem, String room, String type, String status, String date, Color color) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(id.split('HST')[1], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        title: Text(problem, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Room: $room • Type: $type'),
            Text('Date: $date', style: const TextStyle(fontSize: 12)),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
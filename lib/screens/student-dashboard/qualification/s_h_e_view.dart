import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/student-dashboard/profile/student_profile_provider.dart';
import 'package:eduwise/screens/student-dashboard/profile/widget/education_section.dart';
import 'package:eduwise/screens/student-dashboard/profile/widget/section_frame.dart';
import 'package:eduwise/screens/student-dashboard/qualification/file-upload/s_h_e_file.dart';
import 'package:eduwise/screens/student-dashboard/student__theme.dart';
import 'package:eduwise/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 🔹 Converted to StatefulWidget so we can use initState
class StudentHEScreen extends StatefulWidget {
  const StudentHEScreen({super.key});

  @override
  State<StudentHEScreen> createState() => _StudentHEScreenState();
}

class _StudentHEScreenState extends State<StudentHEScreen> {
  @override
  void initState() {
    super.initState();
    // ✅ Load demo users only once (not inside build)
    Future.microtask(() {
      final provider = Provider.of<StudentProfileProvider>(
        context,
        listen: false,
      );
      provider.loadDemoUsers();

      // ✅ Select profile 1 explicitly
      provider.setCurrentById(2); // <-- CALL PROFILE 1 HERE
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StudentProfileProvider>();
    final model = provider.current;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary, // ✅ Red AppBar
        title: const Text(
          "Student Highest Education",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const AppDrawer(), // ✅ Drawer on left
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     ScaffoldMessenger.of(
      //       context,
      //     ).showSnackBar(const SnackBar(content: Text('Edit action tapped')));
      //   },
      //   child: const Icon(Icons.edit),
      // ),
      body: model == null
          ? const Center(
              child: Text(
                'Profile not available',
                style: StudentAppTextStyles.body,
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 3) Educational Qualifications
                  SectionFrame(
                    title: 'Highest Education',
                    child: model.education.isEmpty
                        ? const Text(
                            'No educational record available.',
                            style: StudentAppTextStyles.bodyMuted,
                          )
                        : StudentEducationSection(
                            // ✅ Take only the first (highest) education
                            items: [model.education.first],
                          ),
                  ),

                  // 4) Certificate/Documents Section
                  const StudentCertificateSection(),
                ],
              ),
            ),
    );
  }
}

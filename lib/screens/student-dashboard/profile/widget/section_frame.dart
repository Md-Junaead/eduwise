// ============================
// file: lib/widgets/section_frame.dart
// A reusable, modern card frame with title & optional action
// ============================
import 'package:eduwise/screens/student-dashboard/student__theme.dart';
import 'package:flutter/material.dart';

class SectionFrame extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;

  const SectionFrame({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with title and optional action (e.g., "Edit")
            Row(
              children: [
                Text(title, style: StudentAppTextStyles.h2),
                const Spacer(),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/student-dashboard/consultant/stu_cons_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentConsultantScreen extends StatelessWidget {
  const StudentConsultantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX controller to manage consultant data
    final controller = Get.find<StudentConsultantController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultant Selection"),
        backgroundColor: TColors.primary,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Subtitle section with icon + text
          Container(
            width: double.infinity,
            color: Colors.blueAccent.withOpacity(0.05), // light background
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.verified_user, // verified consultant icon
                  size: 22,
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Get advice and complete guidance from verified consultants for your chosen options.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ✅ Consultant list section
          Expanded(
            child: Obx(() {
              final consultants = controller.filteredConsultants;

              // ✅ No consultants fallback
              if (consultants.isEmpty) {
                return const Center(
                  child: Text(
                    "No consultants available",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // Use 1 for mobile, 2-3 for tablets
                    childAspectRatio: 2.1,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: consultants.length,
                  itemBuilder: (context, index) {
                    final c = consultants[index];

                    // ✅ Modern consultant card
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ✅ Consultant profile image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              c.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    width: 80,
                                    height: 80,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.person, size: 40),
                                  ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // ✅ Consultant info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  c.bio,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "${c.rating}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),

                                // ✅ Services chips
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: c.services.map((s) {
                                      return Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        child: Chip(
                                          backgroundColor: TColors.primary
                                              .withOpacity(0.1),
                                          label: Text(
                                            s.serviceName,
                                            style: const TextStyle(
                                              color: TColors.primary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

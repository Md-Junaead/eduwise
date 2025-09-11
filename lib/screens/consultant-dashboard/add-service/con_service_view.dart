// lib/screens/consultant-dashboard/service/consultant_service_create_view.dart
import 'package:eduwise/screens/consultant-dashboard/add-service/con_ser_cre_ctrl.dart';
import 'package:eduwise/screens/consultant-dashboard/add-service/con_ser_cre_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduwise/configs/constants/colors.dart';

class ConsultantServiceCreateView extends StatelessWidget {
  ConsultantServiceCreateView({super.key});
  final controller = Get.put(ConsultantServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Published Services"),
        backgroundColor: TColors.secondary,
        elevation: 4,
      ),
      body: Obx(
        () => controller.services.isEmpty
            ? const Center(
                child: Text(
                  "No services published yet",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: controller.services.length,
                itemBuilder: (context, index) {
                  final service = controller.services[index];
                  return Dismissible(
                    key: Key(service.title + service.serviceType),
                    background: Container(
                      color: Colors.green,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Icon(Icons.edit, color: Colors.white),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        // ---------------- Edit Action ----------------
                        controller.tempServiceType.value = service.serviceType;
                        controller.tempTitle.value = service.title;
                        controller.tempDescription.value = service.description;
                        controller.tempCountry.value = service.country;
                        controller.tempSubject.value = service.subject;
                        controller.tempCharge.value = service.charge.toInt();
                        controller.tempDuration.value = service.duration;

                        Get.to(() => ConsultantServiceCreateForm());
                        return false; // Don't dismiss
                      } else if (direction == DismissDirection.endToStart) {
                        // ---------------- Delete Action ----------------
                        bool confirmed =
                            await Get.defaultDialog(
                              title: "Delete Service",
                              middleText:
                                  "Are you sure you want to delete this service?",
                              textConfirm: "Yes",
                              textCancel: "No",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                controller.services.removeAt(index);
                                Get.back(result: true);
                              },
                              onCancel: () => Get.back(result: false),
                            ) ??
                            false;
                        return confirmed;
                      }
                      return false;
                    },
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.grey.shade200,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ---------------- Service Title ----------------
                            Text(
                              service.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // ---------------- Type & Charge Row ----------------
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: TColors.secondary.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    service.serviceType,
                                    style: const TextStyle(
                                      color: TColors.secondary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "\$${service.charge.toInt()}",
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // ---------------- Description ----------------
                            Text(
                              service.description,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Divider(height: 20, thickness: 1),
                            // ---------------- Country & Subject ----------------
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Country",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        service.country,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Subject",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        service.subject,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // ---------------- Duration ----------------
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  service.duration,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => ConsultantServiceCreateForm());
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Service"),
        backgroundColor: TColors.secondary,
      ),
    );
  }
}

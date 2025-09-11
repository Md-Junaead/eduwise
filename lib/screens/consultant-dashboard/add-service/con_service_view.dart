// lib/screens/consultant-dashboard/service/consultant_service_create_view.dart
import 'package:eduwise/screens/consultant-dashboard/add-service/con_ser_cre_ctrl.dart';
import 'package:eduwise/screens/consultant-dashboard/add-service/con_ser_cre_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduwise/configs/constants/colors.dart';

class ConsultantServiceCreateView extends StatelessWidget {
  ConsultantServiceCreateView({super.key});
  // Initialize the controller here to fix the error
  final controller = Get.put(ConsultantServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Published Services"),
        backgroundColor: TColors.secondary,
      ),
      body: Obx(
        () => controller.services.isEmpty
            ? const Center(child: Text("No services published yet"))
            : ListView.builder(
                itemCount: controller.services.length,
                itemBuilder: (context, index) {
                  final service = controller.services[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        service.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Type: ${service.serviceType}"),
                          Text("Description: ${service.description}"),
                          Text("Country: ${service.country}"),
                          Text("Subject: ${service.subject}"),
                          Text("Charge: \$${service.charge}"),
                          Text("Duration: ${service.duration}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      // ---------------- Floating Action Button ----------------
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the create form to add a new service
          Get.to(() => ConsultantServiceCreateForm());
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Service"),
        backgroundColor: TColors.secondary,
      ),
    );
  }
}






/*



Create Your Service
Select Your Service (Drop Down)
Assessment
File Processing Service
Visa Processing Service
Corresponding Service
Ticketing update Service
Features Service


Title of Your Service - heading
Enter the title of service - Input
Description of Your Service - heading
Enter the Description of your Service - Input
Country of your Assessment - heading
Enter the Country name you want to Assess - Input
Subject of your Assessment - heading
Enter the Subject about You Assess - Input
Charge - heading
Enter the Charge of your Assessment - Input
Duration - heading
Enter the time/days you will you will take - Input
Publish - Button



File Name: ConsultandServiceCreateForm, ConsultandServiceCreateView, ConsultandServiceCreateModel, ConsultandServiceCreateController (Corrent grammer or words) 

Task:
I am creating flutter app
I need to create this form, Publish info and show them on ConsultandServiceCreateView
Must use Algorithem, Data structure & GetX state management for properly managing state
Make modern, Responsive & professional design, give your design score out of 100
Add button should be as flowting action button
tell me what you did
comment the code for better understand


*/
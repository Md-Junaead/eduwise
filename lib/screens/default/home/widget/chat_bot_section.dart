// import 'package:eduwise/widget/bottom_nav.dart';
// import 'package:flutter/material.dart';

// /// 🔹 ChatBot Section
// class ChatBotSection extends StatefulWidget {
//   const ChatBotSection({super.key});

//   @override
//   State<ChatBotSection> createState() => _ChatBotSectionState();
// }

// class _ChatBotSectionState extends State<ChatBotSection> {
//   final _formKey = GlobalKey<FormState>();

//   // Controllers for inputs
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _studyCompletedController =
//       TextEditingController();
//   final TextEditingController _countryController = TextEditingController();

//   bool lookingForAbroad = false;

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     _mobileController.dispose();
//     _emailController.dispose();
//     _studyCompletedController.dispose();
//     _countryController.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       final data = {
//         "lookingForAbroad": lookingForAbroad,
//         "fullName": _fullNameController.text.trim(),
//         "mobile": _mobileController.text.trim(),
//         "email": _emailController.text.trim(),
//         "studyCompleted": _studyCompletedController.text.trim(),
//         "preferredCountry": _countryController.text.trim(),
//       };

//       // ✅ Here you can send data to your Database (API / Firebase)
//       debugPrint("Student Data: $data");

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Your info has been submitted ✅")),
//       );
//     }
//   }

//   InputDecoration _inputDecoration(String label) {
//     return InputDecoration(
//       labelText: label,
//       border: OutlineInputBorder(
//         borderSide: const BorderSide(color: Colors.red, width: 2),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: Colors.red, width: 2),
//         borderRadius: BorderRadius.circular(12),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(16),
//       elevation: 6,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "💬 Study Abroad ChatBot",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red,
//                 ),
//               ),
//               const SizedBox(height: 16),

//               /// Looking for Study Abroad
//               Row(
//                 children: [
//                   const Text("Looking for Study Abroad?"),
//                   const SizedBox(width: 12),
//                   Switch(
//                     activeColor: Colors.red,
//                     value: lookingForAbroad,
//                     onChanged: (val) {
//                       setState(() => lookingForAbroad = val);
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               /// Full Name
//               TextFormField(
//                 controller: _fullNameController,
//                 decoration: _inputDecoration("Full Name"),
//                 validator: (val) =>
//                     val!.isEmpty ? "Please enter your name" : null,
//               ),
//               const SizedBox(height: 16),

//               /// Mobile
//               TextFormField(
//                 controller: _mobileController,
//                 keyboardType: TextInputType.phone,
//                 decoration: _inputDecoration("Mobile Number"),
//                 validator: (val) =>
//                     val!.isEmpty ? "Please enter your mobile" : null,
//               ),
//               const SizedBox(height: 16),

//               /// Email
//               TextFormField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: _inputDecoration("Email"),
//                 validator: (val) =>
//                     val!.contains("@") ? null : "Enter valid email",
//               ),
//               const SizedBox(height: 16),

//               /// Higher Study Completed
//               TextFormField(
//                 controller: _studyCompletedController,
//                 decoration: _inputDecoration("Higher Study Completed"),
//                 validator: (val) =>
//                     val!.isEmpty ? "Please enter your completed study" : null,
//               ),
//               const SizedBox(height: 16),

//               /// Preferred Country
//               TextFormField(
//                 controller: _countryController,
//                 decoration: _inputDecoration("Preferred Country"),
//                 validator: (val) =>
//                     val!.isEmpty ? "Please enter preferred country" : null,
//               ),
//               const SizedBox(height: 20),

//               /// Submit Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _submitForm();

//                       // ✅ Redirect to Home (BottomNav)
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const BottomNav(),
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 32,
//                       vertical: 14,
//                     ),
//                   ),
//                   child: const Text(
//                     "Submit",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:eduwise/screens/default/signin/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_bot_provider.dart';

class ChatBotSection extends StatelessWidget {
  const ChatBotSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatBotProvider>(
      builder: (context, chat, child) {
        final step = chat.currentStep;

        final questions = [
          "Looking for Study Abroad?",
          "What is your full name?",
          "Enter your mobile number",
          "Enter your email address",
          "What higher study have you completed?",
          "Which country do you prefer?",
        ];

        debugPrint("🟢 ChatBotSection rebuild → step=$step");

        return Card(
          margin: const EdgeInsets.all(16),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "💬 Study Abroad ChatBot",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),

                /// Guard against out-of-range
                if (step < questions.length) ...[
                  Text(
                    questions[step],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                if (step == 0) ...[
                  SwitchListTile(
                    title: const Text("Looking for Study Abroad?"),
                    activeColor: Colors.red,
                    value: chat.lookingForAbroad,
                    onChanged: (val) => chat.toggleAbroad(val),
                  ),
                ] else if (step == 1) ...[
                  _inputField(
                    hint: "Full Name",
                    onSubmit: (val) => chat.setFullName(val),
                  ),
                ] else if (step == 2) ...[
                  _inputField(
                    hint: "Mobile Number",
                    keyboard: TextInputType.phone,
                    onSubmit: (val) => chat.setMobile(val),
                  ),
                ] else if (step == 3) ...[
                  _inputField(
                    hint: "Email Address",
                    keyboard: TextInputType.emailAddress,
                    onSubmit: (val) => chat.setEmail(val),
                  ),
                ] else if (step == 4) ...[
                  _inputField(
                    hint: "Higher Study Completed",
                    onSubmit: (val) => chat.setStudyCompleted(val),
                  ),
                ] else if (step == 5) ...[
                  _inputField(
                    hint: "Preferred Country",
                    onSubmit: (val) => chat.setPreferredCountry(val),
                  ),
                ] else ...[
                  const Text(
                    "✅ Thanks! Your info has been submitted.",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint("📦 Final Student Data: ${chat.getData}");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      "Go to Home",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _inputField({
    required String hint,
    required Function(String) onSubmit,
    TextInputType keyboard = TextInputType.text,
  }) {
    final controller = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: keyboard,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.send, color: Colors.red),
          onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              debugPrint("✏️ Input for '$hint': ${controller.text.trim()}");
              onSubmit(controller.text.trim());
            } else {
              debugPrint("⚠️ Empty input ignored for '$hint'");
            }
          },
        ),
      ],
    );
  }
}

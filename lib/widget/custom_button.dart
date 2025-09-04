import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // Button text
  final Color color; // Button color
  final Widget destination; // Destination Screen

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // full width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // rounded corners
          ),
          elevation: 4, // shadow
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // text color
          ),
        ),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final String text; // Button text
  final Color color; // Button color
  final Widget destination; // Destination Screen

  const ContactButton({
    super.key,
    required this.text,
    required this.color,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // full width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // rounded corners
          ),
          elevation: 4, // shadow
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // text color
          ),
        ),
      ),
    );
  }
}



/*

CustomButton(
                          text: "SignIn",
                          color: Colors.red,
                          destination: const BottomNav(),
                        ),

*/
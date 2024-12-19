import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Added padding for better spacing
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align content to the start
            children: [
              const Text(
                "PROFILE",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24, // Added font size for better visibility
                  fontWeight: FontWeight.bold, // Made text bold
                ),
              ),
              const SizedBox(height: 20), // Spacer for vertical separation
              Align(
                // Align the container to the right
                child: Container(
                  padding: const EdgeInsets.all(
                      10.0), // Padding inside the container
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: const Text(
                    "Your Text Here",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Added font size for better readability
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

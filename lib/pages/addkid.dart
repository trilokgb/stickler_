import 'package:flutter/material.dart';

class Addkid extends StatelessWidget {
  const Addkid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Stickl3r"),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome To",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Stickl3r",
              style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text("Lets get started by adding your kids profile"),
            const SizedBox(height: 50),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/manage_activities');
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(250, 60)),
              child: const Text('Manage Kid'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddkidDashboard extends StatefulWidget {
  const AddkidDashboard({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AddkidDashboardState createState() => _AddkidDashboardState();
}

class _AddkidDashboardState extends State<AddkidDashboard> {
  String? _gender = 'Male';

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
              "Activity",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.person, size: 80),
            const SizedBox(height: 20), // Decreased height from 120 to 20
            Padding(
              padding:
                  const EdgeInsets.all(10), // Decreased padding from 15 to 10
              child: Container(
                width: 500, // Set the desired width here
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Kid Name',
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.all(10), // Decreased padding from 15 to 10
              child: Container(
                width: 500, // Set the desired width here
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'AGE',
                    hintText: 'Enter Children Age',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Male'),
              leading: Radio<String>(
                value: 'Male',
                groupValue: _gender,
                onChanged: (String? value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio<String>(
                value: 'Female',
                groupValue: _gender,
                onChanged: (String? value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to the dashboard
                Navigator.pushNamed(context, '/manage_activities');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
                minimumSize: const Size(250, 60),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

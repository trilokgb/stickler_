import 'package:flutter/material.dart';

class PointsForm extends StatefulWidget {
  const PointsForm({super.key});

  @override
  _PointsFormState createState() => _PointsFormState();
}

class _PointsFormState extends State<PointsForm> {
  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _rewardsController = TextEditingController();

  void _saveData() {
    final String points = _pointsController.text;
    final String rewards = _rewardsController.text;

    Navigator.pop(
      context,
      {
        'points': points,
        'rewards': rewards,
      },
    );
  }

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
              "Add New ",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Points & Rewards ",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 500,
                child: TextField(
                  controller: _pointsController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'POINTS',
                    hintText: 'Enter points',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 500,
                child: TextField(
                  controller: _rewardsController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Rewards',
                    hintText: 'Enter Rewards',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 54, 81, 94),
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

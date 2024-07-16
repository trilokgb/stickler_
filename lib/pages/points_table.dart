import 'package:flutter/material.dart';

class PointsTable extends StatelessWidget {
  final List<Map<String, dynamic>> rewards = [
    {'range': '0 to 4000 Points', 'reward': 'No Reward'},
    {'range': '4001 to 6000 Points', 'reward': 'INR 100'},
    {'range': '6001 to 8000 Points', 'reward': 'INR 400'},
    {'range': 'Above 8001 Points', 'reward': 'Max Reward INR 500'},
    {'range': 'Above 10000 Points', 'reward': 'Surprise Gift'},
  ];

  PointsTable({super.key, required List<Map<String, dynamic>> rewards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/menu');
            // Handle back button press
          },
        ),
        title: const Text('Rewards for Points'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle add new button press
            },
            child: const Text('Add new', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Max Reward',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: rewards.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(rewards[index]['range']),
                  trailing: Text(rewards[index]['reward']),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/points_form");
                },
                backgroundColor: const Color.fromARGB(255, 54, 81, 94),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Add New',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

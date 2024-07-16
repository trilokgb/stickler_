import 'package:flutter/material.dart';
import 'package:flutter_demo_app1/pages/child_done_activities.dart';

void main() {
  runApp(MaterialApp(
    home: const ManageActivities(),
    routes: {
      '/child_done_activities': (context) =>
          ChildDoneActivities(initialDate: DateTime.now()),
    },
  ));
}

class ManageActivities extends StatefulWidget {
  const ManageActivities({super.key});

  @override
  _ManageActivitiesState createState() => _ManageActivitiesState();
}

class _ManageActivitiesState extends State<ManageActivities> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different screens based on the selected index
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivitiesList()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PointsTable()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Manage Activities'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Kids:',
              style: TextStyle(
                fontSize: 25,
                height: 2,
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/child_done_activities');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(1.0),
                    padding: const EdgeInsets.all(10),
                    width: 120.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 57, 103, 110),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 50,
                        ),
                        Text(
                          'Kid-1',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(1.0),
                  padding: const EdgeInsets.all(10),
                  width: 120.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 57, 103, 110),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 50,
                      ),
                      Text(
                        'Kid-2',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'Activities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Rewards',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 2, 2, 2),
        backgroundColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addkid_dashboard');
                },
                backgroundColor: const Color.fromARGB(255, 54, 81, 94),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Add Kid',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ActivitiesList extends StatelessWidget {
  final List<Map<String, dynamic>> rewards = [
    {
      'Activity': 'Wake up',
      'Description': 'Wake up early in the morning',
      'Points': '50 points'
    },
    {
      'Activity': 'Exercise/Yoga',
      'Description': 'Physical exercises & yoga',
      'Points': '80 points'
    },
    {
      'Activity': 'Play/Homework',
      'Description': 'Do your homework/play outside',
      'Points': '100 points'
    },
  ];

  ActivitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Activities Table'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text(
                'Assigned - Activities',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 54, 81, 94),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                final reward = rewards[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reward['Activity'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  reward['Description'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            reward['Points'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit,
                                color: Color.fromARGB(255, 54, 81, 94)),
                            onPressed: () {
                              // Handle edit action
                              Navigator.pushNamed(context, "/edit_reward",
                                  arguments: reward);
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                  ],
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
                  Navigator.pushNamed(context, "/activity_form");
                },
                backgroundColor: const Color.fromARGB(255, 54, 81, 94),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Create New',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PointsTable extends StatelessWidget {
  final List<Map<String, dynamic>> rewards = [
    {'range': '0000 to 4000 Points', 'reward': 'No Reward'},
    {'range': '4001 to 6000 Points', 'reward': 'INR 100'},
    {'range': '6001 to 8000 Points', 'reward': 'INR 400'},
    {'range': '8001 to 10000 points', 'reward': 'INR 500'},
    {'range': 'Above 10000 points', 'reward': 'Surprise Gift'},
  ];

  PointsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Points Table'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text(
                'Assigned - Rewards',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 54, 81, 94),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                final reward = rewards[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              reward['range'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              reward['reward'],
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit,
                                color: Color.fromARGB(255, 54, 81, 94)),
                            onPressed: () {
                              // Handle edit action
                              Navigator.pushNamed(context, "/edit_reward",
                                  arguments: reward);
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                  ],
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
          ),
        ],
      ),
    );
  }
}

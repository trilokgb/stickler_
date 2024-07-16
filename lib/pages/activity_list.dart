import 'package:flutter/material.dart';

class Activitieslist extends StatelessWidget {
  const Activitieslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Asigned-Activities'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Text("This is Asigned Activity list "),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(onPressed: () {
                Navigator.pushNamed(context, "/activity_form");
              })
            ],
          )
        ],
      ),
    );
  }
}

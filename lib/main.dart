import 'package:flutter/material.dart';
import 'package:flutter_demo_app1/pages/activity_form.dart';
import 'package:flutter_demo_app1/pages/activity_list.dart';

import 'package:flutter_demo_app1/pages/addkid_dashboard.dart';
import 'package:flutter_demo_app1/pages/addkid.dart';
import 'package:flutter_demo_app1/pages/child_done_activities.dart';

import 'package:flutter_demo_app1/pages/manage_activities.dart';

import 'package:flutter_demo_app1/pages/points_form.dart';

import 'package:flutter_demo_app1/pages/signin_validation.dart';
import 'pages/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stickl3r',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SignInScreen(),
        '/signin_validation': (context) => const SignInvalidation(),
        '/addkid': (context) => const Addkid(),
        '/addkid_dashboard': (context) => const AddkidDashboard(),
        '/manage_activities': (context) => const ManageActivities(),
        '/activity_list': (context) => const Activitieslist(),
        '/activity_form': (context) => const ActivitiesForm(),
        '/points_form': (context) => const PointsForm(),
        '/child_done_activities': (context) =>
            ChildDoneActivities(initialDate: DateTime.now()),
      },
    );
  }
}

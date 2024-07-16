import 'package:flutter/material.dart';
import 'package:flutter_demo_app1/pages/manage_activities.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ChildDoneActivities extends StatelessWidget {
  const ChildDoneActivities({super.key, required this.initialDate});

  final DateTime initialDate;

  @override
  Widget build(BuildContext context) {
    return const PointsEarned(title: 'Children Activities Status');
  }
}

class PointsEarned extends StatefulWidget {
  const PointsEarned({super.key, required this.title});

  final String title;

  @override
  _PointsEarnedState createState() => _PointsEarnedState();
}

class _PointsEarnedState extends State<PointsEarned> {
  final CalendarView _calendarView = CalendarView.week;
  final DateTime _focusedDate = DateTime.now();
  bool _isEditing = false;
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text("Activities Status"),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
                if (_isEditing) {
                  _calendarController.view = CalendarView.schedule;
                } else {
                  _calendarController.view = _calendarView;
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 400, // Reduced the height of the calendar
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SfCalendar(
              controller: _calendarController,
              view: _calendarView,
              firstDayOfWeek: 1, // Monday
              dataSource: MeetingDataSource(getAppointments()),
              initialDisplayDate: _focusedDate,
              headerHeight: 40,
              viewHeaderHeight: 60,
              timeSlotViewSettings: const TimeSlotViewSettings(
                timeIntervalWidth: 60,
                timeIntervalHeight: 40,
                startHour: 4,
                endHour: 24,
              ),
              allowAppointmentResize: _isEditing,
              allowDragAndDrop: _isEditing,
              onTap: (calendarTapDetails) {
                if (_isEditing && calendarTapDetails.appointments != null) {
                  // Handle tap on appointment for editing
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RewardsDashboard()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              minimumSize: const Size(120, 60),
            ),
            child: const Text('Go to Rewards Dashboard'),
          ),
        ],
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(
    Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Activity',
      color: const Color.fromARGB(255, 111, 124, 135),
      isAllDay: false,
    ),
  );

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

void main() {
  runApp(const Rewardsdb());
}

class Rewardsdb extends StatelessWidget {
  const Rewardsdb({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RewardsDashboard(),
    );
  }
}

class RewardsDashboard extends StatefulWidget {
  const RewardsDashboard({super.key});

  @override
  _RewardsDashboardState createState() => _RewardsDashboardState();
}

class _RewardsDashboardState extends State<RewardsDashboard> {
  DateTime _selectedDate = DateTime.now();

  void _previousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateUtils.getDaysInMonth(_selectedDate.year, _selectedDate.month);
    final firstDayOfMonth =
        DateTime(_selectedDate.year, _selectedDate.month, 1);
    final firstWeekdayOfMonth = firstDayOfMonth.weekday;

    List<String> weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Children Points Dashboard"),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _previousMonth,
              ),
              Text(
                DateFormat('MMMM yyyy').format(_selectedDate),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: _nextMonth,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 7,
                  children:
                      weekDays.map((day) => Center(child: Text(day))).toList(),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                  ),
                  itemCount: daysInMonth + firstWeekdayOfMonth - 1,
                  itemBuilder: (context, index) {
                    if (index < firstWeekdayOfMonth - 1) {
                      return Container(); // Empty container for days of the previous month
                    }
                    final day = index - firstWeekdayOfMonth + 2;
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                            height: 15,
                            margin: const EdgeInsets.only(left: 30),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 107, 126, 135),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                day.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Rewards Earned So Far: 100',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Points Earned So Far: 250',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PointsTable()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              minimumSize: const Size(120, 60),
            ),
            child: const Text('Check Rewards Dashboard'),
          ),
        ],
      ),
    );
  }
}

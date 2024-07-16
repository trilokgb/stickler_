import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ActivitiesForm extends StatefulWidget {
  const ActivitiesForm({super.key});

  @override
  _ActivitiesFormState createState() => _ActivitiesFormState();
}

class _ActivitiesFormState extends State<ActivitiesForm> {
  final TextEditingController _activityNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();
  String _frequency = 'Daily'; // Default frequency
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  File? _selectedImage;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Center(
          child: Text("Create New Activity"),
        ),
        backgroundColor: Colors.blue,
        flexibleSpace: const Divider(
          color: Colors.grey,
          height: 1,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _activityNameController,
              decoration: const InputDecoration(
                labelText: 'Activity Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _pointsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Points',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            // Image upload field (for demonstration)
            MaterialButton(
                color: Colors.blue,
                child: const Text('Upload Image'),
                onPressed: () {
                  _uploadImage();
                }),

            const SizedBox(height: 16.0),
            _selectedImage != null
                ? Image.file(_selectedImage!)
                : DropdownButtonFormField<String>(
                    value: _frequency,
                    onChanged: (String? value) {
                      setState(() {
                        _frequency = value!;
                      });
                    },
                    items: <String>['Daily', 'Weekly'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Frequency',
                      border: OutlineInputBorder(),
                    ),
                  ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                        'Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text(
                        'Time: ${_selectedTime.hour}:${_selectedTime.minute}'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/manage_activities');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future _uploadImage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}

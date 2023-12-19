import 'package:flutter/material.dart';

@immutable
class AddTaskPage extends StatefulWidget {
  final Function(String, DateTime) onTaskAdded;

  const AddTaskPage({super.key, required this.onTaskAdded});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _taskController = TextEditingController();
  late DateTime _dueDate;

  @override
  void initState() {
    super.initState();
    _dueDate = DateTime.now();
  }

  Future<void> _pickDueDate() async {
    DateTime currentDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _dueDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _taskController,
                decoration: const InputDecoration(labelText: 'Task'),
              ),
              const SizedBox(height: 16.0),
              Center(child: Text('Due Date: ${_dueDate.toLocal()}')),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _pickDueDate();
                  },
                  child: const Text('Select Due Date'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add the task to the list on the main page
                    widget.onTaskAdded(_taskController.text, _dueDate);

                    // Navigate back to the main page
                    Navigator.pop(context);
                  },
                  child: const Text('Add Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

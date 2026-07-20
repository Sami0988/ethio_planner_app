import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Padding(padding: EdgeInsets.all(8), child: Text('Reminder')));
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_names.dart';

class ShellPage extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const ShellPage({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny_rounded),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Reminders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Planner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.print),
            label: 'Print',
          ),
        ],
        onTap: (index) {
          final routes = [
            RouteNames.home,
            RouteNames.calendar,
            RouteNames.reminders,
            RouteNames.planner,
            RouteNames.print,
          ];
          context.go(routes[index]);
        },
      ),
    );
  }
}

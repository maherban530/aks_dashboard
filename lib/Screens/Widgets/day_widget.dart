import 'package:flutter/material.dart';

import '../../Models/dashboard_model.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({Key? key, required this.dashboardCalender})
      : super(key: key);

  final DashboardCalender dashboardCalender;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(dashboardCalender.day ?? ''),
          const SizedBox(height: 8),
          Text(dashboardCalender.date ?? ''),
          const SizedBox(height: 8),
          Icon(Icons.circle,
              size: 8,
              color: dashboardCalender.color == 'green'
                  ? Colors.green
                  : Colors.black),
        ],
      ),
    );
  }
}

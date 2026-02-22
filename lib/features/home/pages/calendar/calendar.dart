import 'package:flutter/material.dart';
import 'package:simple_life/features/home/widget/week_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  DateTime selectedDay = DateTime.now();

  void onChangeSelectedDay(DateTime day) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [_buildHeader(), _buildBody()]));
  }

  Widget _buildHeader() {
    return WeekCalendar(
      selectDay: selectedDay,
      onChange: onChangeSelectedDay,
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Center(child: Image.asset('assets/images/empty_task.png')),
    );
  }
}

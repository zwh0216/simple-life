import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WeekCalendar extends StatelessWidget {
  const WeekCalendar({
    super.key,
    this.startDay,
    required this.selectDay,
    required this.onChange,
  });

  // 展示的中间日期
  final DateTime? startDay;

  // 当前选中的日期
  final DateTime selectDay;

  // 修改选中日期
  final void Function(DateTime day) onChange;

  StartingDayOfWeek getWeekDayByDateTime(DateTime date) {
    final Map<int, StartingDayOfWeek> map = {
      1: StartingDayOfWeek.monday,
      2: StartingDayOfWeek.tuesday,
      3: StartingDayOfWeek.wednesday,
      4: StartingDayOfWeek.thursday,
      5: StartingDayOfWeek.friday,
      6: StartingDayOfWeek.saturday,
      7: StartingDayOfWeek.sunday,
    };

    return map[date.weekday] ?? StartingDayOfWeek.sunday;
  }

  @override
  Widget build(BuildContext context) {
    final startDate = startDay ?? DateTime.now().subtract(Duration(days: 3));
    final focusedDay = startDate.add(Duration(days: 3));
    final endDate = startDate.add(Duration(days: 7));
    final startingDayOfWeek = getWeekDayByDateTime(startDate);

    return TableCalendar(
      startingDayOfWeek: startingDayOfWeek,
      headerVisible: false,
      calendarFormat: CalendarFormat.week,
      focusedDay: focusedDay,
      currentDay: selectDay,
      firstDay: startDate,
      lastDay: endDate,
      onDaySelected: (DateTime day, _) {
        onChange(day);
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

///Renders calendar widget

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pushNamed("/curved"),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SfCalendar(
          /*     headerHeight: 70, */
          headerStyle: const CalendarHeaderStyle(
            backgroundColor: Color.fromARGB(255, 183, 143, 252),
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          backgroundColor: Colors.grey[200],
          view: CalendarView.month,
          dataSource: _MeetingDataSource(_getDataSource()),
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: true),
        ));
  }

  List<_Meeting> _getDataSource() {
    final List<_Meeting> meetings = <_Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
      _Meeting('Mentor Buluşması', startTime, endTime, const Color(0xFF0F8644),
          false),
    );
    meetings.add(
      _Meeting('Kampüs Buluşması', startTime, endTime, const Color(0xFF0F8644),
          false),
    );
    return meetings;
  }
}

class _MeetingDataSource extends CalendarDataSource {
  _MeetingDataSource(List<_Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class _Meeting {
  _Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

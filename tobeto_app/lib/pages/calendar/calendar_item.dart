import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:tobeto_app/models/classes_model.dart';

class EventsData {
  List<NeatCleanCalendarEvent> events = [];

  EventsData(List<Classes> classesList) {
    for (Classes classes in classesList) {
      events.addAll(generateEventsForClass(classes));
    }
  }

  List<NeatCleanCalendarEvent> generateEventsForClass(Classes classes) {
    List<NeatCleanCalendarEvent> classEvents = [];

    for (int i = 0; i < 90; i += 7) {
      DateTime currentDate = classes.time.add(Duration(days: i));

      classEvents.add(
        NeatCleanCalendarEvent(
          classes.title,
          startTime: currentDate,
          endTime: currentDate.add(const Duration(hours: 3)),
          color: classes.color,
        ),
      );
    }
    return classEvents;
  }

  List<NeatCleanCalendarEvent> get baseList {
    return [
      ...events,
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:tobeto_app/api/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:tobeto_app/api/blocs/calendar_bloc/calendar_event.dart';
import 'package:tobeto_app/api/blocs/calendar_bloc/calendar_state.dart';
import 'package:tobeto_app/core/widget/background_image.dart';
import 'package:tobeto_app/core/drawer/my_advanced_drawer.dart';
import 'package:tobeto_app/core/drawer/my_appbar.dart';
import 'package:tobeto_app/core/drawer/my_drawer.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/models/classes_model.dart';
import 'package:tobeto_app/pages/calendar/calendar_item.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    Key? key,
    this.onMonthChanged,
  }) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
  final ValueChanged<DateTime>? onMonthChanged;
}

class _CalendarPageState extends State<CalendarPage> {
  late Classes classes;
  late EventsData eventsData;

  @override
  Widget build(BuildContext context) {
    final drawerController = AdvancedDrawerController();

    return MyAdvancedDrawer(
      drawer: MyDrawer(),
      controller: drawerController,
      child: BackgroundImage(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Expanded(
            child: Column(
              children: [
                DrawerTopBar(
                  drawerController: drawerController,
                  image: AppImage.calendar,
                ),
                Expanded(
                  child: BlocBuilder<ClassesBloc, ClassesState>(
                    builder: (context, state) {
                      if (state is ClassesInitial) {
                        context.read<ClassesBloc>().add(GetClasses());
                      }
                      if (state is ClassesLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ClassesLoaded) {
                        final classesList = state.classes;
                        eventsData = EventsData(classesList);

                        return Calendar(
                          dayOfWeekStyle: const TextStyle(fontSize: 18),

                          //Takvim o haftayı gösteriyo
                          //Başlangıç gününü mevcut günün bulunduğu pazartesi seçmesini istedim
                          startOnMonday: true,
                          //Hafta günlerinin kısaltmalarını buraya giriyoruz.
                          weekDays: const [
                            "Pzt",
                            "Sal",
                            "Çar",
                            "Per",
                            "Cum",
                            "Cmt",
                            "Paz"
                          ],
                          //Bulunduğu günü ay görünümüne büyütmek için
                          isExpandable: false,
                          todayColor: Colors.red,
                          todayButtonText: "Bugüne Git",
                          onMonthChanged: (day) {
                            if (widget.onMonthChanged != null) {
                              widget.onMonthChanged!(day);
                            }
                          },
                          eventsList: eventsData.baseList,
                          //Expandable kısmı  türkçeleştiriyor
                          locale: "tr_TR",
                          //AllDay evenet text'ini set ediyoruz
                          allDayEventText: "Tüm gün",
                          //Çoklu gün etkinliği son gün gösterimini set ediyoruz
                          multiDayEndText: "Son gün",
                          isExpanded: true,
                          eventTileHeight:
                              MediaQuery.of(context).size.height * 0.10,
                        );
                      }
                      if (state is ClassesError) {
                        return Center(child: Text(state.message));
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//---------------Days Datas-----------------------

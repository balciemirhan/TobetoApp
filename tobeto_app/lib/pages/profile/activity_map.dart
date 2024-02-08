import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/color.dart';

class ActivityMapWidget extends StatelessWidget {
  const ActivityMapWidget({
    Key? key,
  }) : super(key: key);

  activeBox({required Color color}) {
    return CircleAvatar(radius: 5, backgroundColor: color);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Aktivite Haritam",
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 52; i++)
                  Column(
                    children: [
                      for (int j = 0; j < 7; j++)
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: () {
                            if (i % 7 == 0 && j % 6 == 0) {
                              return AppColor.active4;
                            } else if (i % 5 == 0 && j % 4 == 0) {
                              return AppColor.active3;
                            } else if (i % 8 == 0 && j % 3 == 0) {
                              return AppColor.active2;
                            } else if (i % 3 == 0 && j % 2 == 0) {
                              return AppColor.active1;
                            } else {
                              return AppColor.active0;
                            }
                          }(),
                        ),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Icon(
                Icons.wb_sunny_outlined,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              activeBox(
                color: AppColor.active0,
              ),
              activeBox(
                color: AppColor.active1,
              ),
              activeBox(
                color: AppColor.active2,
              ),
              activeBox(
                color: AppColor.active3,
              ),
              activeBox(
                color: AppColor.active4,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.wb_sunny,
                size: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}

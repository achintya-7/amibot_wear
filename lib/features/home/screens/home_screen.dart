import 'package:amibot_wear/features/home/controllers/schedule_controllers.dart';
import 'package:amibot_wear/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear/wear.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheduleController = Get.find<ScheduleController>();
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: WatchShape(
          builder: (context, shape, child) => Obx(
            () {
              if (scheduleController.loading.value) {
                return loader();
              }

              if (scheduleController.classSchedule.value.isEmpty) {
                return const Center(child: Text('No Classes Today', style: TextStyle(fontSize: 15)));
              }

              return Center(
                child: SizedBox(
                  height: height * 0.65,
                  child: ListView.builder(
                    itemCount: scheduleController.classSchedule.value.length,
                    itemBuilder: (context, index) {
                      final classSchedule = scheduleController.classSchedule.value[index];
                      return ListTile(
                        dense: true,
                        leading: Icon(Icons.circle, color: scheduleController.colourResponder(classSchedule.attendance)),
                        isThreeLine: true,
                        title: Text(
                          '${classSchedule.courseCode} : ${classSchedule.courseName}',
                          style: const TextStyle(fontSize: 13),
                        ),
                        subtitle: Text(classSchedule.time, style: const TextStyle(fontSize: 11)),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

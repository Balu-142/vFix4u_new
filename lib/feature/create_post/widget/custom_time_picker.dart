// import 'package:demandium/common/widgets/time_picker_snipper.dart';
// import 'package:demandium/utils/core_export.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class CustomTimePicker extends StatelessWidget {
//   const CustomTimePicker({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
//       child: Row(
//         children: [
//           Text(
//             'time'.tr,
//             style: robotoBold.copyWith(
//               fontSize: Dimensions.fontSizeLarge,
//               color: Theme.of(Get.context!).colorScheme.primary,
//             ),
//           ),
//           const SizedBox(width: Dimensions.paddingSizeLarge),
//           GetBuilder<ScheduleController>(builder: (createPostController) {
//             DateTime initialTime = DateTime.now();
//
//             try {
//               if (createPostController.selectedTime.isNotEmpty) {
//                 final timeFormat = DateFormat('HH:mm:ss');
//                 final parsedTime = timeFormat.parse(createPostController.selectedTime);
//                 initialTime = DateTime(
//                   DateTime.now().year,
//                   DateTime.now().month,
//                   DateTime.now().day,
//                   parsedTime.hour,
//                   parsedTime.minute,
//                   parsedTime.second,
//                 );
//               }
//             } catch (e) {
//               initialTime = DateTime.now().add(const Duration(minutes: 2));
//             }
//
//             return TimePickerSpinner(
//               time: initialTime,
//               is24HourMode: Get.find<SplashController>()
//                   .configModel
//                   .content
//                   ?.timeFormat ==
//                   '24',
//               normalTextStyle: robotoRegular.copyWith(
//                 color: Theme.of(context).hintColor,
//                 fontSize: Dimensions.fontSizeSmall,
//               ),
//               highlightedTextStyle: robotoMedium.copyWith(
//                 fontSize: Dimensions.fontSizeLarge,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//               spacing: Dimensions.paddingSizeDefault,
//               itemHeight: Dimensions.fontSizeLarge + 2,
//               itemWidth: 50,
//               alignment: Alignment.topCenter,
//               isForce2Digits: true,
//               onTimeChange: (time) {
//                 final selectedHour = time.hour;
//                 final selectedMinute = time.minute;
//
//                 const minHour = 9;
//                 const maxHour = 23;
//
//                 bool isValid = (selectedHour > minHour && selectedHour < maxHour) ||
//                     (selectedHour == minHour && selectedMinute >= 0) ||
//                     (selectedHour == maxHour && selectedMinute == 0);
//
//                 final formattedTime =
//                     '${time.hour.toString().padLeft(2, '0')}:' +
//                         '${time.minute.toString().padLeft(2, '0')}:' +
//                         '${time.second.toString().padLeft(2, '0')}';
//
//                 // Always update time in controller
//                 createPostController.selectedTime = formattedTime;
//                 createPostController.update();
//
//                 if (isValid) {
//                   createPostController.buildSchedule(
//                     scheduleType: ScheduleType.schedule,
//                   );
//                 } else {
//                   // customSnackBar(
//                   //   'Please select a time between 9:00 AM and 11:00 PMRa',
//                   //   showDefaultSnackBar: false,
//                   // );
//                 }
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }


/////below saif

// import 'package:demandium/common/widgets/time_picker_snipper.dart';
// import 'package:demandium/utils/core_export.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class CustomTimePicker extends StatelessWidget {
//   const CustomTimePicker({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
//       child: Row(
//         children: [
//           Text('time'.tr,
//               style: robotoBold.copyWith(
//                   fontSize: Dimensions.fontSizeLarge,
//                   color: Theme.of(Get.context!).colorScheme.primary)),
//           const SizedBox(width: Dimensions.paddingSizeLarge),
//           GetBuilder<ScheduleController>(builder: (createPostController) {
//             // Initialize selected time
//             DateTime initialTime = DateTime.now();
//             try {
//               if (createPostController.selectedTime.isNotEmpty) {
//                 final timeFormat = DateFormat('HH:mm:ss');
//                 final parsedTime = timeFormat.parse(createPostController.selectedTime);
//                 initialTime = DateTime(
//                   DateTime.now().year,
//                   DateTime.now().month,
//                   DateTime.now().day,
//                   parsedTime.hour,
//                   parsedTime.minute,
//                   parsedTime.second,
//                 );
//               }
//             } catch (e) {
//               initialTime = DateTime.now().add(const Duration(minutes: 2));
//             }
//
//             return TimePickerSpinner(
//               time: initialTime,
//               is24HourMode: Get.find<SplashController>()
//                   .configModel
//                   .content
//                   ?.timeFormat ==
//                   '24',
//               normalTextStyle: robotoRegular.copyWith(
//                 color: Theme.of(context).hintColor,
//                 fontSize: Dimensions.fontSizeSmall,
//               ),
//               highlightedTextStyle: robotoMedium.copyWith(
//                 fontSize: Dimensions.fontSizeLarge,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//               spacing: Dimensions.paddingSizeDefault,
//               itemHeight: Dimensions.fontSizeLarge + 2,
//               itemWidth: 50,
//               alignment: Alignment.topCenter,
//               isForce2Digits: true,
//               onTimeChange: (time) {
//                 final int totalMinutes = time.hour * 60 + time.minute;
//                 const int minMinutes = 9 * 60; // 9:00 AM
//                 const int maxMinutes = 23 * 60; // 11:00 PM
//
//                 if (totalMinutes < minMinutes || totalMinutes > maxMinutes) {
//                   customSnackBar(
//                     'Please select a time between 9:00 AM and 11:00 PM',
//                     duration: 4,
//                     type: ToasterMessageType.error,
//                   );
//                   return;
//                 }
//
//                 if (time.hour == 12 && time.minute == 0) {
//                   customSnackBar(
//                     '12:00 PM selected',
//                     type: ToasterMessageType.info,
//                   );
//                 }
//
//                 // Save valid time
//                 createPostController.selectedTime =
//                 "${time.hour}:${time.minute}:00"; // Force seconds to zero
//                 createPostController.update();
//
//                 // createPostController.selectedTime =
//                 // "${time.hour}:${time.minute}:${time.second}";
//                 // createPostController.update();
//
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

///////////////////////////////////

import 'package:demandium/common/widgets/time_picker_snipper.dart';
import 'package:demandium/utils/core_export.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Row(
        children: [
          Text(
            'Time'.tr,
            style: robotoBold.copyWith(
              fontSize: Dimensions.fontSizeLarge,
              color: Theme.of(Get.context!).colorScheme.primary,
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeLarge),
          GetBuilder<ScheduleController>(builder: (createPostController) {
            DateTime initialTime = DateTime.now();

            try {
              if (createPostController.selectedTime.isNotEmpty) {
                final timeFormat = DateFormat('HH:mm:ss');
                final parsedTime = timeFormat.parse(createPostController.selectedTime);
                initialTime = DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  parsedTime.hour,
                  parsedTime.minute,
                  parsedTime.second,
                );
              }
            } catch (e) {
              initialTime = DateTime.now().add(const Duration(minutes: 2));
            }

            return TimePickerSpinner(
              time: initialTime,
              is24HourMode: Get.find<SplashController>()
                  .configModel
                  .content
                  ?.timeFormat ==
                  '24',
              normalTextStyle: robotoRegular.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: Dimensions.fontSizeSmall,
              ),
              highlightedTextStyle: robotoMedium.copyWith(
                fontSize: Dimensions.fontSizeLarge,
                color: Theme.of(context).colorScheme.primary,
              ),
              spacing: Dimensions.paddingSizeDefault,
              itemHeight: Dimensions.fontSizeLarge + 2,
              itemWidth: 50,
              alignment: Alignment.topCenter,
              isForce2Digits: true,
              onTimeChange: (time) {
                final selectedHour = time.hour;
                final selectedMinute = time.minute;

                const minHour = 9;
                const maxHour = 23;

                bool isValid = (selectedHour > minHour && selectedHour < maxHour) ||
                    (selectedHour == minHour && selectedMinute >= 0) ||
                    (selectedHour == maxHour && selectedMinute == 0);

                final formattedTime =
                    '${time.hour.toString().padLeft(2, '0')}:' +
                        '${time.minute.toString().padLeft(2, '0')}:' +
                        '${time.second.toString().padLeft(2, '0')}';

                // Always update time in controller
                createPostController.selectedTime = formattedTime;
                createPostController.update();

                if (isValid) {
                  createPostController.disableOkButtonTemporarily(); // <-- FREEZE BUTTON
                  createPostController.buildSchedule(
                    scheduleType: ScheduleType.schedule,
                  );
                } else {
                  // Uncomment this if you want to notify user:
                  // customSnackBar(
                  //   'Please select a time between 9:00 AM and 11:00 PM',
                  //   showDefaultSnackBar: false,
                  // );
                }
              },

            );
          }),
        ],
      ),
    );
  }
}
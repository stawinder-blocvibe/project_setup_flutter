// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
//
// class CustomNotificationManager {
//   static Future<void> initialize() async {
//     await AwesomeNotifications().initialize(
//         null,
//         [
//           /*NotificationChannel(
//               channelKey: 'basic_channel',
//               channelGroupKey: 'basic_channel',
//               channelName: 'basic',
//               channelDescription: 'basic_description',
//               importance: NotificationImportance.Max,
//               channelShowBadge: true,
//               playSound: true,
//               criticalAlerts: true,
//               onlyAlertOnce: true,
//               defaultColor:  Colors.black,
//               ledColor: Colors.white)*/
//
//           NotificationChannel(
//               channelKey: 'custom_notification',
//               channelGroupKey: 'custom_notification',
//               channelName: 'basic',
//               channelDescription: 'custom_notification',
//               importance: NotificationImportance.Max,
//               channelShowBadge: true,
//               playSound: true,
//               criticalAlerts: true,
//               onlyAlertOnce: true,
//               defaultColor: Colors.black,
//               ledColor: Colors.white)
//         ],
//         debug: true);
//     await AwesomeNotifications()
//         .isNotificationAllowed()
//         .then((isAllowed) async {
//       if (!isAllowed) {
//         await AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//
//     await AwesomeNotifications().setListeners(
//         onActionReceivedMethod: onActionReceivedMethod,
//         onNotificationCreatedMethod: onNotificationCreatedMethod,
//         onNotificationDisplayedMethod: onNotificationDisplayedMethod,
//         onDismissActionReceivedMethod: onDismissActionReceivedMethod);
//   }
//
//   static Future<void> show({
//     required final String title,
//     required final String body,
//     final String? summary,
//     final Map<String, String>? payload,
//     final ActionType actionType = ActionType.Default,
//     final NotificationLayout notificationLayout = NotificationLayout.Default,
//     final NotificationCategory? category,
//     final String? bigPicture,
//     final List<NotificationActionButton>? actionButtons,
//     final bool scheduled = false,
//     final int? interval,
//   }) async {
//     assert(!scheduled || (scheduled && interval != null));
//     await AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 0,
//           channelKey: 'basic_channel',
//           title: title,
//           body: body,
//           actionType: actionType,
//           notificationLayout: notificationLayout,
//           summary: summary,
//           category: category,
//           payload: payload,
//           bigPicture: bigPicture,
//         ),
//         actionButtons: actionButtons,
//         schedule: scheduled
//             ? NotificationInterval(
//                 interval: interval,
//                 timeZone:
//                     await AwesomeNotifications().getLocalTimeZoneIdentifier(),
//                 preciseAlarm: true)
//             : null);
//   }
//
//   static Future<void> onNotificationCreatedMethod(
//       ReceivedNotification receivedNotification) async {}
//
//   static Future<void> onActionReceivedMethod(
//       ReceivedAction receivedAction) async {}
//
//   static Future<void> onNotificationDisplayedMethod(
//       ReceivedNotification receivedNotification) async {}
//
//   static Future<void> onDismissActionReceivedMethod(
//       ReceivedAction receivedAction) async {}
// }

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class Localnotificationservice {
//   // var onSelectionNotification;

//   Localnotificationservice();

//   final _localNotificationservice = FlutterLocalNotificationsPlugin();

//   Future<void> intialize() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('@drawable/ic_stat_android');
//     final InitializationSettings settings =
//         InitializationSettings(android: androidInitializationSettings);

//     await _localNotificationservice.initialize(settings);
//   }

//   Future<NotificationDetails> _notificationDetails() async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       'channelId',
//       'channelName',
//       channelDescription: 'description',
//       importance: Importance.max,
//       priority: Priority.max,
//     );

//     return const NotificationDetails(
//       android: androidNotificationDetails,
//     );
//   }

//   Future<void> showNotification(
//       {required int id, required String title, required String body}) async {
//     final details = await _notificationDetails();
//     await _localNotificationservice.show(id, title, body, details);
//   }

//   void onDidReceiveLocalNotification(int id, String? title, String? payload) {
//     print('id $id');
//   }

//   void onSelectionNotification(String? payload) {
//     print('payload $payload');
//   }
// }

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    intialize();
    super.initState();
  }

  var dtime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("h"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  await showNotification(
                      id: 1, title: "chai pilo dosto", body: "Tea time bro");
                },
                child: Text("show notification"),
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTime,
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                onChanged: (val) {
                  // print(val + "onChanged");
                  setState(() {
                    dtime = val;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  showscheduleNotification();
                },
                child: Text("schedule notification"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final _localNotificationservice = FlutterLocalNotificationsPlugin();

  Future<void> intialize() async {
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    InitializationSettings settings =
        InitializationSettings(android: androidInitializationSettings);

    await _localNotificationservice.initialize(settings);
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '1',
      'Notifications app',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
    );

    return const NotificationDetails(
      android: androidNotificationDetails,
    );
  }

  Future<void> showNotification(
      {required int id, required String title, required String body}) async {
    final details = await _notificationDetails();
    await _localNotificationservice.show(id, title, body, details);
  }

  Future<void> showscheduleNotification() async {
    final moonLanding = DateTime.parse(dtime);
    final details = await _notificationDetails();
    // ignore: deprecated_member_use
    await _localNotificationservice.showDailyAtTime(
      0,
      'Subscibe Now',
      'Thank you',
      Time(
        moonLanding.hour,
        moonLanding.minute,
        moonLanding.second,
      ),
      details,
    );
  }
}

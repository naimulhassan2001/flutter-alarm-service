import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init();
  await Alarm.setNotificationOnAppKillContent(
      "Alarm", "this time alarm set you");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Alarm"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Switch(
                value: isSwitch,
                onChanged: (value) async {
                  isSwitch = value;

                  if (value == true) {
                    print(DateTime.now());

                    final alarmSettings = AlarmSettings(
                      id: 42,
                      dateTime: DateTime.parse("2024-02-13 17:20:00.762941"),
                      assetAudioPath: 'assets/alarm.mp3',
                      loopAudio: true,
                      vibrate: true,
                      volume: 0.8,
                      fadeDuration: 3.0,
                      notificationTitle: 'This is the title',
                      notificationBody: 'This is the body',
                      enableNotificationOnKill: true,
                    );
                    await Alarm.set(alarmSettings: alarmSettings);
                  }

                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

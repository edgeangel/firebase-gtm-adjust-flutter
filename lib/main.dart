import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AdjustConfig config = AdjustConfig('ADJUST_APP_TOKEN', AdjustEnvironment.sandbox);
  Adjust.start(config);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> _sendTestEvent() async {
    await analytics.logEvent(
      name: "test_event",
      parameters: {
        "text_param": "text_value",
      },
    );
  }

  Future<void> _sendAdjustTestEvent() async {
    await analytics.logEvent(
      name: "adjust_test_event",
      parameters: {
        "value": 0.07,
        "currency": "EUR",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://assets.edgeangel.co/app-firebase-gtm-adjust-img.png',
                height: 100, // Adjust the height as needed
              ),
              const SizedBox(height: 24.0), // Add some space between the image and the first button
              ElevatedButton(
                onPressed: _sendTestEvent,
                child: const Text('Send test_event'),
              ),
              const SizedBox(height: 16.0), // Add some space between the buttons
              ElevatedButton(
                onPressed: _sendAdjustTestEvent,
                child: const Text('Send adjust_test_event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

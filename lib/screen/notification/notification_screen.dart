import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = '/notification_screen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final message =
        (ModalRoute.of(context)!.settings.arguments) as RemoteMessage;
    return Scaffold(
      body: ListView(
        children: [
          Text('${message.notification?.title}'),
          Text('${message.notification?.body}'),
          Text('${message.data}')
        ],
      ),
    );
  }
}

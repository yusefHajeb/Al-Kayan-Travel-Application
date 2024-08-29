import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:yah_app/main.dart';
import 'package:yah_app/screen/notification/notification_screen.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print(fCMToken);
    initialPushNotifications();
  }

  void handelMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState
        ?.pushNamed(NotificationScreen.routeName, arguments: message);
  }

  Future initialPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handelMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);
    // FirebaseMessaging.onBackgroundMessage(handelBackgroundMessage);
  }

  Future<void> handelBackgroundMessage(RemoteMessage? message) async {
    // print('Body : ${message?.notification?.body}');
    // print('Title : ${message?.notification?.title}');
    // print("Payload : ${message?.data}");
  }
}

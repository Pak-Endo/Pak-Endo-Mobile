import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Function to handle notification tap in background
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // handle action
}

class NotificationServices {
  // Singleton instance
  static final NotificationServices instance = NotificationServices._instance();

  NotificationServices._instance();

  // Notification categories
  final String darwinNotificationCategoryText = 'textCategory';
  final String darwinNotificationCategoryPlain = 'plainCategory';

  // Notification action ID
  final String navigationActionId = 'id_3';

  // Variables for notification categories, plugin, and settings
  late final List<DarwinNotificationCategory> darwinNotificationCategories;
  late final FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  late final DarwinInitializationSettings initializationSettingsDarwin;

  // Android notification channel
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.max,
  );

  // Variables for Android notification details and settings
  late final AndroidNotificationDetails androidNotificationDetails;
  late final AndroidInitializationSettings initializationSettingsAndroid;

  // Variable for notification details
  late final NotificationDetails notificationDetails;

  // Function to initialize platform notifications
  Future<void> initializePlatformNotifications() async {
    /// ANDROID NOTIFICATION INITIALIZATION
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        ?.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/launcher_icon');

    /// IOS NOTIFICATION INITIALIZATION
    await flutterLocalNotificationsPlugin
        ?.resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    darwinNotificationCategories = <DarwinNotificationCategory>[
      DarwinNotificationCategory(
        darwinNotificationCategoryText,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.text(
            'text_1',
            'Action 1',
            buttonTitle: 'Send',
            placeholder: 'Placeholder',
          ),
        ],
      ),
      DarwinNotificationCategory(
        darwinNotificationCategoryPlain,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.plain('id_1', 'Action 1'),
          DarwinNotificationAction.plain(
            'id_2',
            'Action 2 (destructive)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.destructive,
            },
          ),
          DarwinNotificationAction.plain(
            navigationActionId,
            'Action 3 (foreground)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.foreground,
            },
          ),
          DarwinNotificationAction.plain(
            'id_4',
            'Action 4 (auth required)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.authenticationRequired,
            },
          ),
        ],
        options: <DarwinNotificationCategoryOption>{
          DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
        },
      )
    ];

    // Note: permissions aren't requested here just to demonstrate that can be
    // done later
    initializationSettingsDarwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {},
      notificationCategories: darwinNotificationCategories,
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);

    androidNotificationDetails = AndroidNotificationDetails(
        channel.id, channel.name,
        priority: Priority.high,
        channelDescription: 'your channel description',
        importance: Importance.high,
        styleInformation: const BigTextStyleInformation(''),
        autoCancel: true,
        ticker: 'ticker');

    notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin!.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  // Function to handle notification response
  onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    // AppRouter().goToPage('/notifications');
  }

  // Function to show foreground notifications
  showForegroundNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!: ${message.data}');
      // print('DATA: ${message.data['bigtext']}');

      RemoteNotification? notification = message.notification;

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification!.title}');

        flutterLocalNotificationsPlugin
            ?.cancelAll(); // Cancel all previous notifications

        flutterLocalNotificationsPlugin?.show(
          0, // Use a constant ID to overwrite the previous notification
          notification!.title,
          notification.body,
          notificationDetails,
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Handle notification tap here
      // Navigate to the desired view
      // AppRouter().goToPage('/notifications');
    });
  }
}

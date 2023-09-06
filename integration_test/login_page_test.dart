import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pin_tunnel_application_production/config/routes/routes.dart';
import 'package:pin_tunnel_application_production/core/util/notifications/general_notification_settings.dart';
import 'package:pin_tunnel_application_production/features/feature/data/data_sources/supabase_service.dart';
import 'package:pin_tunnel_application_production/main.dart';
import 'package:pin_tunnel_application_production/features/feature/presentation/pages/dashboard_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() {

  setUp(()  {
    OneSignal.initialize("714ca8e6-14af-4778-b0d7-02eb3331cffb");
    OneSignal.Notifications.requestPermission(true);
   var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = DarwinInitializationSettings();
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }
  );
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('sign in integration test', (tester) async {
   // await tester.pumpWidget(MaterialApp(
     //   home: LogInPage())); // replace MyApp with your main app widget

    await tester.pumpWidget(
      MaterialApp.router(
        title: "Pin Tunnel",
        routerConfig: router,
      ),
    );


    expect(find.byKey(Key('emailField')), findsOneWidget);
    expect(find.byKey(Key('passwordField')), findsOneWidget);
    expect(find.byKey(Key('loginButton')), findsOneWidget);

    await tester.enterText(find.byKey(Key('emailField')),
        'kuba.kolando.02.01@gmail.com'); // Replace with the actual locator
    await tester.enterText(find.byKey(Key('passwordField')),
        '123456'); // Replace with the actual locator

    await tester.tap(find.byKey(Key(
        'loginButton'))); // Replace with the actual locator for your sign-in button
        await tester.pumpAndSettle(Duration(seconds: 5));

   expect(find.byWidgetPredicate((widget) => widget is DashBoardPage), findsOneWidget);

    //expect(find.byKey(Key(tester.getRouterKey(Routes.dashboard))), findsOneWidget); // Replace HomePageWidget with an actual widget that signifies a successful login.
  });
}

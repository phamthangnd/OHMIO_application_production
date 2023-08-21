import 'package:flutter/material.dart';
import 'package:pin_tunnel_application_production/Providers/global_data_provider.dart';
import 'package:pin_tunnel_application_production/config/routes/routes.dart';
import 'package:pin_tunnel_application_production/config/themes/main_theme.dart';
import "package:supabase_flutter/supabase_flutter.dart";
import "package:provider/provider.dart";
import "package:timezone/data/latest.dart" as tz;

import 'features/feature/data/data_sources/supabase_service.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  runApp(ChangeNotifierProvider(
      create: (context) => GlobalDataProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Pin Tunnel",
      routerConfig: router,
      theme: mainTheme,
    );
  }
}

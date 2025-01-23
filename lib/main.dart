import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/themes/theme.dart';
import 'routes/route_generator.dart';
import 'routes/routes.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProviderScope(child: MyApp()),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cycle Booking',
      theme: appTheme,
      initialRoute: Routes.initial,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

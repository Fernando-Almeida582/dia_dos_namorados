import 'package:device_preview/device_preview.dart';
import 'package:dia_dos_namorados/common/navigation/navigation.dart';
import 'package:dia_dos_namorados/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
       ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pitica',
      routes: Navigation(context).routes,
      navigatorKey: Navigation.navigatorKey,
      home: const SplashScreen()
    );
  }
}
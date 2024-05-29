import 'package:flutter/material.dart';
import 'package:health/screens/login_screen.dart';
import 'package:health/services/provider_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderService(),
        child:MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData.light(useMaterial3: false),
      home: LoginScreen(),

    ));
  }
}

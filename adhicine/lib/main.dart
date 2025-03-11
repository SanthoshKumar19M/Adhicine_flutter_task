import 'package:adhicine/core/constants.dart';
import 'package:adhicine/views/login_screens/login_view.dart';
import 'package:flutter/material.dart';
import 'package:adhicine/widgets/network_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6f8bef)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: NetworkListener(child: const HomePage()),
      home: NetworkListener(child: const LoginView()),
    );
  }
}

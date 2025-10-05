import 'package:flutter/material.dart';
import 'core/parse_config.dart';
import 'auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ParseConfig.initializeParse();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Back4App Demo',
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  );
}
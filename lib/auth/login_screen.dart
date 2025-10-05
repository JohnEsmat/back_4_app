import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'signup_screen.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  Future<void> login() async {
    final user = ParseUser(emailCtrl.text.trim(), passCtrl.text.trim(), null);
    final response = await user.login();

    if (response.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.error?.message ?? 'Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Login')),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email')),
        TextField(controller: passCtrl, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
        SizedBox(height: 20),
        ElevatedButton(onPressed: login, child: Text('Login')),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
        }, child: Text('Sign Up'))
      ]),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  Future<void> signUp(BuildContext context) async {
    final user = ParseUser(emailCtrl.text.trim(), passCtrl.text.trim(), emailCtrl.text.trim());
    final response = await user.signUp();

    if (response.success) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.error?.message ?? 'Signup failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Sign Up')),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email')),
        TextField(controller: passCtrl, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
        SizedBox(height: 20),
        ElevatedButton(onPressed: () => signUp(context), child: Text('Sign Up')),
      ]),
    ),
  );
}

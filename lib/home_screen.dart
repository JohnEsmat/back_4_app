import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'product/add_product_screen.dart';
import 'product/product_list_screen.dart';
import 'auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  Future<void> logout(BuildContext context) async {
    final user = await ParseUser.currentUser() as ParseUser;
    await user.logout();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginScreen()), (_) => false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Dashboard'),
      actions: [IconButton(icon: Icon(Icons.logout), onPressed: () => logout(context))],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(child: Text('Add Product'), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => AddProductScreen()));
          }),
          ElevatedButton(child: Text('View Products'), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProductListScreen()));
          }),
        ],
      ),
    ),
  );
}

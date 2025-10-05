import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'product_model.dart';

class ProductListScreen extends StatelessWidget {
  Future<List<Product>> fetchProducts() async {
    final query = QueryBuilder<Product>(Product());
    final response = await query.query();

    if (response.success && response.results != null) {
      return response.results!.cast<Product>();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Product List')),
    body: FutureBuilder<List<Product>>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done)
          return Center(child: CircularProgressIndicator());

        final products = snapshot.data ?? [];

        if (products.isEmpty) return Center(child: Text('No products found'));

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, i) {
            final p = products[i];
            return ListTile(
              leading: p.image != null ? Image.network(p.image!.url!, width: 50) : null,
              title: Text(p.name),
            );
          },
        );
      },
    ),
  );
}

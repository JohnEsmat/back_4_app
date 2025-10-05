import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'product_model.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameCtrl = TextEditingController();
  File? imageFile;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => imageFile = File(picked.path));
  }

  Future<void> saveProduct() async {
    final product = Product()..name = nameCtrl.text.trim();

    if (imageFile != null) {
      final parseFile = ParseFile(imageFile!);
      await parseFile.save();
      product.image = parseFile;
    }

    final response = await product.save();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.success ? 'Saved!' : 'Error: ${response.error?.message}')),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Add Product')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(controller: nameCtrl, decoration: InputDecoration(labelText: 'Product Name')),
        SizedBox(height: 10),
        imageFile != null
            ? Image.file(imageFile!, height: 100)
            : TextButton.icon(onPressed: pickImage, icon: Icon(Icons.image), label: Text('Pick Image')),
        SizedBox(height: 20),
        ElevatedButton(onPressed: saveProduct, child: Text('Save Product')),
      ]),
    ),
  );
}

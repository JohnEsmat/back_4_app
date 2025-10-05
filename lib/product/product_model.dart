import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Product extends ParseObject implements ParseCloneable {
  Product() : super('Product');

  Product.clone() : this();

  @override
  Product clone(Map<String, dynamic> map) => Product()..fromJson(map);

  String get name => get<String>('name')!;
  set name(String value) => set<String>('name', value);

  ParseFileBase? get image => get<ParseFileBase>('image');
  set image(ParseFileBase? file) => set('image', file);
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoping_api/model/product_model.dart';

class ProductsService {
  Future<List<ProductModel>> fetchProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

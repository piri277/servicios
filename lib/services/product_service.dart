import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:servicios_modelo/models/category.dart';

import '../models/product.dart';

class ProductService {
  static const String _baseUrl = 'https://dummyjson.com';

  Future<List<Product>> getProducts({int limit = 30}) async {
    final url = Uri.parse('$_baseUrl/products?limit=$limit');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error procesando productos: ${response.statusCode}');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    final List<dynamic> jsonList = data['products'];

    return jsonList.map((json) => Product.fromJson(json)).toList();
  }

  Future<List<Category>> getCategorys() async {
    final url = Uri.parse('$_baseUrl/products/categories');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error procesando categorias: ${response.statusCode}');
    }

    final List<dynamic> data = jsonDecode(response.body);

    return data.map((json) => Category.fromJson(json)).toList();
  }

  Future<Product> getProductById(int id) async {
    final url = Uri.parse('$_baseUrl/products/$id');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error consultando producto: ${response.statusCode}');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    return Product.fromJson(data);
  }

  Future<List<Product>> getProductsByCategory(String slug) async {
    final url = Uri.parse('$_baseUrl/products/category/$slug?');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error procesando productos: ${response.statusCode}');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    final List<dynamic> jsonList = data['products'];

    return jsonList.map((json) => Product.fromJson(json)).toList();
  }
}

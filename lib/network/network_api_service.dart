// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.escuelajs.co/api/v1';

  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}
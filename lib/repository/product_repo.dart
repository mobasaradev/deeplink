import '../model/product_model.dart';
import '../network/network_api_service.dart';

class ProductRepository {
  static List<Product> _products = [];

  static Future<void> loadProducts() async {
    _products = await ApiService.getProducts();
  }

  static Product? getProductById(int id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  static List<Product> get allProducts => _products;
}

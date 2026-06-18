import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ProductRemoteDatasource {
  final Dio dio;
  ProductRemoteDatasource(this.dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('/products');
      final List productsJson = response.data['products'];
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String categorySlug) async {
    try {
      final response = await dio.get('/products/category/$categorySlug');
      final List productsJson = response.data['products'];
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}

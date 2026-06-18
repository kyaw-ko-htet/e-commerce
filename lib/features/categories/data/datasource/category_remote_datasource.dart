import 'package:dio/dio.dart';

import '../models/category_model.dart';

class CategoryRemoteDatasource {
  final Dio dio;
  CategoryRemoteDatasource(this.dio);

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get('/products/categories');
      final List categoriesJson = response.data;
      return categoriesJson
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}

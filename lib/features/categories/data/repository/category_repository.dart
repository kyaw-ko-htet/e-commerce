import '../datasource/category_remote_datasource.dart';
import '../models/category_model.dart';

class CategoryRepository {
  final CategoryRemoteDatasource remoteDatasource;
  CategoryRepository(this.remoteDatasource);

  Future<List<CategoryModel>> getCategories() {
    return remoteDatasource.getCategories();
  }
}

import '../datasource/product_remote_datasource.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ProductRemoteDatasource remoteDatasource;
  ProductRepository(this.remoteDatasource);

  Future<List<ProductModel>> getProducts() {
    return remoteDatasource.getProducts();
  }

  Future<List<ProductModel>> getProductsByCategory(String categorySlug) {
    return remoteDatasource.getProductsByCategory(categorySlug);
  }
}

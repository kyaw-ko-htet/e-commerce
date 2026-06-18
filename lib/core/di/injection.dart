import 'package:e_commerce/core/network/dio_client.dart';
import 'package:e_commerce/features/categories/data/datasource/category_remote_datasource.dart';
import 'package:e_commerce/features/categories/data/repository/category_repository.dart';
import 'package:e_commerce/features/categories/presentation/cubit/category_cubit.dart';
import 'package:e_commerce/features/products/data/datasource/product_remote_datasource.dart';
import 'package:e_commerce/features/products/data/repository/product_repository.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => DioClient.create());

  getIt.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasource(getIt()),
  );
  getIt.registerLazySingleton<CategoryRemoteDatasource>(
    () => CategoryRemoteDatasource(getIt()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepository(getIt()),
  );
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepository(getIt()),
  );

  getIt.registerFactory(() => ProductCubit(getIt()));
  getIt.registerFactory(() => CategoryCubit(getIt()));
}

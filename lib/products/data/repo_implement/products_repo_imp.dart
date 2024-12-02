import 'package:dartz/dartz.dart';
import 'package:products/core/error/exeptions.dart';
import 'package:products/core/error/failures.dart';
import 'package:products/core/network/network_connection.dart';
import 'package:products/products/data/dataSources/products_datasource.dart';
import 'package:products/products/data/model/products_model.dart';
import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/domain/products_repo.dart';

class ProductsRepoImp implements ProductsRepo {
  final NetworkConnection networkConnection;
  final RemoteGetProductsDataSource remoteGetProductsDataSource;
  ProductsRepoImp({
    required this.networkConnection,
    required this.remoteGetProductsDataSource,
  });
  @override
  Future<Either<Failures, ProductsEntity>> getProducts() async {
    if (await networkConnection.isConnected) {
      try {
        ProductsModel productsModel =
            await remoteGetProductsDataSource.getProducts();
        return Right(productsModel);
      } on ServerException catch (e) {
        print('repo imp exception $e');
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}

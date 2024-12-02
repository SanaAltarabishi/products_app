import 'package:dartz/dartz.dart';
import 'package:products/core/error/failures.dart';
import 'package:products/products/domain/entities/products_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, ProductsEntity>> getProducts();
}

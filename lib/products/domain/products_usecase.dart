import 'package:dartz/dartz.dart';
import 'package:products/core/error/failures.dart';
import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/domain/products_repo.dart';

class GetProductsUseCase {
  final ProductsRepo productsRepo;
  GetProductsUseCase({
    required this.productsRepo,
  });

  Future<Either<Failures, ProductsEntity>> call() async {
    return await productsRepo.getProducts();
  }
}

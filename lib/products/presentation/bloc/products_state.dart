// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

@immutable
sealed class ProductsState {
  const ProductsState();
}

final class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsFailure extends ProductsState {
  final String message;
  const ProductsFailure({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class ProductsSuccess extends ProductsState {
  final ProductsEntity productsEntity;
  const ProductsSuccess({
    required this.productsEntity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsSuccess && other.productsEntity == productsEntity;
  }

  @override
  int get hashCode => productsEntity.hashCode;
}

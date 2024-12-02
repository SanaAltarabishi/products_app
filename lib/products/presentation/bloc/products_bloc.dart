import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:products/core/error/failures.dart';

import 'package:products/products/domain/entities/products_entity.dart';
import 'package:products/products/domain/products_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductsUseCase;
  ProductsBloc(
    this.getProductsUseCase,
  ) : super(const ProductsInitial()) {
    on<GetProducts>((event, emit) async {
      emit(const ProductsLoading());
      final failureOrEntity = await getProductsUseCase.call();
      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure:
            message = 'something went wrong , please try later ..';
            break;
          case NetworkFailure:
            message = 'there is no internet ..';
            break;
          default:
            message = 'undefiend error';
        }
        emit(ProductsFailure(message: message));
      }, (entity) {
        emit(ProductsSuccess(productsEntity: entity));
      });
    });
  }
}

import 'package:dio/dio.dart';
import 'package:products/core/error/exeptions.dart';
import 'package:products/core/resources/urls.dart';
import 'package:products/products/data/model/products_model.dart';

class RemoteGetProductsDataSource {
  final Dio dio;
  RemoteGetProductsDataSource({
    required this.dio,
  });

  Future<ProductsModel> getProducts() async {
    try {
      Response response = await dio.get(
        AppUrls.getProductsUrl,
        options: Options().copyWith(
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        ProductsModel productsModel =
            ProductsModel.fromJson(response.data);
        return productsModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}

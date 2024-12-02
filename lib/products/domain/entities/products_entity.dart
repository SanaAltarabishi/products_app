import 'package:products/products/domain/entities/sub_entities/dimensions_entity.dart';
import 'package:products/products/domain/entities/sub_entities/review_entity.dart';

class  IndividualProductEntity {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final DimensionsEntity dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ReviewEntity> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;
  final List<String> images;
  final String thumbnail;
  IndividualProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
    required this.images,
    required this.thumbnail,
  });
}
class ProductsEntity {
  final List<IndividualProductEntity> products; // List of individual product entities
  final int total;
  final int skip;
  final int limit;

  ProductsEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
import 'package:products/products/data/model/sub_model/dimension_model.dart';
import 'package:products/products/data/model/sub_model/review_model.dart';
import 'package:products/products/domain/entities/products_entity.dart';

class IndividualProductModel extends IndividualProductEntity {
  IndividualProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.tags,
    required super.brand,
    required super.sku,
    required super.weight,
    required super.dimensions,
    required super.warrantyInformation,
    required super.shippingInformation,
    required super.availabilityStatus,
    required super.reviews,
    required super.returnPolicy,
    required super.minimumOrderQuantity,
    required super.createdAt,
    required super.updatedAt,
    required super.barcode,
    required super.qrCode,
    required super.images,
    required super.thumbnail,
  });

  factory IndividualProductModel.fromJson(Map<String, dynamic> json) {
    return IndividualProductModel(
      id: json['id'] ?? 0, // Default value for id
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: json['weight'] ?? 0,
      dimensions: json['dimensions'] != null
          ? DimensionModel.fromJson(json['dimensions'])
          : DimensionModel(width: 0, height: 0, depth: 0),
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
              .map((reviewJson) => ReviewModel.fromJson(reviewJson))
              .toList()
          : [],
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      createdAt: json['meta']?['createdAt'] ?? '',
      updatedAt: json['meta']?['updatedAt'] ?? '',
      barcode: json['meta']?['barcode'] ?? '',
      qrCode: json['meta']?['qrCode'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions,
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((review) => review).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': {
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'barcode': barcode,
        'qrCode': qrCode,
      },
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}

class ProductsModel extends ProductsEntity {
  ProductsModel(
      {required super.products,
      required super.total,
      required super.skip,
      required super.limit});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      products: (json['products'] as List)
          .map((productJson) => IndividualProductModel.fromJson(productJson))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

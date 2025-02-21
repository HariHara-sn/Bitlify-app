import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int productid;
  final String name;
  final String description;
  final String price;
  final String image;

  ProductModel({
    required this.productid,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

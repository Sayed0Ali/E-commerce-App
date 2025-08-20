import 'package:e_commerce/domain/entites/AddToCartResponseEntity.dart';

class AddCartResponseDm extends AddToCartResponseEntity {
  AddCartResponseDm({
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    this.statusMessage,
    super.data,
  });

  AddCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMessage = json['statusMessage'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataCardDm.fromJson(json['data']) : null;
  }
  String? statusMessage;
}

class DataCardDm extends DataCardEntity {
  DataCardDm({
    super.id,
    super.cartOwner,
    super.products,
    this.createdAt,
    this.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  DataCardDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? createdAt;
  String? updatedAt;
}

class AddProductDm extends AddProductsEntity {
  AddProductDm({super.count, super.id, super.product, super.price});

  AddProductDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}

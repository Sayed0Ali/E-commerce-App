import 'package:e_commerce/data/model/Product_response_dm.dart';
import 'package:e_commerce/domain/entites/GetCardResponseEntity.dart';

class GetCardResponseDm extends GetCardResponseEntity {
  GetCardResponseDm({
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  GetCardResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataDm.fromJson(json['data']) : null;
  }
  String? statusMessage;
  String? message;
}

class GetDataDm extends GetDataEntity {
  GetDataDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductsDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProductsDm extends GetProductsEntity {
  GetProductsDm({super.count, super.id, super.product, super.price});

  GetProductsDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDm.fromJson(json['product']) : null;
    price = json['price'];
  }
}

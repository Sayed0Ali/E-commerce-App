import 'package:e_commerce/domain/entites/GetWishListResponseEntity.dart';

class GetWishListDm extends GetWishListResponseEntity {
  GetWishListDm({super.status, super.count, super.data});

  GetWishListDm.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetWishListDataEntity>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? statusMessage;
  String? message;
}

class Data extends GetWishListDataEntity {
  Data({
    super.sold,
    super.images,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  Data.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];

    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];

    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}

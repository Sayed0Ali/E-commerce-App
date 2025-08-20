import 'package:e_commerce/domain/entites/AddToWishListResponseEntity.dart';

class WishListDm extends WishListResponseEntity {
  WishListDm({super.status, super.message, super.data});

  WishListDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? statusMsg;
}

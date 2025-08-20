class AddToCartResponseEntity {
  AddToCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  DataCardEntity? data;
}

class DataCardEntity {
  DataCardEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<AddProductsEntity>? products;

  num? v;
  num? totalCartPrice;
}

class AddProductsEntity {
  AddProductsEntity({this.count, this.id, this.product, this.price});

  AddProductsEntity.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  num? count;
  String? id;
  String? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
}

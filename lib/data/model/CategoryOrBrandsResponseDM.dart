import 'package:e_commerce/domain/entites/CategoryOrBrandResponseEntity.dart';


class CategoryOrBrandsResponseDm extends CategoryOrBrandResponseEntity {
  CategoryOrBrandsResponseDm({
    super.results,
    super.metadata,
    super.data,
    this.message,
    this.statusMessage,
  });

  CategoryOrBrandsResponseDm.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMessage = json['statusMessage'];
    metadata =
        json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDm.fromJson(v));
      });
    }
  }
  String? message;
  String? statusMessage;
}

class CategoryDm extends CategoryOrBrandEntity {
  CategoryDm({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}

class MetadataDm extends MetadataEntity {
  MetadataDm({super.currentPage, super.numberOfPages, super.limit});

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}

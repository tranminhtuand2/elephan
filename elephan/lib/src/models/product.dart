import 'dart:convert';

class Product {
  final int? id;
  final int? storeId;
  final String? nameProduct;
  final String? imageProduct;
  final String? detail;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Store? store;

  Product({
    this.id,
    this.storeId,
    this.nameProduct,
    this.imageProduct,
    this.detail,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.store,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        storeId: json["store_id"],
        nameProduct: json["name_product"],
        imageProduct: json["image_product"],
        detail: json["detail"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        store: json["Store"] == null ? null : Store.fromMap(json["Store"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "store_id": storeId,
        "name_product": nameProduct,
        "image_product": imageProduct,
        "detail": detail,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "Store": store?.toMap(),
      };
}

class Store {
  final String? storeName;
  final String? managerPhoneNumber;
  final String? storePhoneNumber;
  final String? address;
  final String? describe;
  final dynamic image;

  Store({
    this.storeName,
    this.managerPhoneNumber,
    this.storePhoneNumber,
    this.address,
    this.describe,
    this.image,
  });

  factory Store.fromJson(String str) => Store.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Store.fromMap(Map<String, dynamic> json) => Store(
        storeName: json["store_name"],
        managerPhoneNumber: json["manager_phone_number"],
        storePhoneNumber: json["store_phone_number"],
        address: json["address"],
        describe: json["describe"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "store_name": storeName,
        "manager_phone_number": managerPhoneNumber,
        "store_phone_number": storePhoneNumber,
        "address": address,
        "describe": describe,
        "image": image,
      };
}

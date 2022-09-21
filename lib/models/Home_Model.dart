// ignore_for_file: file_names

class HomeModel {
  late bool status;
  late String message;
  late Data data;

  HomeModel({required this.status, required this.message, required this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }
}

class Data {
  late List<Banners> banners;
  late List<Products> products;
  late String ad;

  Data({required this.banners, required this.products, required this.ad});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners.add(Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['ad'] = this.ad;
    return data;
  }
}

class Banners {
  late int id;
  late String image;
  Null category;
  Null product;

  Banners({required this.id, required this.image, this.category, this.product});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['category'] = this.category;
    data['product'] = this.product;
    return data;
  }
}

class Products {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;
  late List<String> images;
  late bool inFavorites;
  late bool inCart;

  Products(
      {required this.id,
      required this.price,
      this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.description,
      required this.images,
      required this.inFavorites,
      required this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    data['in_favorites'] = this.inFavorites;
    data['in_cart'] = this.inCart;
    return data;
  }
}

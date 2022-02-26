class HomeModel {
  HomeModel({
      this.success, 
      this.data, 
      this.message,});

  HomeModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? success;
  Data? data;
  String? message;

}

class Data {
  Data({
      this.sliders, 
      this.categories, 
      this.mostSeller, 
      this.newProducts, 
      this.happinessAchievements,});

  Data.fromJson(dynamic json) {
    if (json['sliders'] != null) {
      sliders = [];
      json['sliders'].forEach((v) {
        sliders?.add(Sliders.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['most_seller'] != null) {
      mostSeller = [];
      json['most_seller'].forEach((v) {
        mostSeller?.add(MostSeller.fromJson(v));
      });
    }
    if (json['new_products'] != null) {
      newProducts = [];
      json['new_products'].forEach((v) {
        newProducts?.add(NewProducts.fromJson(v));
      });
    }
    if (json['happiness_achievements'] != null) {
      happinessAchievements = [];
      json['happiness_achievements'].forEach((v) {
        happinessAchievements?.add(HappinessAchievements.fromJson(v));
      });
    }
  }
  List<Sliders>? sliders;
  List<Categories>? categories;
  List<MostSeller>? mostSeller;
  List<NewProducts>? newProducts;
  List<HappinessAchievements>? happinessAchievements;
}

class HappinessAchievements {
  HappinessAchievements({
      this.id, 
      this.thumb, 
      this.imageWiteBase,});

  HappinessAchievements.fromJson(dynamic json) {
    id = json['id'];
    thumb = json['thumb'];
    imageWiteBase = json['image_wite_base'];
  }
  int? id;
  String? thumb;
  String? imageWiteBase;
}

class NewProducts {
  NewProducts({
      this.id, 
      this.name, 
      this.price, 
      this.categoriesName, 
      this.imageWithBase,});

  NewProducts.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    categoriesName = json['categories_name'];
    imageWithBase = json['image_with_base'];
  }
  int? id;
  String? name;
  int? price;
  String? categoriesName;
  String? imageWithBase;
}

class MostSeller {
  MostSeller({
      this.id, 
      this.name, 
      this.price, 
      this.categoriesName, 
      this.imageWithBase,});

  MostSeller.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    categoriesName = json['categories_name'];
    imageWithBase = json['image_with_base'];
  }
  int? id;
  String? name;
  int? price;
  String? categoriesName;
  String? imageWithBase;
}

class Categories {
  Categories({
      this.id, 
      this.status, 
      this.showHome, 
      this.name,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    showHome = json['show_home'];
    name = json['name'];
  }
  int? id;
  int? status;
  int? showHome;
  String? name;
}

class Sliders {
  Sliders({
      this.id, 
      this.image, 
      this.imageWithBase,});

  Sliders.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    imageWithBase = json['image_with_base'];
  }
  int? id;
  dynamic image;
  String? imageWithBase;

}
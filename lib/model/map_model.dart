import 'package:flutter/cupertino.dart';

class MapModel {

  List<Data> data;


  MapModel({@required this.data,});

  MapModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != String) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.data != String) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String name;
  String phoneNumber;
  String email;
  int studentCountMin;
  int studentCountMax;
  int studentGender;
  String langText;
  String website;
  String facebook;
  String twitter;
  String instagram;
  String curriculum;
  String brief;
  String avatar;
  double latitude;
  double longitude;
  String address;
  List<Schoolgallery> schoolgallery;
  int booksPrice;
  int clothesPrice;
  int transportationPrice;
  int isOffer;
  List<Types> types;
  List<Languages> languages;
  List<Offers> offers;
  List<Offer> offer;
  String isFavorite;

  Data(
      {this.id,
        this.name,
        this.phoneNumber,
        this.email,
        this.studentCountMin,
        this.studentCountMax,
        this.studentGender,
        this.langText,
        this.website,
        this.facebook,
        this.twitter,
        this.instagram,
        this.curriculum,
        this.brief,
        this.avatar,
        this.latitude,
        this.longitude,
        this.address,
        this.schoolgallery,
        this.booksPrice,
        this.clothesPrice,
        this.transportationPrice,
        this.isOffer,
        this.types,
        this.languages,
        this.offers,
        this.offer,
        this.isFavorite});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    studentCountMin = json['student_count_min'];
    studentCountMax = json['student_count_max'];
    studentGender = json['student_gender'];
    langText = json['lang_text'];
    website = json['website'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    curriculum = json['curriculum'];
    brief = json['brief'];
    avatar = json['avatar'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    if (json['schoolgallery'] != String) {
      schoolgallery = new List<Schoolgallery>();
      json['schoolgallery'].forEach((v) {
        schoolgallery.add(new Schoolgallery.fromJson(v));
      });
    }
    booksPrice = json['books_price'];
    clothesPrice = json['clothes_price'];
    transportationPrice = json['transportation_price'];
    isOffer = json['is_offer'];
    if (json['types'] != String) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
    if (json['languages'] != String) {
      languages = new List<Languages>();
      json['languages'].forEach((v) {
        languages.add(new Languages.fromJson(v));
      });
    }
    if (json['offers'] != String) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
      });
    }
    if (json['offer'] != String) {
      offer = new List<Offer>();
      json['offer'].forEach((v) {
        offer.add(new Offer.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['student_count_min'] = this.studentCountMin;
    data['student_count_max'] = this.studentCountMax;
    data['student_gender'] = this.studentGender;
    data['lang_text'] = this.langText;
    data['website'] = this.website;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['curriculum'] = this.curriculum;
    data['brief'] = this.brief;
    data['avatar'] = this.avatar;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    if (this.schoolgallery != String) {
      data['schoolgallery'] =
          this.schoolgallery.map((v) => v.toJson()).toList();
    }
    data['books_price'] = this.booksPrice;
    data['clothes_price'] = this.clothesPrice;
    data['transportation_price'] = this.transportationPrice;
    data['is_offer'] = this.isOffer;
    if (this.types != String) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    if (this.languages != String) {
      data['languages'] = this.languages.map((v) => v.toJson()).toList();
    }
    if (this.offers != String) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    if (this.offer != String) {
      data['offer'] = this.offer.map((v) => v.toJson()).toList();
    }
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

class Schoolgallery {
  int id;
  String schoolId;
  String gallary;
  String createdAt;
  String updatedAt;

  Schoolgallery(
      {this.id, this.schoolId, this.gallary, this.createdAt, this.updatedAt});

  Schoolgallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    gallary = json['gallary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['gallary'] = this.gallary;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Types {
  int id;
  String type;
  int status;

  Types({this.id, this.type, this.status});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}

class Languages {
  int id;
  String name;

  Languages({this.id, this.name});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Offers {
  int id;
  String schoolId;
  String image;
  String title;
  String description;
  String endDate;
  int status;
  int main;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Offers(
      {this.id,
        this.schoolId,
        this.image,
        this.title,
        this.description,
        this.endDate,
        this.status,
        this.main,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    endDate = json['end_date'];
    status = json['status'];
    main = json['main'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['main'] = this.main;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Offer {
  int id;
  String schoolId;
  String image;
  String title;
  String description;
  String endDate;
  int status;
  int main;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Offer(
      {this.id,
        this.schoolId,
        this.image,
        this.title,
        this.description,
        this.endDate,
        this.status,
        this.main,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    endDate = json['end_date'];
    status = json['status'];
    main = json['main'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['school_id'] = this.schoolId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['main'] = this.main;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
import 'dart:io';

class Car {
  String id;
  String name;
  String imageurl;
  num Seating;
  String comp;
  String type;
  String Range;
  String View360;
  num yearMake;
  bool isFavorite;
  num price;
  // Map classifi;
  List Reviews;
  Map image;
  //File imageToBeUpload;
  String EngineType;
  String TransmissionType;
  String Specs;
  num Horsepower;
  num Warranty;

  Car({
    this.name,
    this.comp,
    this.imageurl,
    this.yearMake,
    this.type,
    this.Seating,
    this.Range,
    this.View360,
    this.isFavorite,
    // this.imageToBeUpload,
    this.image,
    this.price,
    // this.classifi,
    this.Reviews,
    this.EngineType,
    this.TransmissionType,
    this.Horsepower,
    this.Warranty,
    this.Specs,
  });
  Car.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.comp = map['comp'];
    this.type = map['type'];
    this.imageurl = map['imageurl'];
    this.yearMake = map['yearMake'];
    this.price = map['price'];
    this.Seating = map['Seating'];
    this.Range = map['Range'];
    this.View360 = map['360View'];
    this.isFavorite = map['isFavorite'];
    this.name = map['name'];
    // this.classifi = map['Classification'];
    this.Reviews = map['Reviews'];
    this.image = map['image'];
    this.EngineType = map['EngineType'];
    this.TransmissionType = map['TransmissionType'];
    this.Horsepower = map['Horsepower'];
    this.Warranty = map['Warranty'];
    this.Specs = map['Specs'];
  }
  toMap() {
    return {
      'comp': this.comp,
      'name': this.name,
      'type': this.type,
      'yearMake': this.yearMake,
      'isFavorite': this.isFavorite,
      'price': this.price,
      'image': this.image,
      // 'Classification': this.classifi,
      'Reviews': this.Reviews,
      'imageurl': this.imageurl,
      'Range': this.Range,
      'EngineType': this.EngineType,
      'TransmissionType': this.TransmissionType,
      'Horsepower': this.Horsepower,
      'Warranty': this.Warranty,
      'Specs': this.Specs,
    };
  }
}

class Book {
  String id;
  String name;
  String description;
  String descriptionEn;
  String imageurl;
  String pdfurl;
  String language;
  Book(
      {this.name, this.description, this.imageurl, this.pdfurl, this.language});

  Book.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.description = map['description'];
    this.imageurl = map['photo'];
    this.pdfurl = map['token'];
    this.language = map['language'];
    this.descriptionEn = map['descriptionEn'];
  }
  toMap() {
    return {
      'nameCours': this.name,
      'description': this.description,
      'photo': this.imageurl,
      'token': this.pdfurl,
      'language': this.language,
      'descriptionEn': this.descriptionEn,
    };
  }
}

import 'dart:io';

class CourseModel {
  String id;
  String nameCours;
  String description;
  List coursename;
  List courseurl;
  String image;

  CourseModel(
      {this.nameCours,
      this.description,
      this.coursename,
      this.courseurl,
      this.image});
  CourseModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nameCours = map['nameCours'];
    this.description = map['description'];
    this.coursename = map['listcoursname'];
    this.courseurl = map['listcoursurl'];
    this.image = map['photo'];
  }
  toMap() {
    return {
      'nameCours': this.nameCours,
      'description': this.description,
      'listcoursname': this.coursename,
      'listcoursurl': this.courseurl,
      'photo': this.image,
    };
  }
}

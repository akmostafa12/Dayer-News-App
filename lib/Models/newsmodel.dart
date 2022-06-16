import 'package:flutter/cupertino.dart';
class NewsModel {
  String ? author;
  String ? title;
  String ? description;
  String ? url;
  String ? image;
  String ? author2;
  String ? title2;
  String ? description2;
  String ? url2;
  String ? image2;
  String ? author3;
  String ? title3;
  String ? description3;
  String ? url3;
  String ? image3;
  String ? author4;
  String ? title4;
  String ? description4;
  String ? url4;
  String ? image4;

  NewsModel({required this.author,required this.title,required this.description,required this.url,required this.image,required this.author2,required this.title2,required this.description2,required this.url2,required this.image2,required this.author3,required this.title3,required this.description3,required this.url3,required this.image3,required this.author4,required this.title4,required this.description4,required this.url4,required this.image4,});
  NewsModel.fromjson(Map<String,dynamic> n1,n2,n3,n4,n5){
    author= n1['author'];
    title= n1['title'];
    description= n1['description'];
    url= n1['url'];
    image= n1['urlToImage'];
    author2= n2['author'];
    title2= n2['title'];
    description2= n2['description'];
    url2= n2['url'];
    image2= n2['urlToImage'];
    author3= n3['author'];
    title3= n3['title'];
    description3= n3['description'];
    url3= n3['url'];
    image3= n3['urlToImage'];
    author4= n4['author'];
    title4= n4['title'];
    description4= n4['description'];
    url4= n4['url'];
    image4= n4['urlToImage'];
  }
  String ? getImage(){
    if (image == null){
      return 'images/noimage.png';
    }
    else {
      return image;
    }
  }
  String ? getImage2(){
    if (image2 == null){
      return 'images/noimage.png';
    }
    else {
      return image2;
    }
  }
  String ? getImage3(){
    if (image3 == null){
      return 'images/noimage.png';
    }
    else {
      return image3;
    }
  }
  String ? getImage4(){
    if (image4 == null){
      return 'images/noimage.png';
    }
    else {
      return image4;
    }
  }
  String ? getauthor () {
    if(author == null) {
      return 'بدون اسم';
    }
    else {
      return author;
    }
    }
  String ? getauthor2 () {
    if(author2 == null) {
      return 'بدون اسم';
    }
    else {
      return author2;
    }
  }
  String ? getauthor3 () {
    if(author3 == null) {
      return 'بدون اسم';
    }
    else {
      return author3;
    }
  }
  String ? getauthor4 () {
    if(author4 == null) {
      return 'بدون اسم';
    }
    else {
      return author4;
    }
  }
  String ? getitle () {
    if(title == null) {
      return 'بدون عنوان';
    }
    else {
      return title;
    }
  }
  String ? getitle2 () {
    if(title2 == null) {
      return 'بدون عنوان';
    }
    else {
      return title2;
    }
  }
  String ? getitle3 () {
    if(title3 == null) {
      return 'بدون عنوان';
    }
    else {
      return title3;
    }
  }
  String ? getitle4 () {
    if(title4 == null) {
      return 'بدون عنوان';
    }
    else {
      return title4;
    }
  }
  String ? gedescription () {
    if(description == null) {
      return 'بدون وصف';
    }
    else {
      return description;
    }
  }
  String ? gedescription2 () {
    if(description2 == null) {
      return 'بدون وصف';
    }
    else {
      return description2;
    }
  }
  String ? gedescription3 () {
    if(description3 == null) {
      return 'بدون وصف';
    }
    else {
      return description3;
    }
  }
  String ? gedescription4() {
    if(description4 == null) {
      return 'بدون وصف';
    }
    else {
      return description4;
    }
  }
}




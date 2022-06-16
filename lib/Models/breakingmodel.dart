class BreakingModel{
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
  BreakingModel({required this.author,required this.title,required this.description,required this.url,required this.image,required this.author2,required this.title2,required this.description2,required this.url2,required this.image2,required this.author3,required this.title3,required this.description3,required this.url3,required this.image3});
  BreakingModel.fromjson(Map<String,dynamic> b1,b2,b3){
    author= b1['author'];
    title= b1['title'];
    description= b1['description'];
    url= b1['url'];
    image= b1['urlToImage'];
    author2= b2['author'];
    title2= b2['title'];
    description2= b2['description'];
    url2= b2['url'];
    image2= b2['urlToImage'];
    author3= b3['author'];
    title3= b3['title'];
    description3= b3['description'];
    url3= b3['url'];
    image3= b3['urlToImage'];

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
}
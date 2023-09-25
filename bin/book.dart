

class Book{
  final String title;
  final String author;
  final String price;
  const Book({required this.title, required this.author, required this.price});

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
        title : json['title'],
        author: json['author'],
        price: json['price']);
  }

  void show(){
    print("Title: $title \n Author: $author \n Price: $price");
  }


}

import 'dart:io';
import 'dart:convert';
import 'book.dart';

void main(){

  var readFile = File("assets/writers.json");
  // var readFile1 = File("assets/book.json");
  // readFile1.readAsString().then((value) {
  //   var data = jsonDecode(value);
  //   print(data.runtimeType);
  // });
  readFile.readAsString().then((value){

    var data = jsonDecode(value);

    List<Book> books = [];
    for(var item in data){
      var book = Book(title: item['title'], author: item['author'], price: item['price']);

      books.add(book);
    }

    var totalPrice = 0;
    for (var b in books) {
      // print("Title: ${b.title}");
      // print("Author: ${b.author}");
      // print("Price: ${b.price}");


      totalPrice = totalPrice + int.parse(b.price);
      b.show();
      }
    print('Total price of the books is: $totalPrice');
    });
}



import 'dart:convert';
import 'package:booklibraryapp/classes/book.dart';
import 'package:http/http.dart' as http;

final String baseUri = "http://localhost:8000";

Future<List<Book>> getBooks() async {
  var url = '$baseUri/books';
  final res = await http.get(Uri.parse(url));
  print('Am i here?');
  print(res.statusCode);
  if (res.statusCode == 200) {
    var content = res.body;
    // print(content);
    var arr = json.decode(content);
    // print(arr);
    // print(arr.length);

    // for every element of arr map to _fromJson
    // and convert the array to list
    List<Book> books = arr.map<Book>((e) {
      // print("This is ${e}");
      print(Book.fromJson(e));
      return Book.fromJson(e);
    }).toList();
    List<Book> newBooks = books.cast<Book>().toList();
    return newBooks;
  }

  return <Book>[];
}

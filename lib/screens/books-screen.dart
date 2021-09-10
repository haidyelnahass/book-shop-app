import 'package:booklibraryapp/classes/book.dart';
import 'package:booklibraryapp/widgets/app-bar.dart';
import 'package:booklibraryapp/widgets/drawer-menu.dart';
import 'package:booklibraryapp/services/book-service.dart';
import 'package:flutter/material.dart';

class BooksScreen extends StatefulWidget {
  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = getBooks();
  }

  // var books = [
  //   {
  //     'title': 'Book1',
  //     'author': "J.C",
  //     'description':
  //         'lorem ipsum dolor lorem long long long longggg description heheheheheheehe',
  //     'amount': '3',
  //     'format': 'paperback',
  //     'imageURL': 'https://via.placeholder.com/150.png',
  //   },
  //   {
  //     'title': 'Book2',
  //     'author': "J.C.T",
  //     'description':
  //         'lorem ipsum dolor lorem adbvjfhgjfghjghgjuieeurieiueriureuieruieriureiu',
  //     'amount': '2',
  //     'format': 'paperback',
  //     'imageURL': 'https://via.placeholder.com/150.png',
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        drawer: MyDrawer(false),
        body: FutureBuilder<List<Book>>(
          future: futureBooks,
          builder: (context, snapshot) {
            // print(futureBooks);
            print(snapshot.data);
            // print(snapshot.connectionState == ConnectionState.done);
            if (snapshot.hasData) {
              // print(snapshot.data);
              List<Book> books = snapshot.data as List<Book>;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: books.length,
                  itemBuilder: (_, i) {
                    return Card(
                      elevation: 5,
                      child: Column(
                        children: <Widget>[
                          Image.network(books[i].imageURL),
                          Text(
                            books[i].title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            books[i].author,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),

                          // Text(
                          //   books[i]['title'] as String,
                          //   style: TextStyle(
                          //       fontSize: 20, fontWeight: FontWeight.bold),
                          // ),
                          // SizedBox(height: 2),
                          // Text(
                          //   books[i]['author'] as String,
                          //   style: TextStyle(
                          //     fontSize: 10,
                          //   ),
                          // ),
                          // SizedBox(height: 2),
                          // Text(books[i]['format'] as String,
                          //     style: TextStyle(
                          //       fontSize: 10,
                          //     )),
                          // SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.purple,
                                  child: Text('Add to Cart'),
                                  onPressed: () {
                                    print('I was pressed!');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ));
  }
}

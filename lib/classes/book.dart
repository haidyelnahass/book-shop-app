class Book {
  final String title;
  final String description;
  final String format;
  final String imageURL;
  final String creator;
  final int amount;
  final String author;
  Book({
    required this.title,
    required this.description,
    required this.format,
    required this.imageURL,
    required this.creator,
    required this.amount,
    required this.author,
  });

  factory Book.fromJson(Map<String, dynamic> book) {
    return Book(
      title: book['title'],
      description: book['description'],
      format: book['format'],
      imageURL: book['imageURL'],
      creator: book['creator'],
      amount: book['amount'],
      author: book['author'],
    );
  }
}

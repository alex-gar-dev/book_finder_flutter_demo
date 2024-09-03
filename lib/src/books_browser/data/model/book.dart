class Book {
  final String title;
  final List<String> authorName;
  final List<String> oclc;
  final List<String> isbn;

  Book({
    required this.title,
    required this.authorName,
    required this.oclc,
    required this.isbn,
  });

  static Book froMap(Map<String, dynamic> map) 
    => Book(
      title: map['title'] ?? '',
      authorName: List<String>.from(map['author_name'] ?? ['unknown']),
      oclc: List<String>.from(map['oclc'] ?? ['unknown']),
      isbn: List<String>.from(map['isbn'] ?? ['unknown']),
    );
}
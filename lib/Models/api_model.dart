class Quote {
  final String id;
  final String author;
  final String content;
  final List<String> tags;
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified;

  Quote({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['_id'],
      author: json['author'],
      content: json['content'],
      tags: List<String>.from(json['tags']),
      authorSlug: json['authorSlug'],
      length: json['length'],
      dateAdded: json['dateAdded'],
      dateModified: json['dateModified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'author': author,
      'content': content,
      'tags': tags,
      'authorSlug': authorSlug,
      'length': length,
      'dateAdded': dateAdded,
      'dateModified': dateModified,
    };
  }
}
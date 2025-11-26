class Product {
  final int id;
  final String title;
  final String slug;
  final double price;
  final String description;
  final Category category;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      slug: json['slug'] ?? '',
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'],
      description: json['description'] ?? 'No description',
      category: Category.fromJson(json['category']),
      images: List<String>.from(json['images'] ?? []),
    );
  }
}

class Category {
  final int id;
  final String name;
  final String image;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}
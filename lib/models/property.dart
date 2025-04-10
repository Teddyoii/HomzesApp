class Property {
  final String id;
  final String title;
  final String imageUrl;
  final String location;
  final double price;
  final int beds;
  final int baths;
  final bool isFeatured;
  final bool isNew;
  final double? rating;
  final int? reviews;
  final String? priceUnit;

  Property({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.price,
    required this.beds,
    required this.baths,
    this.isFeatured = false,
    this.isNew = false,
    this.rating,
    this.reviews,
    this.priceUnit,
  });

  factory Property.fromJson(Map<String, dynamic> json, String docId) {
    int parseIntSafely(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    double parseDoubleSafely(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    bool parseBoolSafely(dynamic value) {
      if (value == null) return false;
      if (value is bool) return value;
      if (value is String) return value.toLowerCase() == 'true';
      if (value is int) return value == 1;
      return false;
    }

    return Property(
      id: docId,
      title: json['title']?.toString() ?? '',
      imageUrl: json['image']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      price: parseDoubleSafely(json['price']),
      beds: parseIntSafely(json['number_of_beds']),
      baths: parseIntSafely(json['number_of_bathrooms']),
      isFeatured: parseBoolSafely(json['is_featured']),
      isNew: parseBoolSafely(json['is_new']),
      rating: json['rating'] != null ? parseDoubleSafely(json['rating']) : null,
      reviews: json['reviews'] != null ? parseIntSafely(json['reviews']) : null,
      priceUnit: json['price_unit']?.toString(),
    );
  }
}

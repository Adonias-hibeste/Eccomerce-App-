class EliteProduct {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String imageUrl;
  final String description;
  final List<String> availableSizes;
  final bool isNewArrival;

  EliteProduct({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
    this.description = '',
    this.availableSizes = const [],
    this.isNewArrival = false,
  });
}

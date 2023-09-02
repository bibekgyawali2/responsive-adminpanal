import 'productmodel.dart';

class OrderModal {
  final String city;
  final String country;
  final String postalCode;
  final String province;
  final String street;
  final String orderId;
  final String otherDescription;
  final String phone;
  final List<Product> products;
  final String userId;
  final double totalPrice;

  OrderModal({
    required this.city,
    required this.country,
    required this.postalCode,
    required this.province,
    required this.street,
    required this.orderId,
    required this.otherDescription,
    required this.phone,
    required this.products,
    required this.userId,
    required this.totalPrice,
  });

  factory OrderModal.fromJson(Map<String, dynamic> json) {
    List<Product> products = (json['products'] as List)
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return OrderModal(
      city: json['City'],
      country: json['Country'],
      postalCode: json['PostalCode'],
      province: json['Province'],
      street: json['Street'],
      orderId: json['orderId'],
      otherDescription: json['otherDesCription'],
      phone: json['phone'],
      products: products,
      userId: json['user_id'],
      totalPrice: json['totalPrice'].toDouble(),
    );
  }
}

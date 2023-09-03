import 'package:ecommerce_admin/constants.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String email;
  final String phone;
  final String shippingAddress;
  final double totalPrice;
  final String status;
  final String date;
  final List<Product> products; // Assuming you have a Product class

  OrderDetailPage({
    required this.orderId,
    required this.customerName,
    required this.email,
    required this.phone,
    required this.shippingAddress,
    required this.totalPrice,
    required this.status,
    required this.date,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: defaultPadding),
            DataTable(
              columns: const [
                DataColumn(label: Text('Attribute')),
                DataColumn(label: Text('Value')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('Order ID')),
                    DataCell(Text(orderId)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Customer')),
                    DataCell(Text(customerName)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Email')),
                    DataCell(Text(email)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Phone')),
                    DataCell(Text(phone)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Shipping Address')),
                    DataCell(Text(shippingAddress)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Total Amount')),
                    DataCell(Text('\$${totalPrice.toStringAsFixed(2)}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Status')),
                    DataCell(Text(status)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Date')),
                    DataCell(Text(date)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: defaultPadding),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Update Status'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: const Text(
                              'Are you sure you want to delete this order?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Delete Order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

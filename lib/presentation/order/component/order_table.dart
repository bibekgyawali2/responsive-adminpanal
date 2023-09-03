import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../cubits/order_cubit/order_cubit.dart';
import '../order_detail.dart';

class OrderTable extends StatefulWidget {
  const OrderTable({super.key});

  @override
  State<OrderTable> createState() => _OrderTableState();
}

class _OrderTableState extends State<OrderTable> {
  TextEditingController _searchController =
      TextEditingController(); // Add this line

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Orders",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SearchBar(
                trailing: const [Icon(Icons.search)],
                elevation: MaterialStateProperty.resolveWith((states) => 0),
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => secondaryColor,
                ),
                shape: MaterialStateProperty.resolveWith((states) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ), // Adjust the radius as needed
                  );
                }),

                onChanged: (value) {
                  // Add a callback to handle search input changes
                  setState(() {
                    // Update the UI when the search input changes
                    // You can filter orders here based on Order ID
                  });
                },
                controller: _searchController, // Pass the controller
              )
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state is FetchOrderSuccess) {
                // Filter orders based on the search input
                final filteredOrders = state.productList.where(
                    (order) => order.orderId.contains(_searchController.text));

                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Order ID')),
                        DataColumn(label: Text('Customer ID')),
                        DataColumn(label: Text('Total Amount')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: filteredOrders.map((order) {
                        return DataRow(
                          cells: [
                            DataCell(Text(order.orderId)),
                            DataCell(Text(order.userId)),
                            DataCell(Text(order.totalPrice.toStringAsFixed(2))),
                            const DataCell(Text('pending')),
                            DataCell(Text(order.province)),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      // Handle edit action
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => OrderDetailPage(
                                              orderId: '1',
                                              customerName: 'John Doe',
                                              email: 'john.doe@example.com',
                                              phone: '555-555-5555',
                                              shippingAddress:
                                                  '123 Main St, Anytown, USA',
                                              totalPrice: 100.0,
                                              status: 'Pending',
                                              date: '2022/2/2',
                                              products: [
                                                Product(
                                                  name: 'Product 1',
                                                  price: 25.0,
                                                  imageUrl:
                                                      'https://example.com/product1.jpg', // Replace with actual image URL
                                                ),
                                                Product(
                                                  name: 'Product 2',
                                                  price: 30.0,
                                                  imageUrl:
                                                      'https://example.com/product2.jpg', // Replace with actual image URL
                                                ),
                                              ]
                                              // Include other order details here
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      // Handle delete action
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                );
              } else if (state is OrderLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Text("Error");
              }
            },
          ),
        ],
      ),
    );
  }
}

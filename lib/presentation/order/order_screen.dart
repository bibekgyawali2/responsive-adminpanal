import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/cubits/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Orders',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding),
              BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  if (state is FetchOrderSuccess) {
                    return Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: DataTable(
                            // columnSpacing: 120,
                            columns: const [
                              DataColumn(label: Text('Order ID')),
                              DataColumn(label: Text('Customer ID')),
                              DataColumn(label: Text('Total Amount')),
                              DataColumn(label: Text('Status')),
                              DataColumn(label: Text('Date')),
                              DataColumn(label: Text('Actions')),
                            ],
                            rows: state.productList.map((order) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(order.orderId)),
                                  DataCell(Text(order.userId)),
                                  DataCell(Text(
                                      order.totalPrice.toStringAsFixed(2))),
                                  DataCell(Text('pending')),
                                  DataCell(Text(order.province)),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            // Handle edit action
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
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
        ),
      ),
    );
  }
}

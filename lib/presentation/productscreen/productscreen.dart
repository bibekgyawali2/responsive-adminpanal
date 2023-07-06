import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/all_product_button.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/header.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/myfeilds.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: defaultPadding),
                const AllProductButton(),
                const SizedBox(height: defaultPadding),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: defaultPadding,
                    crossAxisSpacing: defaultPadding,
                  ),
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.amber,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

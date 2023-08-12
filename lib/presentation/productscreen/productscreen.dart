import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/cubits/fetch_product_cubit/fetch_product_cubit.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/all_product_button.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/header.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                BlocBuilder<FetchProductCubit, FetchProductState>(
                  builder: (context, state) {
                    if (state is FetchProductSuccess) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: defaultPadding,
                          crossAxisSpacing: defaultPadding,
                        ),
                        itemCount: state.productList.length,
                        itemBuilder: (context, index) {
                          return ProductsCard(
                            product: state.productList[index],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
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

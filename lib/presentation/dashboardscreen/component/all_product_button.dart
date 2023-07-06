import 'package:ecommerce_admin/constants.dart';
import 'package:flutter/material.dart';

import 'dialog.dart';

class AllProductButton extends StatelessWidget {
  const AllProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "All Products",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding,
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ShippingAddressDialog();
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Product'),
        ),
      ],
    );
  }
}

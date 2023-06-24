import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/models/MyFiles.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/file_info_cards.dart';
import 'package:flutter/material.dart';

class MyFeilds extends StatelessWidget {
  const MyFeilds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
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
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Product'),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: defaultPadding,
          ),
          itemCount: demoMyFiels.length,
          itemBuilder: (context, index) {
            return FileInfoCard(info: demoMyFiels[index]);
          },
        ),
      ],
    );
  }
}

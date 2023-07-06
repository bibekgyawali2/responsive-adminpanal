import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/models/MyFiles.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/dialog.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/file_info_cards.dart';
import 'package:ecommerce_admin/responsive.dart';
import 'package:flutter/material.dart';

import 'all_product_button.dart';

class MyFeilds extends StatelessWidget {
  const MyFeilds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AllProductButton(),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        )
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    this.childAspectRatio = 1,
    this.crossAxisCount = 4,
    super.key,
  });
  final int crossAxisCount;
  final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: demoMyFiels.length,
      itemBuilder: (context, index) {
        return FileInfoCard(info: demoMyFiels[index]);
      },
    );
  }
}

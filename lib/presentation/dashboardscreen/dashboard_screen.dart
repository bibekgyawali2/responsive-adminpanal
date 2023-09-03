import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/productdetail.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/recent_files.dart';
import 'package:ecommerce_admin/presentation/order/component/order_table.dart';
import 'package:ecommerce_admin/responsive.dart';
import 'package:flutter/material.dart';

import 'component/header.dart';
import 'component/myfeilds.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyFeilds(),
                      const SizedBox(height: defaultPadding),
                      const OrderTable(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const StorageDetails(),
                    ],
                  ),
                ),
                const SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
                  const Expanded(flex: 2, child: StorageDetails()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

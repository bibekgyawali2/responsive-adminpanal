import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/productdetail.dart';
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
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFeilds(),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container()
                    ],
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(flex: 2, child: StorageDetails()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

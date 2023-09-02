import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/productdetail.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/component/recent_files.dart';
import 'package:ecommerce_admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final dashboardCubit = context.read<DashboardCubit>();

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
                    children: [
                      const MyFeilds(),
                      const SizedBox(height: defaultPadding),
                      const RecentFiles(),
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

import 'package:ecommerce_admin/controllers/MenuController.dart';
import 'package:ecommerce_admin/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:ecommerce_admin/presentation/dashboardscreen/dashboard_screen.dart';
import 'package:ecommerce_admin/presentation/order/order_screen.dart';
import 'package:ecommerce_admin/presentation/productscreen/productscreen.dart';
import 'package:ecommerce_admin/presentation/widgets/side_menu.dart';
import 'package:ecommerce_admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              flex: 1,
              child: SideMenu(),
            ),
          Expanded(
              flex: 5,
              child: BlocBuilder<DashboardCubit, DashboardItem>(
                builder: (context, state) {
                  if (state == DashboardItem.dashboard) {
                    return const DashBoardScreen();
                  } else if (state == DashboardItem.productscreen) {
                    return const ProductsListScreen();
                  } else {
                    return const OrderScreen();
                  }
                },
              )),
        ],
      ),
    );
  }
}

import 'package:ecommerce_admin/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dashboardCubit = context.read<DashboardCubit>();

    final items = [
      DashboardItem.dashboard,
      DashboardItem.productscreen,
      DashboardItem.order,
    ];

    final itemNames = [
      "Dashboard",
      "Products",
      "Orders",
      "Notifications",
      "Transaction",
      "Carts",
      "Users"
    ];

    final svgIcons = [
      'assets/icons/menu_dashbord.svg',
      'assets/icons/menu_dashbord.svg',
      'assets/icons/menu_doc.svg',
      'assets/icons/menu_notification.svg',
      'assets/icons/menu_task.svg',
      'assets/icons/menu_store.svg',
      'assets/icons/menu_task.svg',
    ];

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/logo.png'),
            ),
            for (var i = 0; i < items.length; i++)
              DrawerListTile(
                press: () {
                  dashboardCubit.selectItem(items[i]);
                },
                title: itemNames[i],
                svgSrc: svgIcons[i],
              ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    required this.svgSrc,
    required this.press,
    required this.title,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}

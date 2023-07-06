import 'package:ecommerce_admin/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dashboardCubit = context.read<DashboardCubit>();
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/logo.png'),
            ),
            DrawerListTile(
              press: () {
                dashboardCubit.selectItem(DashboardItem.item_1);
              },
              title: "Dashboard",
              svgSrc: 'assets/icons/menu_dashbord.svg',
            ),
            DrawerListTile(
              press: () {
                dashboardCubit.selectItem(DashboardItem.item_2);
              },
              title: "Products",
              svgSrc: 'assets/icons/menu_dashbord.svg',
            ),
            DrawerListTile(
              press: () {},
              title: "Transactions",
              svgSrc: 'assets/icons/menu_doc.svg',
            ),
            DrawerListTile(
              press: () {},
              title: "Notifications",
              svgSrc: 'assets/icons/menu_notification.svg',
            ),
            DrawerListTile(
              press: () {},
              title: "Orders",
              svgSrc: 'assets/icons/menu_task.svg',
            ),
            DrawerListTile(
              press: () {},
              title: "Carts",
              svgSrc: 'assets/icons/menu_store.svg',
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/logo.png'),
            ),
            DrawerListTile(
              press: () {},
              title: "Dashboard",
              svgSrc: 'icons/menu_dashbord.svg',
            ),
            DrawerListTile(
              press: () {},
              title: "Products",
              svgSrc: 'icons/menu_dashbord.svg',
            ),
            DrawerListTile(
              press: () {},
              title: "Transactions",
              svgSrc: 'icons/menu_doc.svg',
            ),
            DrawerListTile(
              press: () {},
              title: "Notifications",
              svgSrc: 'icons/menu_notification.svg',
            ),
            DrawerListTile(
              press: () {},
              title: "Orders",
              svgSrc: 'icons/menu_task.svg',
            ),
            DrawerListTile(
              press: () {},
              title: "Carts",
              svgSrc: 'icons/menu_store.svg',
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

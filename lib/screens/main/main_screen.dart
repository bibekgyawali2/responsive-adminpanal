import 'package:ecommerce_admin/presentation/dashboardscreen/dashboard_screen.dart';
import 'package:ecommerce_admin/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SideMenu(),
          ),
          Expanded(
            flex: 5,
            child: DashBoardScreen(),
          ),
        ],
      ),
    );
  }
}

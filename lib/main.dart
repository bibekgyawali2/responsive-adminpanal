import 'package:ecommerce_admin/cubits/fetch_product_cubit/fetch_product_cubit.dart';
import 'package:ecommerce_admin/data/datasources/fetchorder/fetchorder.dart';
import 'package:ecommerce_admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'controllers/MenuController.dart';
import 'cubits/dashboard_cubit/dashboard_cubit.dart';
import 'cubits/order_cubit/order_cubit.dart';
import 'data/datasources/fetchproducts/fetchproduct.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        //useMaterial3: true,
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DashboardCubit>(
            create: (context) => DashboardCubit(),
          ),
          BlocProvider<FetchProductCubit>(
            create: (context) =>
                FetchProductCubit(FetchProducts())..fetchProducts(),
          ),
          BlocProvider<OrderCubit>(
            create: (context) => OrderCubit(FetchOrder())..fetchOrders(),
          ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuAppController(),
            ),
          ],
          child: const MainScreen(),
        ),
      ),
    );
  }
}

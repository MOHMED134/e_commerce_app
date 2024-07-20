import 'package:final_project/models/pref_Services.dart';
import 'package:final_project/providers/ProductProvider.dart';
import 'package:final_project/providers/cart_provider.dart';
import 'package:final_project/views/pages/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'Login_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();
  runApp(
      //   MultiProvider(providers: [
      //     ChangeNotifierProvider(create: (_) => ProductProvider()),
      //   ],
      //   child:
      // );
      MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}

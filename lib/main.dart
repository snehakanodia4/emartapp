import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/reg.dart';
import './screens/main_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/login.dart';
import './screens/reg.dart';
import './screens/LoginReg.dart';
import './screens/auth.dart';
import './models/cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Cart(),
      child: MaterialApp(
        title: 'E-Mart',
        // debugShowCheckedModeBanner: false;
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthPage(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          LoginPage.routeName: (ctx) => LoginPage(onTap: () {
                Navigator.pushNamed(context, '/reg');
              }),
          MainScreen.routeName: (ctx) => MainScreen(),
          RegisterPage.routeName: (ctx) => RegisterPage(onTap: () {
                Navigator.pushNamed(context, '/login');
              }),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mycart/Screens/cart_provider.dart';
import 'package:mycart/Screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((_) => CartProvider()),
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          title: 'flutterdemo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        );
      }),
    );
  }
}

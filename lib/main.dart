import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icy_shop/constants/colors.dart';
import 'package:icy_shop/features/home/screens/home_screen.dart';
import 'package:icy_shop/router.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,

        primarySwatch: Colors.orange,
        // primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: (settings) => generateRoute(settings),
      home: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff63ffda),
        fontFamily: 'Poppins',
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => const HomePage(),
      },
    );
  }
}

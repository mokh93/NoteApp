import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'Models/note_model.dart';
import 'Pages/home_page.dart';
import 'constants.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(khiveboxname);
  Hive.registerAdapter(NoteModelAdapter());
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

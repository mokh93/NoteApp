import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/bloc_obsever.dart';
import 'package:noteapp/cubit/cubit/add_note_cubit_cubit.dart';

import 'Models/note_model.dart';
import 'Pages/home_page.dart';
import 'constants.dart';
import 'cubit/note_cubit/cubit/note_cubit_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(khiveboxname);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubitCubit(),
      child: MaterialApp(
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
      ),
    );
  }
}

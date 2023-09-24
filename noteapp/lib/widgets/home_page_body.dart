import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/note_cubit/cubit/note_cubit_cubit.dart';

import 'custome_appbar.dart';
import 'note_listview.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    BlocProvider.of<NoteCubitCubit>(context).fitchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 35),
          CustomAppBar(
            title: 'Note',
            icon: Icons.search,
          ),
          NoteListView(),
        ],
      ),
    );
  }
}

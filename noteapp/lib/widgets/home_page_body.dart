import 'package:flutter/material.dart';

import 'custome_appbar.dart';
import 'note_listview.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 35),
          CustomAppBar(),
          NoteListView(),
        ],
      ),
    );
  }
}

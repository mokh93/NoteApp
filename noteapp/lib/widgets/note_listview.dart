import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Models/note_model.dart';

import '../cubit/note_cubit/cubit/note_cubit_cubit.dart';
import 'note_item_card.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: BlocBuilder<NoteCubitCubit, NoteCubitState>(
          builder: (context, state) {
            List<NoteModel> notes =
                BlocProvider.of<NoteCubitCubit>(context).note ?? [];
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteItem(
                  note: notes[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

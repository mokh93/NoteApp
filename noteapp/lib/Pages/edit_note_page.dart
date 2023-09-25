import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/cubit/note_cubit/cubit/note_cubit_cubit.dart';

import '../widgets/custom_textfield.dart';
import '../widgets/custome_appbar.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 35),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                BlocProvider.of<NoteCubitCubit>(context).fitchAllNotes();
                widget.note.save();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: Icons.done,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hintText: widget.note.title,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hintText: widget.note.content,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/constants.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());

  Color? color = const Color(0xffCA2E55);
  addNote(NoteModel note) async {
    note.color = color!.value;
    emit(AddNoteCubitLoading());
    try {
      var notesBox = Hive.box<NoteModel>(khiveboxname);
      await notesBox.add(note);
      emit(AddNoteCubitSuccess());
    } catch (e) {
      emit(AddNoteCubitFiler(errorMessage: e.toString()));
    }
  }
}

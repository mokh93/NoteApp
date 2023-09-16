import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/constants.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());

  addNote(NoteModel note) async {
    emit(AddNoteCubitLoading());
    try {
      var notesBox = Hive.box<NoteModel>(khiveboxname);
      emit(AddNoteCubitSuccess());
      await notesBox.add(note);
    } catch (e) {
      emit(AddNoteCubitFiler(errorMessage: e.toString()));
    }
  }
}

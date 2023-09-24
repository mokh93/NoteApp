import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/note_model.dart';

import '../../../constants.dart';

part 'note_cubit_state.dart';

class NoteCubitCubit extends Cubit<NoteCubitState> {
  NoteCubitCubit() : super(NoteCubitInitial());

  fitchAllNotes(NoteModel note) async {
    try {
      var notesBox = Hive.box<NoteModel>(khiveboxname);
      List<NoteModel> note = notesBox.values.toList();
      emit(NoteCubitSuccess(note));
    } catch (e) {
      emit(NoteCubitFiler(errorMessage: e.toString()));
    }
  }
}

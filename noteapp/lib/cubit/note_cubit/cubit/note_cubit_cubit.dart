import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/note_model.dart';

import '../../../constants.dart';

part 'note_cubit_state.dart';

class NoteCubitCubit extends Cubit<NoteCubitState> {
  NoteCubitCubit() : super(NoteCubitInitial());

  List<NoteModel>? note;
  fitchAllNotes() {
    var notesBox = Hive.box<NoteModel>(khiveboxname);

    note = notesBox.values.toList();
    emit(NoteCubitSuccess());
  }
}

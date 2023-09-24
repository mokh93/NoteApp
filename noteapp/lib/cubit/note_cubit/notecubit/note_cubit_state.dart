part of 'note_cubit_cubit.dart';

@immutable
sealed class NoteCubitState {}

final class NoteCubitInitial extends NoteCubitState {}

final class NoteCubitLoading extends NoteCubitState {}

final class NoteCubitSuccess extends NoteCubitState {
  final List<NoteModel> note;

  NoteCubitSuccess(this.note);
}

final class NoteCubitFiler extends NoteCubitState {
  final String errorMessage;

  NoteCubitFiler({required this.errorMessage});
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/cubit/cubit/add_note_cubit_cubit.dart';

import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubitCubit(),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 30,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
          listener: (context, state) {
            if (state is AddNoteCubitSuccess) {
              Navigator.pop(context);
            } else if (state is AddNoteCubitFiler) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('error : ${state.errorMessage}'),
                  ),
                );
            }
          },
          builder: (context, state) {
            return const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: AddFormField(),
            );
          },
        ),
      ),
    );
  }
}

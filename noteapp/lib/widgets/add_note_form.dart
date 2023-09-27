import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/cubit/cubit/add_note_cubit_cubit.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/cubit/note_cubit/cubit/note_cubit_cubit.dart';
import 'package:noteapp/widgets/colors_list_view.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class AddFormField extends StatefulWidget {
  const AddFormField({
    super.key,
  });

  @override
  State<AddFormField> createState() => _AddFormFieldState();
}

class _AddFormFieldState extends State<AddFormField> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();

  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (data) {
              title = data;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (data) {
              content = data;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          const ColorsListView(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomButton(
              text: 'Add',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  NoteModel note = NoteModel(
                      title: title!,
                      content: content!,
                      date: DateFormat.yMd().format(DateTime.now()),
                      color: Colors.blue.value);
                  BlocProvider.of<AddNoteCubitCubit>(context).addNote(note);
                  BlocProvider.of<NoteCubitCubit>(context).fitchAllNotes();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

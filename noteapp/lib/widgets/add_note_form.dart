import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/cubit/cubit/add_note_cubit_cubit.dart';

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
          // const CustomAppBar(
          //   title: 'Add Note',
          //   icon: Icons.done,
          // ),
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
            height: MediaQuery.of(context).size.height * 0.070,
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
                      date: DateTime.now().toString(),
                      color: Colors.blue.value);
                  BlocProvider.of<AddNoteCubitCubit>(context).addNote(note);
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

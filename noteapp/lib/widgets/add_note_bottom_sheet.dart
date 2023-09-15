import 'package:flutter/material.dart';
import 'package:noteapp/widgets/custome_appbar.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomAppBar(
              title: 'Add Note',
              icon: Icons.done,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Title',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Content',
              maxLines: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.070,
            ),
            CustomButton(
              text: 'Add',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

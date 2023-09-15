import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';
import '../widgets/custome_appbar.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 35),
            const CustomAppBar(
              title: 'Edit Note',
              icon: Icons.done,
            ),
            const SizedBox(
              height: 50,
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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.maxLines = 1,
  });

  final String hintText;
  final int maxLines;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: Theme.of(context).primaryColor,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This Field is required';
        }
      },
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        hintText: hintText,
        enabledBorder: outlineinputborder(context, Colors.white),
        focusedBorder: outlineinputborder(context),
      ),
    );
  }

  OutlineInputBorder outlineinputborder(BuildContext context, [color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(20),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.maxLines = 1,
    this.onSaved,
  });

  final String hintText;
  final int maxLines;
  Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: Theme.of(context).primaryColor,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This Field is required';
        } else {
          null;
        }
      },
      onSaved: onSaved,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        hintText: hintText,
        enabledBorder: outlineinputborder(context, Colors.white),
        focusedBorder: outlineinputborder(context),
        errorBorder: outlineinputborder(context, Colors.red),
        focusedErrorBorder: outlineinputborder(context, Colors.red),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  final String task;
  TaskTile({
    super.key,
    required this.task,
    required this.checkboxValue,
    required this.onChanged,
  });

  final void Function(bool?)? onChanged;
  final bool? checkboxValue;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        activeColor: Colors.lightBlueAccent,
        value: checkboxValue,
        title: Text(
          task,
          style: GoogleFonts.lato(
              decoration: checkboxValue == true
                  ? TextDecoration.combine(
                      [TextDecoration.lineThrough, TextDecoration.underline])
                  : null,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        ),
        onChanged: onChanged);
  }
}

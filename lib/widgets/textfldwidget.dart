import 'package:flutter/material.dart';
//import 'package:project1/classes/product.dart';
//import 'package:provider/provider.dart';

class Txtfield extends StatelessWidget {
  final TextEditingController editor;
  final String label, hint;
  const Txtfield(this.editor, this.label, this.hint, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: editor,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            label: Text(label),
            hintText: hint),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TxtfieldEdit extends StatefulWidget {
  final String label;
  final String init;
  final TextEditingController editor;
  const TxtfieldEdit(this.editor, this.label, this.init, {Key? key})
      : super(key: key);

  @override
  State<TxtfieldEdit> createState() => _TxtfieldEditState();
}

class _TxtfieldEditState extends State<TxtfieldEdit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.editor..text = widget.init,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          label: Text(widget.label),
        ),
      ),
    );
  }
}

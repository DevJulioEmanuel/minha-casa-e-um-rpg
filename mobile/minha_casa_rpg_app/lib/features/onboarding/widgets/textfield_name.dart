import 'package:flutter/material.dart';

class TextfieldName extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  
  const TextfieldName({
    super.key,
    required this.label,
    required this.controller,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      controller: controller,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.red
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.red
          )
        ),
      ),
    );
  }
}
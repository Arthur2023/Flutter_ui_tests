import 'package:flutter/material.dart';

InputDecoration outlined({String hint = ''}) => InputDecoration(
  border: const OutlineInputBorder(),
  hintText: hint,
);
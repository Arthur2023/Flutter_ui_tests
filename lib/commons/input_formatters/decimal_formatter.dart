import 'package:flutter/services.dart';

class DecimalFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final regExp = RegExp(r'^\d\.?\d*');

    final value = regExp.stringMatch(newValue.text);
    final oldL = oldValue.text.length;

    return value == newValue.text
        ? TextEditingValue(text: newValue.text, selection: newValue.selection.copyWith())
        : TextEditingValue(
            text: oldValue.text,
            selection: newValue.selection.copyWith(
              baseOffset: oldL,
              extentOffset: oldL,
            ));
  }
}

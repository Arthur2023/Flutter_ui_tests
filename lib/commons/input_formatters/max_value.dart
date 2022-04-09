import 'package:flutter/services.dart';

class CustomMaxValueInputFormatter extends TextInputFormatter {
  CustomMaxValueInputFormatter(this.maxValue);

  double maxValue;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String truncated = newValue.text;
    final newSelection = newValue.selection;

    final value = double.tryParse(truncated);

    if (value == null) {
      return TextEditingValue(text: '', selection: newSelection.copyWith(baseOffset: 0, extentOffset: 0));
    }

    if (value > maxValue) {
      truncated = maxValue.toString();
    }

    int textLength = truncated.length;
    return TextEditingValue(
      text: truncated,
      selection: newSelection.copyWith(
        baseOffset: textLength,
        extentOffset: textLength,
      ),
    );
  }
}

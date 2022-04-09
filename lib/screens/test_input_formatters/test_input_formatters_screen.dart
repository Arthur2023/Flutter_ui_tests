import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tests_ui/commons/commons_export/layout_export.dart';
import 'package:flutter_tests_ui/commons/input_formatters/decimal_formatter.dart';

class TestInputFormattersScreen extends StatelessWidget{
  const TestInputFormattersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TextInputFormatters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: outlined(hint: 'Limite de cinco caracters'),
              inputFormatters: [
                LengthLimitingTextInputFormatter(5),
              ],
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: outlined(hint: 'Até 10 letras'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: outlined(hint: 'Limite de 5.5'),
              inputFormatters: [
                CustomMaxValueInputFormatter(5.5),
              ],
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: outlined(hint: 'Simples decimal'),
              inputFormatters: [
                DecimalFormatter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
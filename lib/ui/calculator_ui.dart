import 'package:flutter/material.dart';
import '../logic/calculator_logic.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String _output = "0";

  final CalculatorLogic _calculatorLogic = CalculatorLogic();

  void _onButtonPressed(String value) {
    setState(() {
      _output = _calculatorLogic.handleInput(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(color: Colors.grey),
          _buildButtonGrid(),
        ],
      ),
    );
  }

  Widget _buildButtonGrid() {
    const buttonLabels = [
      "C", "⌫", "%", "/",
      "7", "8", "9", "x",
      "4", "5", "6", "-",
      "1", "2", "3", "+",
      "0", ".", "=",
    ];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: buttonLabels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final label = buttonLabels[index];
        final isOperator = ["C", "⌫", "%", "/", "x", "-", "+", "="].contains(label);

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isOperator ? Colors.orange : Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
          ),
          onPressed: () => _onButtonPressed(label),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24,
              color: isOperator ? Colors.white : Colors.orange[300],
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

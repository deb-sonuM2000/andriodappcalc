class CalculatorLogic {
  String _output = "0";
  String _operand = "";
  double _num1 = 0;
  double _num2 = 0;

  String handleInput(String value) {
    if (value == "C") {
      _output = "0";
      _num1 = 0;
      _num2 = 0;
      _operand = "";
    } else if (value == "⌫") {
      _output = _output.length > 1 ? _output.substring(0, _output.length - 1) : "0";
    } else if (value == "%" || value == "/" || value == "x" || value == "-" || value == "+") {
      _operand = value;
      _num1 = double.tryParse(_output) ?? 0;
      _output = "0";
    } else if (value == "=") {
      _num2 = double.tryParse(_output) ?? 0;
      _output = _calculateResult();
      _operand = "";
    } else {
      if (_output == "0") {
        _output = value;
      } else {
        _output += value;
      }
    }

    return _output;
  }

  String _calculateResult() {
    double result = 0;
    switch (_operand) {
      case "+":
        result = _num1 + _num2;
        break;
      case "-":
        result = _num1 - _num2;
        break;
      case "x":
        result = _num1 * _num2;
        break;
      case "/":
        result = _num1 / _num2;
        break;
      case "%":
        result = _num1 % _num2;
        break;
    }

    return result.toStringAsFixed(2).replaceAll(RegExp(r"\.0+$"), "");
  }
}

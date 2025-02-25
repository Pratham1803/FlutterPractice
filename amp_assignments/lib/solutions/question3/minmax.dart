import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Minmax extends StatefulWidget {
  const Minmax({super.key});

  @override
  State<Minmax> createState() => _MinmaxState();
}

class _MinmaxState extends State<Minmax> {
  final _txtFirstNumCtrl = TextEditingController();
  final _txtSecondNumCtrl = TextEditingController();
  final _txtThirdNumCtrl = TextEditingController();

  String? _errorTextNum1;
  String? _errorTextNum2;
  String? _errorTextNum3;

  final double _heightBetweenTextFields = 30;
  var numbers = [];

  @override
  void dispose() {
    _txtFirstNumCtrl.dispose();
    _txtSecondNumCtrl.dispose();
    _txtThirdNumCtrl.dispose();
    super.dispose();
  }

  void _createAlertBox(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  }

  void _btnFindMaxClick() {
    if (!_validateInput()) {
      return;
    }

    if (numbers[0] > numbers[1] && numbers[0] > numbers[2]) {
      _createAlertBox('Maximum Number', '${numbers[0]} is Maximum Number');
    } else if (numbers[1] > numbers[0] && numbers[1] > numbers[2]) {
      _createAlertBox('Maximum Number', '${numbers[1]} is Maximum Number');
    } else {
      _createAlertBox('Maximum Number', '${numbers[2]} is Maximum Number');
    }
    _resetFields();
  }

  void _btnFindMinClick() {
    if (!_validateInput()) {
      return;
    }

    if (numbers[0] < numbers[1] && numbers[0] < numbers[2]) {
      _createAlertBox('Minimum Number', '${numbers[0]} is Minimum Number');
    } else if (numbers[1] < numbers[0] && numbers[1] < numbers[2]) {
      _createAlertBox('Minimum Number', '${numbers[1]} is Minimum Number');
    } else {
      _createAlertBox('Minimum Number', '${numbers[2]} is Minimum Number');
    }
    _resetFields();
  }

  void _resetFields(){
    _txtFirstNumCtrl.text = '';
    _txtSecondNumCtrl.text = '';
    _txtThirdNumCtrl.text = '';
  }

  bool _validateInput() {
    numbers.clear();
    setState(() {
      _errorTextNum1 =
          _txtFirstNumCtrl.text.isEmpty ? "Enter a Number here" : null;

      _errorTextNum2 =
          _txtSecondNumCtrl.text.isEmpty ? "Enter a Number here" : null;

      _errorTextNum3 =
          _txtThirdNumCtrl.text.isEmpty ? "Enter a Number here" : null;
    });
    if (_errorTextNum1 != null &&
        _errorTextNum2 != null &&
        _errorTextNum3 != null) {
      return false;
    }
    numbers.add(double.parse(_txtFirstNumCtrl.text));
    numbers.add(double.parse(_txtSecondNumCtrl.text));
    numbers.add(double.parse(_txtThirdNumCtrl.text));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'MinMax Finder'),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Find Min & Max Number',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color:
                          Theme.of(context).colorScheme.onPrimaryFixedVariant,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _txtFirstNumCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                  ],
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: 'Enter First Number',
                    errorText: _errorTextNum1,
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceDim),
                  ),
                ),
                SizedBox(
                  height: _heightBetweenTextFields,
                ),
                TextField(
                  controller: _txtSecondNumCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                  ],
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: 'Enter Second Number',
                    errorText: _errorTextNum2,
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceDim),
                  ),
                ),
                SizedBox(
                  height: _heightBetweenTextFields,
                ),
                TextField(
                  controller: _txtThirdNumCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                  ],
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    errorText: _errorTextNum3,
                    hintText: 'Enter Third Number',
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceDim),
                  ),
                ),
                SizedBox(
                  height: _heightBetweenTextFields + 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _btnFindMaxClick,
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withOpacity(0.5);
                          } else {
                            return Theme.of(context).colorScheme.primary;
                          }
                        }),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                      child: Text(
                        'Show Max',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: _btnFindMinClick,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                      child: const Text('Show Min'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
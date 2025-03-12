import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// **MinMax Finder Stateful Widget**
class Minmax extends StatefulWidget {
  const Minmax({super.key});

  @override
  State<Minmax> createState() => _MinmaxState();
}

class _MinmaxState extends State<Minmax> {
  // Controllers for user input fields
  final _txtFirstNumCtrl = TextEditingController();
  final _txtSecondNumCtrl = TextEditingController();
  final _txtThirdNumCtrl = TextEditingController();

  // Error messages for input validation
  String? _errorTextNum1;
  String? _errorTextNum2;
  String? _errorTextNum3;

  // UI spacing variable
  final double _heightBetweenTextFields = 30;

  // Stores user input numbers
  var numbers = [];

  /// **Dispose controllers when widget is removed**
  @override
  void dispose() {
    _txtFirstNumCtrl.dispose();
    _txtSecondNumCtrl.dispose();
    _txtThirdNumCtrl.dispose();
    super.dispose();
  }

  /// **Creates an AlertDialog to display results**
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

  /// **Finds Maximum Number**
  void _btnFindMaxClick() {
    if (!_validateInput()) return; // Validate input first

    double maxNumber =
        numbers.reduce((curr, next) => curr > next ? curr : next);
    _createAlertBox('Maximum Number', '$maxNumber is the Maximum Number');
    _resetFields();
  }

  /// **Finds Minimum Number**
  void _btnFindMinClick() {
    if (!_validateInput()) return; // Validate input first

    double minNumber =
        numbers.reduce((curr, next) => curr < next ? curr : next);
    _createAlertBox('Minimum Number', '$minNumber is the Minimum Number');
    _resetFields();
  }

  /// **Resets all input fields**
  void _resetFields() {
    _txtFirstNumCtrl.clear();
    _txtSecondNumCtrl.clear();
    _txtThirdNumCtrl.clear();
  }

  /// **Validates user input and checks for empty fields**
  bool _validateInput() {
    numbers.clear(); // Reset numbers list

    setState(() {
      _errorTextNum1 = _txtFirstNumCtrl.text.isEmpty ? "Enter a Number" : null;
      _errorTextNum2 = _txtSecondNumCtrl.text.isEmpty ? "Enter a Number" : null;
      _errorTextNum3 = _txtThirdNumCtrl.text.isEmpty ? "Enter a Number" : null;
    });

    // If any error exists, return false
    if (_errorTextNum1 != null ||
        _errorTextNum2 != null ||
        _errorTextNum3 != null) {
      return false;
    }

    // Convert inputs to double and store them
    numbers.add(double.parse(_txtFirstNumCtrl.text));
    numbers.add(double.parse(_txtSecondNumCtrl.text));
    numbers.add(double.parse(_txtThirdNumCtrl.text));

    return true;
  }

  /// **Build Method - UI**
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
                // **Title**
                Text(
                  'Find Min & Max Number',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color:
                          Theme.of(context).colorScheme.onPrimaryFixedVariant,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 50),

                // **First Number Input**
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
                SizedBox(height: _heightBetweenTextFields),

                // **Second Number Input**
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
                SizedBox(height: _heightBetweenTextFields),

                // **Third Number Input**
                TextField(
                  controller: _txtThirdNumCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                  ],
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: 'Enter Third Number',
                    errorText: _errorTextNum3,
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceDim),
                  ),
                ),
                SizedBox(height: _heightBetweenTextFields + 30),

                // **Buttons: Show Max & Show Min**
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // **Show Max Button**
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
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),

                    // **Show Min Button**
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

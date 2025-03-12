import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';

/// Stateful widget to manage input fields and calculations
class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  // Controllers for input fields
  final _controllerPrincipalAmount = TextEditingController();
  final _controllerRateOfInterest = TextEditingController();
  final _controllerNumberOfYears = TextEditingController();

  // Error message variables
  String? _errorMsgPrincipalAmt;
  String? _errorMsgRateOfInterest;
  String? _errorMsgNumberOfYears;

  /// Dispose controllers to free resources when widget is destroyed
  @override
  void dispose() {
    _controllerNumberOfYears.dispose();
    _controllerPrincipalAmount.dispose();
    _controllerRateOfInterest.dispose();
    super.dispose();
  }

  /// Validates user inputs and updates error messages
  void _validateInput() {
    setState(() {
      _errorMsgPrincipalAmt = _controllerPrincipalAmount.text.isEmpty
          ? 'Fill Principal Amount'
          : null;
      _errorMsgRateOfInterest = _controllerRateOfInterest.text.isEmpty
          ? 'Fill Rate Of Interest'
          : null;
      _errorMsgNumberOfYears =
          _controllerNumberOfYears.text.isEmpty ? 'Fill Number Of Years' : null;
    });
  }

  /// Resets all input fields and clears error messages
  void _resetTextFields() {
    _controllerPrincipalAmount.clear();
    _controllerRateOfInterest.clear();
    _controllerNumberOfYears.clear();

    setState(() {
      _errorMsgPrincipalAmt = null;
      _errorMsgRateOfInterest = null;
      _errorMsgNumberOfYears = null;
    });
  }

  /// Calculates Simple Interest and displays the result in a dialog
  void _calculateInterest() {
    _validateInput(); // Validate inputs before calculation

    // Ensure no errors before proceeding
    if (_errorMsgPrincipalAmt == null &&
        _errorMsgRateOfInterest == null &&
        _errorMsgNumberOfYears == null) {
      double principalAmount = double.parse(_controllerPrincipalAmount.text);
      double rateOfInterest = double.parse(_controllerRateOfInterest.text);
      double numberOfYears = double.parse(_controllerNumberOfYears.text);

      double simpleInterest =
          (principalAmount * rateOfInterest * numberOfYears) / 100;

      // Show result in AlertDialog
      AlertDialog dialog = AlertDialog(
        title: const Text('Simple Interest'),
        content: Text(
            'The Simple Interest is ₹${simpleInterest.toStringAsFixed(2)}'),
        actions: [
          TextButton(
            onPressed: () {
              _resetTextFields();
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      );

      showDialog(context: context, builder: (context) => dialog);
    }
  }

  /// **Build Method - UI**
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Calculate Simple Interest'),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // **Title**
                Text(
                  'Calculate Simple Interest',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 50),

                // **Principal Amount Field**
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerPrincipalAmount,
                  decoration: InputDecoration(
                    labelText: 'Principal Amount',
                    hintText: 'Enter Principal Amount',
                    errorText: _errorMsgPrincipalAmt,
                    errorStyle:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // **Rate of Interest Field**
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerRateOfInterest,
                  decoration: InputDecoration(
                    labelText: 'Rate of Interest (%)',
                    hintText: 'Enter Rate of Interest',
                    errorText: _errorMsgRateOfInterest,
                    errorStyle:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // **Number of Years Field**
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerNumberOfYears,
                  decoration: InputDecoration(
                    labelText: 'Term (Years)',
                    hintText: 'Enter Number of Years',
                    errorText: _errorMsgNumberOfYears,
                    errorStyle:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 45),

                // **Buttons: Reset & Calculate**
                Row(
                  children: [
                    const Spacer(),

                    // **Reset Button**
                    OutlinedButton(
                      onPressed: _resetTextFields,
                      child: const Text('Reset'),
                    ),
                    const SizedBox(width: 10),

                    // **Calculate Interest Button**
                    ElevatedButton(
                      onPressed: _calculateInterest,
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Text(
                        'Calculate Interest',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
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

import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  final _controllerPrincipalAmount = TextEditingController();
  final _controllerRateOfInterest = TextEditingController();
  final _controllerNumberOfYears = TextEditingController();

  String? _errorMsgPrincipalAmt;
  String? _errorMsgRateOfInterest;
  String? _errorMsgNumberOfYears;

  @override
  void dispose() {
    _controllerNumberOfYears.dispose();
    _controllerPrincipalAmount.dispose();
    _controllerRateOfInterest.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      _errorMsgNumberOfYears =
          _controllerNumberOfYears.text.isEmpty ? 'Fill Number Of Years' : null;
      _errorMsgPrincipalAmt = _controllerPrincipalAmount.text.isEmpty
          ? 'Fill Principal Amount'
          : null;
      _errorMsgRateOfInterest = _controllerRateOfInterest.text.isEmpty
          ? 'Fill Rate Of Interest'
          : null;
    });
  }

  void _resetTextFields() {
    _controllerNumberOfYears.text = '';
    _controllerPrincipalAmount.text = '';
    _controllerRateOfInterest.text = '';

  setState(() {
    _errorMsgNumberOfYears = null;    
    _errorMsgPrincipalAmt = null;
    _errorMsgRateOfInterest = null;
  });    
  }

  void _calculateInterest() {
    _validateInput();

    double principalAmount = double.parse(_controllerPrincipalAmount.text);
    double rateOfInterest = double.parse(_controllerRateOfInterest.text);
    double numberOfYears = double.parse(_controllerNumberOfYears.text);
    double simpleInterest =
        (principalAmount * rateOfInterest * numberOfYears) / 100;

    AlertDialog dialog = AlertDialog(
      title: const Text('Simple Interest'),
      content: Text('The Simple Interest is $simpleInterest'),
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
                Text(
                  'Calculate Simple Interest',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerPrincipalAmount,
                  decoration: InputDecoration(
                    labelText: 'Principal Amount',
                    hintText: 'Enter a Principal Amount',
                    errorText: _errorMsgPrincipalAmt,
                    errorStyle:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceDim),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerRateOfInterest,
                  decoration: InputDecoration(
                    labelText: 'Rate of Interest',
                    hintText: 'Enter a Rate of Intereset',
                    errorText: _errorMsgRateOfInterest,
                    errorStyle:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceDim),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerNumberOfYears,
                  decoration: InputDecoration(
                    labelText: 'Term in Year',
                    hintText: 'Enter Number of Years',
                    errorText: _errorMsgNumberOfYears,
                    errorStyle:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceDim),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    const Spacer(),
                    OutlinedButton(
                      onPressed: _resetTextFields,
                      child: const Text('Reset'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: _calculateInterest,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(10),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Text(
                        'Calculate Interest',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
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

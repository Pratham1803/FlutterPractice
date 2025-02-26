import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Question10 extends StatefulWidget {
  const Question10({super.key});

  @override
  State<Question10> createState() => _Question10State();
}

class _Question10State extends State<Question10> {
  final _ctrlUserName = TextEditingController();
  final _ctrlPsw = TextEditingController();

  bool _isUserEmpty = false;
  bool _isPswEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Login'),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.blue.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome User',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField('userName'),
                    const SizedBox(height: 20),
                    _buildTextField('password'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _btnLoginClicked,
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _btnLoginClicked() {
    setState(() {
      if (_isValidInput()) {
        return;
      }

      if (_ctrlUserName.text == 'admin' && _ctrlPsw.text == 'admin') {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/q10/welcome');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Invalid Credentials'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                Navigator.pushNamed(context, '/q10/errorMsg');
              },
            ),
          ),
        );
      }
      _reset();
    });
  }

  bool _isValidInput() {
    var flag = false;
    if (_ctrlUserName.text.isEmpty) {
      flag = _isUserEmpty = true;
    } else {
      _isUserEmpty = false;
    }
    if (_ctrlPsw.text.isEmpty) {
      flag = _isPswEmpty = true;
    } else {
      _isPswEmpty = false;
    }
    return flag;
  }

  void _reset() {
    _ctrlUserName.clear();
    _ctrlPsw.clear();
  }

  TextField _buildTextField(String type) {
    Map txtData = {
      'userName': {
        'label': 'User Name',
        'hint': 'Enter User Name Here',
        'error': 'User Name is Empty!!',
        'icon': Icons.person_2,
        'controller': _ctrlUserName
      },
      'password': {
        'label': 'Password',
        'hint': 'Enter Password Here',
        'error': 'Password is Empty!!',
        'icon': Icons.remove_red_eye_sharp,
        'controller': _ctrlPsw
      }
    };

    String errorMsg = (_isUserEmpty && type == 'userName')
        ? txtData[type]['error']
        : (_isPswEmpty && type == 'password')
            ? txtData[type]['error']
            : '';

    return TextField(
      controller: txtData[type]['controller'],
      obscureText: type == 'password' ? true : false,
      decoration: InputDecoration(
        labelText: txtData[type]['label'],
        errorText: errorMsg.isNotEmpty ? errorMsg : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(
          txtData[type]['icon'],
          color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
        ),
      ),
    );
  }
}

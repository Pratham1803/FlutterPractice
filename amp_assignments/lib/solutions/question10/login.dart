import 'package:amp_assignments/utils/custom_app_bar.dart'; // import custom app bar
import 'package:flutter/material.dart'; // import material package

// Question10 widget to display login screen
class Question10 extends StatefulWidget {
  const Question10({super.key}); // constructor for Question10 widget

  @override
  State<Question10> createState() =>
      _Question10State(); // create state for Question10 widget
}

// Question10 state class to manage login screen
class _Question10State extends State<Question10> {
  // Controllers for input fields for user name and password
  final _ctrlUserName = TextEditingController(); // controller for user name
  final _ctrlPsw = TextEditingController(); // controller for password

  bool _isUserEmpty = false; // variable to check if user name is empty
  bool _isPswEmpty = false; // variable to check if password is empty

// build method to create widget
  @override
  Widget build(BuildContext context) {
    // return Scaffold widget with app bar and body
    return Scaffold(
      appBar: const CustomAppBar(title: 'Login'), // custom app bar with title
      body: Container(
        // container widget
        decoration: BoxDecoration(
          // box decoration for container
          gradient: LinearGradient(
            // linear gradient for container
            colors: [Colors.blue.shade300, Colors.blue.shade900], // colors list
            begin: Alignment.topCenter, // gradient begin alignment
            end: Alignment.bottomCenter, // gradient end alignment
          ),
        ),
        child: Center(
          // center widget to align content
          child: Padding(
            // padding around content
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0), // padding on horizontal sides
            child: Card(
              // card widget for login screen
              shape: RoundedRectangleBorder(
                // card shape
                borderRadius:
                    BorderRadius.circular(15), // border radius of card
              ),
              elevation: 8, // card elevation
              child: Padding(
                // padding around content
                padding: const EdgeInsets.all(20.0), // padding on all sides
                child: Column(
                  // column widget to display content vertically
                  mainAxisSize:
                      MainAxisSize.min, // set main axis size to minimum
                  children: [
                    // children list
                    // welcome text for user
                    Text(
                      'Welcome User',
                      style: TextStyle(
                        // text style
                        fontSize: 24, // text size
                        fontWeight: FontWeight.bold, // text weight
                        color: Colors.blue.shade900, // text color
                      ),
                    ),
                    const SizedBox(height: 20), // sized box with height 20
                    _buildTextField(
                        'userName'), // method to build text field for user name
                    const SizedBox(height: 20), // sized box with height 20
                    _buildTextField(
                        'password'), // method to build text field for password
                    const SizedBox(height: 20), // sized box with height 20
                    ElevatedButton(
                      // elevated button widget for login
                      style: ElevatedButton.styleFrom(
                        // button style with background color, padding and shape
                        backgroundColor:
                            Colors.blue.shade900, // button background color
                        padding: const EdgeInsets.symmetric(
                            // button padding
                            horizontal: 50,
                            vertical: 15),
                        shape: RoundedRectangleBorder(
                          // button shape
                          borderRadius: BorderRadius.circular(
                              10), // border radius of button
                        ),
                      ),
                      onPressed: _btnLoginClicked, // on button press
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white), // button text style
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

// method to handle login button click
  void _btnLoginClicked() {
    // set state to update widget with new data
    setState(() {
      // check if input is valid
      if (_isValidInput()) {
        // if input is invalid
        return; // return if input is invalid
      }

      // check if user name and password are correct
      if (_ctrlUserName.text == 'admin' && _ctrlPsw.text == 'admin') {
        // if user name and password are correct
        Navigator.pop(context); // navigate to previous screen
        Navigator.pushNamed(
            context, '/q10/welcome'); // navigate to welcome screen
      } else {
        // if user name and password are incorrect
        ScaffoldMessenger.of(context).showSnackBar(
          // show snackbar with error message
          SnackBar(
            // snackbar widget
            content: const Text('Invalid Credentials'), // snackbar content
            action: SnackBarAction(
              // snackbar action
              label: 'Ok', // action label
              onPressed: () {
                // on action press
                Navigator.pushNamed(context,
                    '/q10/errorMsg'); // navigate to error message screen
              },
            ),
          ),
        );
      }
      _reset(); // reset input fields
    });
  }

  // method to check if input is valid
  bool _isValidInput() {
    // check if user name and password are empty
    var flag = false; // flag to check if input is valid
    if (_ctrlUserName.text.isEmpty) {
      // check if user name is empty
      flag = _isUserEmpty = true; // set flag to true
    } else {
      // if user name is not empty
      _isUserEmpty = false; // set user name empty flag to false
    }

    // check if password is empty
    if (_ctrlPsw.text.isEmpty) {
      // check if password is empty
      flag = _isPswEmpty = true; // set flag to true if password is empty
    } else {
      // if password is not empty
      _isPswEmpty = false; // set password empty flag to false
    }
    return flag; // return flag
  }

// method to reset input fields
  void _reset() {
    _ctrlUserName.clear(); // clear user name field
    _ctrlPsw.clear(); // clear password field
  }

// method to build text field
  TextField _buildTextField(String type) {
    // method to build text field for user name and password
    Map txtData = {
      // map to store text field data
      'userName': {
        // user name data
        'label': 'User Name', // label for user name
        'hint': 'Enter User Name Here', // hint for user name
        'error': 'User Name is Empty!!', // error message for user name
        'icon': Icons.person_2, // icon for user name
        'controller': _ctrlUserName // controller for user name
      },
      'password': {
        // password data
        'label': 'Password', // label for password
        'hint': 'Enter Password Here', // hint for password
        'error': 'Password is Empty!!', // error message for password
        'icon': Icons.remove_red_eye_sharp, // icon for password
        'controller': _ctrlPsw // controller for password
      }
    };

    // check if user name or password is empty and set error message
    String errorMsg =
        (_isUserEmpty && type == 'userName') // check if user name is empty
            ? txtData[type]['error'] // set error message for user name
            : (_isPswEmpty && type == 'password') // check if password is empty
                ? txtData[type]['error'] // set error message for password
                : ''; // set empty string if no error

    // return text field widget
    return TextField(
      // text field widget
      controller: txtData[type]['controller'], // controller for text field
      obscureText: type == 'password'
          ? true
          : false, // hide password text if password field
      decoration: InputDecoration(
        // input decoration for text field
        labelText: txtData[type]['label'], // label for text field
        errorText: errorMsg.isNotEmpty
            ? errorMsg
            : null, // error message for text field if any error
        border: OutlineInputBorder(
          // border for text field
          borderRadius:
              BorderRadius.circular(10), // border radius of text field
        ),
        prefixIcon: Icon(
          // prefix icon for text field
          txtData[type]['icon'], // icon for text field
          color:
              Theme.of(context).colorScheme.onPrimaryFixedVariant, // icon color
        ),
      ),
    );
  }
}

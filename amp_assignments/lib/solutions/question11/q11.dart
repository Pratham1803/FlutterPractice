import 'package:amp_assignments/utils/custom_app_bar.dart'; // import custom app bar
import 'package:flutter/material.dart'; // import material package

// Question11 widget to display food items with checkboxes
// stateful widget to manage food items and total amount
class Question11 extends StatefulWidget {
  const Question11({super.key}); // constructor for Question11 widget

// create state for Question11 widget
  @override
  State<Question11> createState() => _Question11State();
}

// Question11 state class to manage food items and total amount
class _Question11State extends State<Question11> {
  bool _allCheck = false; // variable to check all items
  String _itemsCheck = ''; // variable to store selected items
  String? _selectAll = ''; // variable to store select all or none

// map of food items with name as key and FoodItem object as value
  Map<String, FoodItem> lsFood = {
    'pizza': FoodItem(
        'Pizza', 250, false), // pizza food item with price and check status
    'frenchFries': FoodItem('French Fries', 80,
        false), // french fries food item with price and check status
    'coldDrink': FoodItem('Cold Drink', 50,
        false) // cold drink food item with price and check status
  };
  double _totalAmount = 0; // variable to store total amount

// method to check all items in the list
  void _allItemChecked() {
    // set state to update UI
    setState(() {
      // check if all items are checked
      for (var key in lsFood.keys) {
        // loop through food items
        lsFood[key]!
            .setCheck(_allCheck); // set food item as checked or unchecked
      }
      _calculateTotal(); // calculate total amount of selected items
    });
  }

// method to check single item in the list
  void _singleItemChecked() {
    // set state to update UI
    setState(() {
      _allCheck = lsFood.values
          .every((item) => item.isChecked); // check if all items are checked
      _selectAll =
          _allCheck ? "Select All" : "Select None"; // set select all or none
      _calculateTotal(); // calculate total amount of selected items
    });
  }

// method to calculate total amount of selected items
  void _calculateTotal() {
    _totalAmount = 0; // set total amount to 0
    _itemsCheck = ''; // set selected items to empty

    // loop through food items to calculate total amount and selected items
    for (var entry in lsFood.entries) {
      if (entry.value.isChecked) {
        // check if food item is checked
        _totalAmount += entry.value.getPrice; // add price to total amount
        _itemsCheck +=
            '${entry.value.getName}, '; // add food item to selected items
      }
    }
  }

// build method to create widget
  @override
  Widget build(BuildContext context) {
    // return scaffold widget with app bar and body
    return Scaffold(
      // return scaffold widget with app bar and body
      appBar:
          const CustomAppBar(title: 'Order Food'), // custom app bar with title
      body: Padding(
        // padding around content
        padding: const EdgeInsets.all(14.0), // padding on all sides
        child: Center(
          // center widget to align content
          child: Column(
            // column widget to display content vertically
            mainAxisAlignment:
                MainAxisAlignment.center, // align content in center
            mainAxisSize: MainAxisSize.min, // set main axis size to minimum
            children: [
              // children widgets in column
              // Removed Expanded from Row
              Card(
                // card widget to display content with border
                shape: const RoundedRectangleBorder(
                  // card shape with border radius
                  borderRadius: BorderRadius.all(
                    // border radius of card
                    Radius.circular(5), // radius of border
                  ),
                  side: BorderSide(), // border side of card
                ),
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer, // card color
                child: Row(
                  // row widget to display content horizontally
                  mainAxisAlignment:
                      MainAxisAlignment.center, // align content in center
                  mainAxisSize:
                      MainAxisSize.min, // set main axis size to minimum
                  children: [
                    // children widgets in row
                    Expanded(
                      // expanded widget to take all available space
                      child: RadioListTile(
                        // radio list tile widget
                        value: 'Select All', // value for radio list tile
                        title: const Text(
                            'Select All'), // title for radio list tile
                        groupValue:
                            _selectAll, // group value for radio list tile
                        onChanged: (value) {
                          // on radio list tile change
                          // set state to update UI
                          setState(
                            () {
                              _allCheck = true; // set all items as checked
                              _allItemChecked(); // check all items
                              _selectAll = value; // set select all or none
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      // expanded widget to take all available space
                      child: RadioListTile(
                        // radio list tile widget
                        value: 'Select None', // value for radio list tile
                        title: const Text(
                            'Select None'), // title for radio list tile
                        groupValue:
                            _selectAll, // group value for radio list tile
                        onChanged: (value) {
                          // on radio list tile change
                          setState(
                            () {
                              _allCheck = false; // set all items as unchecked
                              _allItemChecked(); // check all items
                              _selectAll = value; // set select all or none
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // sized box with height 30

              //  Removed Expanded from ListView.builder
              ListView.builder(
                shrinkWrap:
                    true, // shrink wrap the list view for better performance
                itemCount: lsFood.keys.length, // number of items in the list
                itemBuilder: (context, index) {
                  // method to build list items
                  // get key from list of keys
                  var key =
                      lsFood.keys.toList()[index]; // get key from list of keys
                  var foodItem = lsFood[key]; // get food item from list
                  // return column widget with checkbox list tile
                  return Column(
                    // column widget to display content vertically
                    // children widgets in column
                    children: [
                      CheckboxListTile(
                        // checkbox list tile widget
                        value: foodItem!
                            .isChecked, // value of checkbox is checked or not
                        title: Text(
                            foodItem.getName), // title of checkbox list tile
                        subtitle: Text(
                            'Amount: Rs. ${foodItem.getPrice}/-'), // subtitle of checkbox list tile
                        onChanged: (bool? value) {
                          // method to change value of checkbox
                          foodItem.setCheck(
                              value!); // set food item as checked or unchecked
                          _singleItemChecked(); // call method to check single item
                        },
                      ),
                      const Divider(), // divider between list items
                    ],
                  );
                },
              ),
              const SizedBox(height: 50), // sized box with height 50
              Text(
                // text widget to display total amount and selected items
                'Total Amount: Rs. $_totalAmount', // total amount of selected items
                style: Theme.of(context) // text style of text widget
                    .textTheme // text theme of the app
                    .titleLarge // large title text style
                    ?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface), // copy with color
              ),
              const SizedBox(height: 15), // sized box with height 15

              // text to display selected items
              Text(
                'Selected Items: ${_itemsCheck.isEmpty ? 'None' : _itemsCheck}', // selected items from the list
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium, // body medium text style
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// FoodItem class to store food item details
class FoodItem {
  final String _name; // name of food item
  final double _price; // price of food item
  bool _check; // check if food item is selected

// constructor for FoodItem class
  FoodItem(this._name, this._price, this._check);

// getter methods for food item properties
  String get getName => _name; // get name of food item
  double get getPrice => _price; // get price of food item
  bool get isChecked => _check; // get check status of food item

// setter method to set check status of food item
  void setCheck(bool check) {
    _check = check; // set check status of food item
  }
}

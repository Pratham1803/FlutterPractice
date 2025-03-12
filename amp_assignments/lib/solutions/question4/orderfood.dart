import 'package:amp_assignments/utils/custom_app_bar.dart'; // import custom app bar
import 'package:flutter/material.dart'; // import material package

// OrderFood stateful widget to manage food items and total amount
class OrderFood extends StatefulWidget {
  const OrderFood({super.key}); // constructor

  // create state for OrderFood widget
  @override
  State<OrderFood> createState() => _OrderFoodState();
}

// OrderFood state class to manage food items and total amount
class _OrderFoodState extends State<OrderFood> {
  bool _allCheck = false; // variable to check all items
  String _itemsCheck = ''; // variable to store selected items

  // map of food items with name as key and FoodItem object as value
  Map<String, FoodItem> lsFood = {
    'pizza': FoodItem('Pizza', 250, false),
    'frenchFries': FoodItem('French Fries', 80, false),
    'coldDrink': FoodItem('Cold Drink', 50, false)
  };
  double _totalAmount = 0; // variable to store total amount

  // method to check all items in the list
  void _allItemChecked() {
    // set state to update UI
    setState(() {
      if (_allCheck) {
        // if all items are checked
        // set all items as checked
        lsFood['pizza']!.setCheck(true); // set pizza as checked
        lsFood['coldDrink']!.setCheck(true); // set cold drink as checked
        lsFood['frenchFries']!.setCheck(true); // set french fries as checked
      } else {
        // if all items are unchecked
        // set all items as unchecked
        lsFood['pizza']!.setCheck(false); // set pizza as unchecked
        lsFood['coldDrink']!.setCheck(false); // set cold drink as unchecked
        lsFood['frenchFries']!.setCheck(false); // set french fries as unchecked
      }
      _calculateTotal(); // calculate total amount of selected items
    });
  }

  //  method to check single item in the list
  void _singleItemChecked() {
    // set state to update UI
    setState(() {
      //  check if all items are checked
      if (lsFood['pizza']!.isChecked &&
          lsFood['coldDrink']!.isChecked &&
          lsFood['frenchFries']!.isChecked) {
        // if all items are checked
        _allCheck = true; // set all items as checked
      } else {
        // if all items are unchecked
        _allCheck = false; // set all items as unchecked
      }
      _calculateTotal(); // calculate total amount of selected items
    });
  }

  // method to calculate total amount of selected items
  void _calculateTotal() {
    _totalAmount = 0; // set total amount as 0
    _itemsCheck = ''; // set selected items as empty
    if (lsFood['pizza']!.isChecked) {
      // check if pizza is checked
      _totalAmount +=
          lsFood['pizza']!.getPrice; // add pizza price to total amount
      _itemsCheck += 'Pizza, '; // add pizza to selected items
    }
    if (lsFood['coldDrink']!.isChecked) {
      // check if cold drink is checked
      _totalAmount +=
          lsFood['coldDrink']!.getPrice; // add cold drink price to total amount
      _itemsCheck += 'Cold Drink, '; // add cold drink to selected items
    }
    if (lsFood['frenchFries']!.isChecked) {
      // check if french fries is checked
      _totalAmount += lsFood['frenchFries']!
          .getPrice; // add french fries price to total amount
      _itemsCheck += 'French Fries, '; // add french fries to selected items
    }
  }

  // build method to create UI
  @override
  Widget build(BuildContext context) {
    // return scaffold widget with app bar and body
    return Scaffold(
      appBar:
          const CustomAppBar(title: 'Order Food'), // custom app bar with title
      body: Center(
        // center aligns the content
        child: Padding(
          // padding around the content 
          padding: const EdgeInsets.all(30),
          child: Column( // column to display content vertically
            mainAxisAlignment: MainAxisAlignment.center, // align content in center
            // children widgets in column
            children: [ 
              // checkbox list tile for all items
              CheckboxListTile(  
                value: _allCheck, // value of checkbox is allCheck
                title: const Text('All Items'), // title of checkbox list tile
                shape: const OutlineInputBorder(), // border shape of checkbox
                onChanged: (bool? value) { // method to change value of checkbox 
                  _allCheck = value!; // set allCheck as value
                  _allItemChecked(); // call method to check all items
                },
              ),
              const SizedBox( // space between widgets
                height: 20,
              ),
              ListView.builder( // list view to display food items 
                shrinkWrap: true, // shrink wrap the list view for better performance
                itemCount: lsFood.keys.length, // number of items in the list
                itemBuilder: (context, index) { // method to build list items
                  // get key from list of keys
                  var key = lsFood.keys.toList()[index]; // get key from list of keys
                  var foodItem = lsFood[key]; // get food item from list
                  return Column( // column to display content vertically
                  // children widgets in column 
                    children: [
                      // checkbox list tile for food items
                      CheckboxListTile(
                        value: foodItem!.isChecked, // value of checkbox is checked or not
                        title: Text(foodItem.getName), // title of checkbox list tile
                        subtitle: Text('Amount: Rs. ${foodItem.getPrice}/-'), // subtitle of checkbox list tile
                        onChanged: (bool? value) {
                          // method to change value of checkbox
                          foodItem.setCheck(value!); // set food item as checked or unchecked
                          _singleItemChecked(); // call method to check single item
                        },
                      ),
                      const Divider(), // divider between list items
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              // text to display total amount
              Text(
                'Total Amount: Rs. $_totalAmount', // total amount of selected items
                // style of text widget
                style: Theme.of(context)
                    .textTheme // text theme of the app
                    .titleLarge // large title text style
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface), // copy with color
              ),
              const SizedBox(
                height: 15, // space between widgets
              ),
              // text to display selected items
              Text(
                'Selected Items: ${_itemsCheck.isEmpty ? 'None' : _itemsCheck}'  , // selected items from the list 
                style: Theme.of(context).textTheme.bodyMedium, // body medium text style
              )
            ],
          ),
        ),
      ),
    );
  }
}

// FoodItem class to manage food items
class FoodItem {
  final String _name; // name of food item
  final double _price; // price of food item
  bool _check; // check if food item is selected

  // constructor to initialize food item
  FoodItem(this._name, this._price, this._check);

  // getter methods to get values of food item
  String get getName => _name; // get name of food item
  double get getPrice => _price; // get price of food item
  bool get isChecked => _check; // get if food item is checked

  // setter method to set value of food item
  void setCheck(bool check) { // set food item as checked or unchecked
    _check = check; // set check as check
  }
}

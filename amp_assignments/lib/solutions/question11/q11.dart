import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Question11 extends StatefulWidget {
  const Question11({super.key});

  @override
  State<Question11> createState() => _Question11State();
}

class _Question11State extends State<Question11> {
  bool _allCheck = false;
  String _itemsCheck = '';
  String? _selectAll = '';

  Map<String, FoodItem> lsFood = {
    'pizza': FoodItem('Pizza', 250, false),
    'frenchFries': FoodItem('French Fries', 80, false),
    'coldDrink': FoodItem('Cold Drink', 50, false)
  };
  double _totalAmount = 0;

  void _allItemChecked() {
    setState(() {
      for (var key in lsFood.keys) {
        lsFood[key]!.setCheck(_allCheck);
      }
      _calculateTotal();
    });
  }

  void _singleItemChecked() {
    setState(() {
      _allCheck = lsFood.values.every((item) => item.isChecked);
      _selectAll = _allCheck ? "Select All" : "Select None";
      _calculateTotal();
    });
  }

  void _calculateTotal() {
    _totalAmount = 0;
    _itemsCheck = '';
    for (var entry in lsFood.entries) {
      if (entry.value.isChecked) {
        _totalAmount += entry.value.getPrice;
        _itemsCheck += '${entry.value.getName}, ';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order Food'),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Removed Expanded from Row
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  side: BorderSide(),
                ),
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: 'Select All',
                        title: const Text('Select All'),
                        groupValue: _selectAll,
                        onChanged: (value) {
                          setState(
                            () {
                              _allCheck = true;
                              _allItemChecked();
                              _selectAll = value;
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        value: 'Select None',
                        title: const Text('Select None'),
                        groupValue: _selectAll,
                        onChanged: (value) {
                          setState(
                            () {
                              _allCheck = false;
                              _allItemChecked();
                              _selectAll = value;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              ListView.builder(
                shrinkWrap: true,
                itemCount: lsFood.keys.length,
                itemBuilder: (context, index) {
                  var key = lsFood.keys.toList()[index];
                  var foodItem = lsFood[key];
                  return Column(
                    children: [
                      CheckboxListTile(
                        value: foodItem!.isChecked,
                        title: Text(foodItem.getName),
                        subtitle: Text('Amount: Rs. ${foodItem.getPrice}/-'),
                        onChanged: (bool? value) {
                          foodItem.setCheck(value!);
                          _singleItemChecked();
                        },
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
              const SizedBox(height: 50),
              Text(
                'Total Amount: Rs. $_totalAmount',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(height: 15),

              Text(
                'Selected Items: ${_itemsCheck.isEmpty ? 'None' : _itemsCheck}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodItem {
  final String _name;
  final double _price;
  bool _check;

  FoodItem(this._name, this._price, this._check);

  String get getName => _name;
  double get getPrice => _price;
  bool get isChecked => _check;

  void setCheck(bool check) {
    _check = check;
  }
}

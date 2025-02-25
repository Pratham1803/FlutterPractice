import 'package:flutter/material.dart';

class OrderFood extends StatefulWidget {
  const OrderFood({super.key});

  @override
  State<OrderFood> createState() => _OrderFoodState();
}

class _OrderFoodState extends State<OrderFood> {
  bool _allCheck = false;
  String _itemsCheck = '';

  Map<String, FoodItem> lsFood = {
    'pizza': FoodItem('Pizza', 250, false),
    'frenchFries': FoodItem('French Fries', 80, false),
    'coldDrink': FoodItem('Cold Drink', 50, false)
  };
  double _totalAmount = 0;

  void _allItemChecked() {
    setState(() {
      if (_allCheck) {
        lsFood['pizza']!.setCheck(true);
        lsFood['coldDrink']!.setCheck(true);
        lsFood['frenchFries']!.setCheck(true);
      } else {
        lsFood['pizza']!.setCheck(false);
        lsFood['coldDrink']!.setCheck(false);
        lsFood['frenchFries']!.setCheck(false);
      }
      _calculateTotal();
    });
  }

  void _singleItemChecked() {
    setState(() {
      if (lsFood['pizza']!.isChecked &&
          lsFood['coldDrink']!.isChecked &&
          lsFood['frenchFries']!.isChecked) {
        _allCheck = true;
      } else {
        _allCheck = false;
      }
      _calculateTotal();
    });
  }

  void _calculateTotal() {
    _totalAmount = 0;
    _itemsCheck = '';
    if (lsFood['pizza']!.isChecked) {
      _totalAmount += lsFood['pizza']!.getPrice;
      _itemsCheck += 'Pizza, ';
    }
    if (lsFood['coldDrink']!.isChecked) {
      _totalAmount += lsFood['coldDrink']!.getPrice;
      _itemsCheck += 'Cold Drink, ';
    }
    if (lsFood['frenchFries']!.isChecked) {
      _totalAmount += lsFood['frenchFries']!.getPrice;
      _itemsCheck += 'French Fries, ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Food',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        elevation: 10,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.lightBlueAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CheckboxListTile(
                value: _allCheck,
                title: const Text('All Items'),
                shape: const OutlineInputBorder(),
                onChanged: (bool? value) {
                  _allCheck = value!;
                  _allItemChecked();
                },
              ),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 50,
              ),
              Text(
                'Total Amount: Rs. $_totalAmount',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Selected Items: ${_itemsCheck.isEmpty ? 'None' : _itemsCheck}',
                style: Theme.of(context).textTheme.bodyMedium,
              )
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

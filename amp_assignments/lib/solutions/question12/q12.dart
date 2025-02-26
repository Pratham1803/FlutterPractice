import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Question12 extends StatefulWidget {
  const Question12({super.key});

  @override
  State<Question12> createState() => _Question12State();
}

class _Question12State extends State<Question12> {
  var _hallChecked = false;
  var _kitchenChecked = false;
  var _bedRoomChecked = false;
  var _lobbyChecked = false;

  final _colorOn = Colors.yellow;
  final _colorOff = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Question12 | Bulbs'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black,
                elevation: 10,
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('Hall'),
                      value: _hallChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _hallChecked = value!;
                        });
                      },
                    ),
                    const Divider(),
                    CheckboxListTile(
                      title: const Text('Kitchen'),
                      value: _kitchenChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _kitchenChecked = value!;
                        });
                      },
                    ),
                    const Divider(),
                    CheckboxListTile(
                      title: const Text('Bed Room'),
                      value: _bedRoomChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _bedRoomChecked = value!;
                        });
                      },
                    ),
                    const Divider(),
                    CheckboxListTile(
                      title: const Text('Lobby'),
                      value: _lobbyChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _lobbyChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Card(
                shape: const BeveledRectangleBorder(),
                elevation: 10,
                color: Theme.of(context).colorScheme.secondaryFixed,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconLayout("Hall", _hallChecked),
                      _buildIconLayout("Kitchen", _kitchenChecked),
                      _buildIconLayout("Bed Room", _bedRoomChecked),
                      _buildIconLayout("Lobby", _lobbyChecked),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconLayout(icon, check) {
    return Column(
      children: [
        Text(
          icon,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Icon(
          Icons.lightbulb,
          shadows: check
              ? const [Shadow(color:Colors.orange , offset: Offset.zero, blurRadius: 20)]
              : null,
          color: check ? _colorOn : Colors.grey,
          size: 80,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DropdownPopup extends StatelessWidget {
  const DropdownPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Popup()],
        title: const Text("Dropdown and Popup"),
      ),
      body: const Center(child: Column(children: [DropDown(), Popup()])),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  var _city = null;
  var _citys = ["Ankara", "İzmir", "Bursa", "İstanbul", "Diyarbakır"];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("City"),
      value: _city,
      // items: [
      //   DropdownMenuItem(child: Text('Ankara'), value: 'Ankara'),
      //   DropdownMenuItem(child: Text('İzmir'), value: 'İzmir'),
      //   DropdownMenuItem(child: Text('İstanbul'), value: 'İstanbul'),
      // ],
      items:
          _citys
              .map(
                (String city) =>
                    DropdownMenuItem(child: Text(city), value: city),
              )
              .toList(),
      onChanged: (value) {
        setState(() {
          _city = value!;
        });
      },
    );
  }
}

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  var _citys = ["Ankara", "İzmir", "Bursa", "İstanbul", "Diyarbakır"];
  var _usageCity = "İzmir";
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: _usageCity,
      icon: Icon(Icons.add),
      itemBuilder: (context) {
        return _citys.map((String city) {
          return PopupMenuItem(child: Text(city), value: city);
        }).toList();
      },
      onSelected: (value) {
        setState(() {
          _usageCity = value;
        });
      },
    );
  }
}

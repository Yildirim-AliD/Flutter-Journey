import 'package:flutter/material.dart';

class CheckboxSliderRadioSwitch extends StatefulWidget {
  const CheckboxSliderRadioSwitch({super.key});

  @override
  State<CheckboxSliderRadioSwitch> createState() => _OtherInpuState();
}

class _OtherInpuState extends State<CheckboxSliderRadioSwitch> {
  bool _isChecked = false;
  bool _isCheckedForRadio = true;
  String _selectedcity = "Ankara";
  double _slider = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Slider(
            value: _slider,
            min: 0,
            max: 100,
            label: _slider.round().toString(),
            divisions: 100,
            onChanged: (value) {
              setState(() {
                _slider = value;
              });
            },
          ),
          Text("Slider $_slider"),
          Row(
            children: [
              Radio<String>(
                value: "Ankara",
                groupValue: _selectedcity,
                onChanged: (value) {
                  setState(() {
                    _selectedcity = value!;
                  });
                },
              ),
              Text('Ankara'),
              Radio<String>(
                value: "İzmir",
                groupValue: _selectedcity,
                onChanged: (value) {
                  setState(() {
                    _selectedcity = value!;
                  });
                },
              ),
              Text('İzmir'),
              Expanded(
                child: RadioListTile<String>(
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                  value: "Bursa",
                  groupValue: _selectedcity,
                  onChanged: (value) {
                    setState(() {
                      _selectedcity = value!;
                    });
                  },
                ),
              ),
              Text('Bursa'),
            ],
          ),
          SwitchListTile(
            title: Text('Title Value'),
            subtitle: Text('Subtitle Value'),
            value: _isCheckedForRadio,
            onChanged: (value) {
              setState(() {
                _isCheckedForRadio = value;
              });
            },
          ),
          Row(
            children: [
              Switch(
                value: _isCheckedForRadio,
                onChanged: (value) {
                  setState(() {
                    _isCheckedForRadio = value;
                  });
                },
              ),
              Text('Bildirimleri Aç'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
              Text('Deal'),
            ],
          ),
          CheckboxListTile(
            secondary: Icon(Icons.add),
            title: Text('Title Value'),
            subtitle: Text('Subtitle Value'),
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeKullanimiWidget extends StatefulWidget {
  const DateTimeKullanimiWidget({super.key});

  @override
  State<DateTimeKullanimiWidget> createState() =>
      _DateTimeKullanimiWidgetState();
}

class _DateTimeKullanimiWidgetState extends State<DateTimeKullanimiWidget> {
  DateTime _secilenTarih = DateTime.now();
  TimeOfDay _secilenSaat = TimeOfDay.now();

  _tarihSec() async {
    var _secilen = await showDatePicker(
      context: context,
      initialDate: _secilenTarih,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (_secilen != null) {
      setState(() {
        _secilenTarih = _secilen;
      });
    }
  }

  _saatSec() async {
    var _saat = await showTimePicker(
      context: context,
      initialTime: _secilenSaat,
    );

    if (_saat != null) {
      setState(() {
        _secilenSaat = _saat;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _formatlanmisTarih = DateFormat(
      'dd-MM-yyyy EEEE',
      'tr',
    ).format(_secilenTarih);

    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: _tarihSec, child: const Text('Tarih Seç')),
          Text(
            _formatlanmisTarih,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          ElevatedButton(onPressed: _saatSec, child: Text('Saat  Seç')),
          Text(
            _secilenSaat.format(context),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}

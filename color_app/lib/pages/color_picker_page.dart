import 'dart:math';
import 'package:color_app/constants/colors.dart';
import 'package:color_app/widgets/color_dislay.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.blue;
  bool isCircular = false;
  bool isShowColorName = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Picker"),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                isShowColorName = !isShowColorName;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'a',
                  child: Row(
                    children: [
                      Icon(
                        isShowColorName
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isShowColorName ? 'Hide Color Name' : 'Show Color Name',
                      ),
                    ],
                  ),
                ),
              ];
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ColorDisplay(
                selectedColor: selectedColor,
                isCircular: isCircular,
              ),
              SizedBox(height: 10),
              isShowColorName ? Text(colors[selectedColor]!) : SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<Color>(
                      value: selectedColor,
                      items:
                          colors.entries.map((entry) {
                            return DropdownMenuItem(
                              value: entry.key,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    color: entry.key,
                                  ),
                                  SizedBox(width: 5),
                                  Text(entry.value),
                                ],
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedColor = value!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: _randomColor,
                      child: const Text("Random Color"),
                    ),
                    IconButton(
                      onPressed: _showColorCode,
                      icon: const Icon(Icons.info),
                    ),
                    IconButton(
                      onPressed: _changeShape,
                      icon: Icon(
                        isCircular
                            ? Icons.square_outlined
                            : Icons.circle_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _randomColor() {
    final colors2 = colors.keys.toList();
    final randomNumber = Random().nextInt(colors2.length);
    final randomColor = colors2[randomNumber];
    setState(() {
      selectedColor = randomColor;
    });
  }

  void _showColorCode() {
    Fluttertoast.showToast(
      msg:
          // ignore: deprecated_member_use
          "RGB : (${selectedColor.red},${selectedColor.green},${selectedColor.blue})",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: selectedColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _changeShape() {
    setState(() {
      isCircular = !isCircular;
    });
  }
}

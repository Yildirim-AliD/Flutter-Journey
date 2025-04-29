import 'package:flutter/material.dart';

class TextFieldUsage extends StatefulWidget {
  const TextFieldUsage({super.key});

  @override
  State<TextFieldUsage> createState() => _TextFieldUsageState();
}

class _TextFieldUsageState extends State<TextFieldUsage> {
  //String value_text = "";
  int _maxLine = 1;
  late TextEditingController _emailController;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    //Initial setup to be executed when the widget is first loaded is done here
    super.initState();
    _emailFocusNode = FocusNode();
    _emailFocusNode.addListener(() {
      setState(() {
        _maxLine = _emailFocusNode.hasFocus ? 3 : 1;
      });
    });
    _emailController = TextEditingController(text: "First value");
    _emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _emailController.clear();
            },
            child: Icon(Icons.refresh),
          ),
          TextField(
            focusNode: _emailFocusNode,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.search,
            maxLength: 50,
            maxLines: _maxLine,
            cursorColor: Colors.red,
            readOnly: false,
            onChanged: (value) {
              // setState(() {
              //   value_text = value;
              // });
            },
            onSubmitted: (value) {
              debugPrint("Submit:${_emailController.text}");
            },
            decoration: InputDecoration(
              //icon: Icon(Icons.add),
              prefixIcon: const Icon(Icons.remove_road),
              suffixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade300,
              hintText: "Enter a Email",
              labelText: "Email",
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 8),
          Text(_emailController.text, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

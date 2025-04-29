import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _userName = '', _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.length < 6) {
                  return 'Username must be at least 6 characters long!';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {
                _userName = newValue!;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Enter a Username',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              onSaved: (newValue) {
                _email = newValue!;
              },
              keyboardType: TextInputType.emailAddress,
              // autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (value) {
                if (!EmailValidator.validate(value!)) {
                  return 'Please enter a valid email address';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter a Email',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              // autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (value) {
                if (value!.length < 6) {
                  return 'Password must be at least 6 characters long!';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {
                _password = newValue!;
              },
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter a password',
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                  child: const Text('Clear'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    bool result = _formKey.currentState!.validate();
                    if (result) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Username:$_userName Email:$_email '),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('All data must be validated'),
                        ),
                      );
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

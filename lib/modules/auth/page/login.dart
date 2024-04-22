import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/utils/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routerName = '/login';

  void _submit() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      // Validate login credentials or perform authentication here
      // For now, we'll just print the user's details
      print('Login successful! User details: ${_user.toJson()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  onSaved: (value) => _user.username = value ?? '',
                  validator: (value) => value!.isEmpty ? 'Please enter your username' : null,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) => _user.password = value ?? '',
                  validator: (value) => value!.isEmpty ? 'Please enter your password' : null,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

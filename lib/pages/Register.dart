import 'package:flutter/material.dart';

import '../user_data.dart'; // adjust path based on folder structure

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _newUserController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();

  void _register() {
    String username = _newUserController.text.trim();
    String password = _newPassController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    UserData.username = username;
    UserData.password = password;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Registration Successful!")));

    Navigator.pop(context); // Back to LoginPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _newUserController,
              decoration: const InputDecoration(
                hintText: 'Choose a username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _newPassController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Choose a password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _register, child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}

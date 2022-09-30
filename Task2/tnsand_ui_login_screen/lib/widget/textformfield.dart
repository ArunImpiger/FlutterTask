// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _secureText = true;

  final TextEditingController _passwordController = TextEditingController();
  String? _passwordError;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(
                // ignore: unnecessary_const
                decoration: const InputDecoration(
                    hintText: "Your Name",
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    filled: true),
                obscureText: false,
                maxLength: 20,
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: "Detailed Description",
                    labelText: "Description",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: UnderlineInputBorder()),
                obscureText: false,
                maxLines: 3,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    errorText: _passwordError,
                    labelStyle:
                        const TextStyle(fontSize: 24, color: Colors.black),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_secureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    )),
                obscureText: _secureText,
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (String? value) {
                        if (value!.length < 10) {
                          return "Enter at least 10 char";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Name",
                          labelText: "Name",
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.length < 3) {
                          return "Enter at least 3 char";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                          border: OutlineInputBorder()),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    print("Password : ${_passwordController.text}");
                    setState(() {
                      print(
                          "Form Validation : ${_formKey.currentState!.validate()}");
                      if (_passwordController.text.length < 3) {
                        _passwordError = "Enter at least 3 char";
                      } else {
                        _passwordError = null;
                      }
                    });
                  },
                  child: const Text('Tab'))
            ],
          ),
        ),
      ),
    );
  }
}

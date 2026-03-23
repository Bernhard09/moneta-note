import 'package:flutter/material.dart';
import '../../../main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = false;

  void _revealPassword() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.widthOf(context);
    final screenHeight = MediaQuery.heightOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.1,
          ),
          child: Column(
            spacing: 24.0,
            children: [
              Text('Login'),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'youremail@email.com',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                obscureText: _isObscured,
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.symmetric(
                  //   vertical: 8,
                  //   horizontal: 10,
                  // ),
                  labelText: 'Password',
                  hintText: 'password',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffix: IconButton(
                    constraints: BoxConstraints(),
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: _revealPassword,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                MainPage(title: 'Home Page'),
                          ),
                        );
                      },
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

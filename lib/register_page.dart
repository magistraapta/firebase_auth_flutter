import 'package:firebase_test/login_page.dart';
import 'package:firebase_test/service/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        title: Text('Create account'),
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              FilledButton(
                  onPressed: () async {
                    final message = await AuthService().registration(
                        email: _emailController.text,
                        password: _passwordController.text);
                    if (message!.contains('Success')) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    }
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                  },
                  child: Text('Register')),
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:firebase_test/home_page.dart';
import 'package:firebase_test/register_page.dart';
import 'package:firebase_test/service/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Login page"),
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
                    final message = await AuthService().login(
                        email: _emailController.text,
                        password: _passwordController.text);
                    if (message!.contains('Success')) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    }
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                  },
                  child: Text('Login')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text('Register here'))
            ],
          ),
        ),
      )),
    );
  }
}

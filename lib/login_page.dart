import 'package:firebase_test/home_page.dart';
import 'package:firebase_test/navigation_widget.dart';
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

  Widget textHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login Page',
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w700),
        ),
        Text(
          'Login to continue use the app',
          style: TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          width: deviceWidth * 0.9,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textHeader(),
              Spacer(),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Email', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
              ),
              Spacer(),
              Container(
                width: double.infinity,
                child: FilledButton(
                    onPressed: () async {
                      final message = await AuthService().login(
                          email: _emailController.text,
                          password: _passwordController.text);
                      if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const NavigationWidget()));
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message)));
                    },
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )),
              ),
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

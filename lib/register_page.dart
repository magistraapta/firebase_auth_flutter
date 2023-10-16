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

  Widget _textHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign-Up',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        Text(
          'Sign up to continue using the app',
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
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Container(
          width: deviceWidth * 0.9,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textHeader(),
              Spacer(),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'email', border: OutlineInputBorder()),
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
                    child: Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

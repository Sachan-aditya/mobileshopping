import 'package:flutter/material.dart';
import 'package:myshop/homepage.dart';

// ignore: camel_case_types
class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Expanded(
      child: Column(children: [
        Image.asset('assets/images/login.png', fit: BoxFit.cover, height: 200),
        const Text(
          "WELCOME",
          style: TextStyle(
            fontSize: 40,
            letterSpacing: 1,
            fontWeight: FontWeight.w800,
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 32),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Username', labelText: 'USERNAME'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Enter Password', labelText: 'PASSWORD'),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          height: 130,
        ),
        const Text(
          'New User? Create Account',
          style: TextStyle(fontSize: 20),
        )
      ]),
    )));
  }
}

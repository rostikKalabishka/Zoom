import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            const Text(
              'Start or join a meeting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.08),
              child: Image.asset(
                'assets/images/onboarding.jpg',
              ),
            ),
            CustomButton(
              onPressed: () {},
              text: 'Google Sign In',
            )
          ],
        ),
      ),
    );
  }
}

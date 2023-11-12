import 'package:flutter/material.dart';

import '../resources/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          onPressed: _authService.signOut,
          child: const Text('Sign Out'),
        ),
      )),
    );
  }
}

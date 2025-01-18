import 'package:flutter/material.dart';

class AccountScreenView extends StatefulWidget {
  const AccountScreenView({super.key});

  @override
  State<AccountScreenView> createState() => _AccountScreenViewState();
}

class _AccountScreenViewState extends State<AccountScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("hesap"),
      ),
    );
  }
}

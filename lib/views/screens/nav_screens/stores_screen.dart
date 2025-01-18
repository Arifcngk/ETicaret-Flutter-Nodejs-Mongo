import 'package:flutter/material.dart';

class StoresScreenView extends StatefulWidget {
  const StoresScreenView({super.key});

  @override
  State<StoresScreenView> createState() => _StoresScreenViewState();
}

class _StoresScreenViewState extends State<StoresScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("stories"),
      ),
    );
  }
}

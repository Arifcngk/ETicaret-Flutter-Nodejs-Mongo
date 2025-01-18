import 'package:flutter/material.dart';

class CartScreenView extends StatefulWidget {
  const CartScreenView({super.key});

  @override
  State<CartScreenView> createState() => _CartScreenViewState();
}

class _CartScreenViewState extends State<CartScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Sepet"),),
    );
  }
}
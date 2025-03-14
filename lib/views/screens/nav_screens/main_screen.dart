import 'package:eticaret_fullstack/views/screens/nav_screens/widgets/banner_widget.dart';
import 'package:eticaret_fullstack/views/screens/nav_screens/widgets/category_widget.dart';
import 'package:eticaret_fullstack/views/screens/nav_screens/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            BannerWidget(),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}

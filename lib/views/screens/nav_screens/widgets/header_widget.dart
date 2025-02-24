import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.20,
      child: Stack(
        children: [
          Image.asset(
            "assets/icons/searchBanner.jpeg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 48,
            top: 68,
            child: SizedBox(
              width: 250,
              height: 250,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Image.asset(
                    "assets/icons/cam.png",
                    width: 20,
                    height: 20,
                  ),
                  prefixIcon: Image.asset(
                    "assets/icons/searc1.png",
                    width: 20,
                    height: 20,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  focusColor: Colors.black,
                  hintText: "Enter Text",
                  hintStyle: const TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 16,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Your Account',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0d120E),
                  letterSpacing: 0.2,
                ),
              ),
              Text(
                'Welcome Back',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF0d120E),
                  letterSpacing: 0.2,
                ),
              ),
              Image.asset(
                "assets/images/illustration.png",
                width: 200,
                height: 200,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email Adresin",
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: "Email ",
                  labelStyle: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/icons/email.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Parola Alanı",
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: "Parola",
                  labelStyle: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                  ),
                  suffixIcon: const Icon(Icons.visibility, color: Colors.black),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/icons/password.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:eticaret_fullstack/views/screens/aurh_screens/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hesabınıza Giriş Yapın',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0d120E),
                  letterSpacing: 0.2,
                ),
              ),
              Text(
                'Tekrar Hoşgeldiniz',
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
              const SizedBox(height: 20),
              Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF102DE1),
                      Color(0xCC0D6EFF),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 280,
                      top: 20,
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF103DE5),
                              width: 12,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 250,
                      top: 30,
                      child: Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: 10,
                            height: 10,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF103DE5),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          )),
                    ),
                    Positioned(
                      left: 310,
                      top: 35,
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: 5,
                          height: 5,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 281,
                      top: -10,
                      child: Opacity(
                        opacity: 0.3,
                        child: Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text("Giriş Yapın",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Kayıt Yapmadınız Mı?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: Text("Kayıt Ol",
                        style: GoogleFonts.lato(
                          color: const Color(0xFF102DE1),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          fontSize: 14,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
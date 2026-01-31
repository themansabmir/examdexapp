import 'dart:async';
import 'package:examdexapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 1),

            Center(
              child: Container(
                height: size.width * 0.25, // 🔹 responsive
                width: size.width * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                  child: Image.asset(
                    'assets/images/image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.035),

            Text(
              'PrepAI',
              style: TextStyle(
                fontSize: size.width * 0.065,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: size.height * 0.008),

            Text(
              'AI-Powered Prep for peak performance',
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: const Color.fromARGB(153, 170, 192, 211),
              ),
              textAlign: TextAlign.center,
            ),

            const Spacer(flex: 1),

            SizedBox(
              height: size.width * 0.06,
              width: size.width * 0.06,
              child: const CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Colors.green,
              ),
            ),

            Text(
              'ENTERPRISE SECURE',
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 1.5,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'CUET · JEE · NEET',
              style: TextStyle(fontSize: 11, color: Colors.white54),
            ),

            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}

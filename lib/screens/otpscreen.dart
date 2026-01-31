import 'dart:async';

import 'package:examdexapp/procider/provider.dart';
import 'package:examdexapp/screens/homescreen.dart';
import 'package:examdexapp/utils/otpbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _secondsRemaining = 0;
  Timer? _timer;
  void startResendTimer() {
    _timer?.cancel();

    setState(() {
      _secondsRemaining = 60;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otp = context.watch<OtpProvider>();

    //      Future<void> _verifyOtpAndNavigate() async {
    //   final otpProvider = context.read<OtpProvider>();

    //   otpProvider.setVerifying(true);
    //   otpProvider.setError(null);

    //   final success = await OtpApiService.verifyOtp(
    //     phone: '+911234567890', // 🔴 real phone here
    //     otp: otpProvider.otp,
    //   );

    //   otpProvider.setVerifying(false);

    //   if (success) {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (_) => const HomeScreen()),
    //     );
    //   } else {
    //     otpProvider.setError('Invalid OTP. Please try again.');
    //     otpProvider.clear();
    //   }
    // }

    if (otp.isComplete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ), // change screen
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Varify your number',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Stack(
        children: [
          Positioned(
            right: -75,
            top: -115,
            //left: 0,
            //bottom: 31,
            child: Container(
              height: 220,
              width: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(40, 47, 102, 223),
                    const Color.fromARGB(3, 187, 180, 189),
                  ],
                ),
              ),
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  text: 'Enter the code sent to ',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 131, 131, 131),
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: '+91 1234567890',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 12, 12, 12),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Edit ',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 14, 57, 196),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpInput(index: 0),
                    OtpInput(index: 1),
                    OtpInput(index: 2),
                    OtpInput(index: 3),
                    OtpInput(index: 4),
                    OtpInput(index: 5),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time_filled_outlined),
                  const SizedBox(width: 6),
                  Text(
                    _secondsRemaining > 0
                        ? 'Resend in $_secondsRemaining s'
                        : 'You can resend now',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),

              TextButton(
                onPressed:
                    _secondsRemaining == 0
                        ? () {
                          //  API call for resend OTP here
                          startResendTimer();
                        }
                        : null, // disabled when timer running
                child: const Text('Resend'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

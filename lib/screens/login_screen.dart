import 'package:examdexapp/screens/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool pass = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Welcome back!',
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              'Enter your number to continue your \n journey',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text('Phone Number'),
            IntlPhoneField(
              keyboardType: TextInputType.phone,
              focusNode: FocusNode(),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                //labelText: 'Phone Number',
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                if (phone.completeNumber.characters.length == 12) {
                  setState(() {
                    pass = true;
                  });
                }
              },
            ),
            SizedBox(height: 26),
            if (pass == true)
              Center(
                child: TextButton(
                  onPressed:
                      pass
                          ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OtpScreen(),
                              ),
                            );
                          }
                          : null, // null = disabled button
                  style: TextButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.8, 50),
                    backgroundColor: const Color.fromARGB(255, 164, 172, 237),
                    foregroundColor: const Color.fromARGB(187, 252, 252, 255),
                  ),
                  child: const Text("Continue"),
                ),
              ),

            const Spacer(flex: 1),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock,
                    size: screenWidth * 0.035,
                    color: const Color.fromARGB(255, 162, 164, 184),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Your data is safe with us. We only use youe',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 10, 21, 105),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.008),

            Center(
              child: Text(
                'number for secure login',
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: const Color.fromARGB(255, 11, 21, 102),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

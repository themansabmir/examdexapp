import 'package:examdexapp/procider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OtpInput extends StatelessWidget {
  final int index;
  final bool autoFocus;

  const OtpInput({super.key, required this.index, this.autoFocus = false});

  @override
  Widget build(BuildContext context) {
    final otpProvider = context.read<OtpProvider>();
    return SizedBox(
      height: 68,
      width: 54,
      child: TextFormField(
        autofocus: autoFocus,
        style: const TextStyle(fontSize: 20),
        onChanged: (value) {
          if (value.isNotEmpty) {
            otpProvider.setDigit(index, value);
            FocusScope.of(context).nextFocus();
          } else {
            otpProvider.setDigit(index, '');
          }
        },
        decoration: const InputDecoration(
          hintText: '0',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
      ),
    );
  }
}

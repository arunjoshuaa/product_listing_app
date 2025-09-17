import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 90,
  height: 70,
  textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
  
    border: Border.all(color: Color(0xFF5E5BE2)),
    borderRadius: BorderRadius.circular(15),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: Color(0xFFF6F6F6),
     borderRadius: BorderRadius.circular(20), // Keep border radius for rounded corners
    border: Border.all(color: Color(0xFFB0BEC5)), // Light border color
  ),
  
);
class OtpField extends StatefulWidget {
  const OtpField({super.key});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return  Pinput(
defaultPinTheme: defaultPinTheme,
focusedPinTheme: focusedPinTheme,
submittedPinTheme: submittedPinTheme,
validator: (s) {
return s == '2222' ? null : 'Pin is incorrect';
},
pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
showCursor: true,
onCompleted: (pin) => print(pin),
);
  }
}
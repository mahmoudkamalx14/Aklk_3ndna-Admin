import 'package:flutter/material.dart';

class InternetSubTitle extends StatelessWidget {
  const InternetSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'PleaseCheckYourNetWorkConnection',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 18,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Orders'),
      ),
    );
  }
}

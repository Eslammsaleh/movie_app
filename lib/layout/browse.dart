import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Browse')),
      body: const Center(
        child: Text('Browse', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

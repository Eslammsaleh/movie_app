import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/colors_pallet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPallet.black,
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('Home', style: TextStyle(color: ColorsPallet.white)),
      ),
    );
  }
}

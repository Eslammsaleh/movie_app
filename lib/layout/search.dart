import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Search')),
      body: const Center(
        child: Text('Search', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

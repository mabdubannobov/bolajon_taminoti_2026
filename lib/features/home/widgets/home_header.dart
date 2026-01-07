import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Hozircha oddiy matn, keyingi qadamda dizaynni chizamiz
    return Container(
      height: 60,
      color: Colors.grey[200],
      child: const Center(child: Text("Header (Ism va Rasm)")),
    );
  }
}

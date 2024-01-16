import 'package:flutter/material.dart';
import 'package:cubixd/cubixd.dart';

class MyCube extends StatelessWidget {
  const MyCube({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedCubixD(
        onSelected: ((SelectedSide opt) =>
            opt == SelectedSide.bottom ? false : true),
        size: 200.0,
        left: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/avatar.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        front: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/kiranvogelnerlich.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        back: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/jennifernerlich.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        top: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/larsvogel.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        bottom: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/larsvogel.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        right: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/larsvogel.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

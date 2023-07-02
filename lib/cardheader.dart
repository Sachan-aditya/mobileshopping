import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Catlogheader extends StatelessWidget {
  const Catlogheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      "MySHOP APP".text.xl5.bold.make(),
      "Trending Products".text.xl4.make(),
    ]);
  }
}

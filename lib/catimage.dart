import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogueImage extends StatelessWidget {
  final String image;

  const CatalogueImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    )
        .box
        .rounded
        .p32
        .color(context.canvasColor)
        .py16
        .make()
        .py16()
        .wPCT(context: context, widthPCT: context.isMobile ? 40 : 20);
  }
}

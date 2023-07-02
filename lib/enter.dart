// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:myshop/catlogue.dart';

import 'package:velocity_x/velocity_x.dart';

// ignore: camel_case_types
class enter extends StatelessWidget {
  final ITEM catalogue;
  const enter({
    Key? key,
    required this.catalogue,
    // ignore: unnecessary_null_comparison
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData.fallback(),
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.m0,
          children: [
            " \$${catalogue.price}".text.bold.xl4.red800.make(),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Vx.blue700),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  )),
              child: "Buy".text.color(Vx.white).make(),
            ).wh(150, 50),
          ],
        ).p12(),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: Column(children: [
            Hero(
                    tag: Key(catalogue.id.toString()),
                    child: Image.network(catalogue.image))
                .h40(context),
            Expanded(
                child: VxArc(
              height: 10,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalogue.name.text.xl4
                        .color(const Color.fromARGB(177, 0, 0, 0))
                        .bold
                        .make(),
                    catalogue.desc.text.xl
                        .textStyle(context.captionStyle)
                        .make(),
                    30.heightBox,
                    "Developed by Aditya Sachan,coming soon with exciting features!"
                        .text
                        .textStyle(context.captionStyle!)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ])),
    );
  }
}

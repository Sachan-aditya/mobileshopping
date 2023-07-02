import 'package:flutter/material.dart';
import 'package:myshop/catimage.dart';
import 'package:myshop/catlogue.dart';
import 'package:myshop/enter.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogueList extends StatelessWidget {
  const CatalogueList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatalogueModels.item?.length,
            itemBuilder: (context, index) {
              final catalogue = CatalogueModels.item![index];
              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => enter(
                            catalogue: catalogue,
                          ),
                        ),
                      ),
                  child: CatalogueItem(catalogue: catalogue));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogueModels.item?.length,
            itemBuilder: (context, index) {
              final catalogue = CatalogueModels.item![index];
              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => enter(
                            catalogue: catalogue,
                          ),
                        ),
                      ),
                  child: CatalogueItem(catalogue: catalogue));
            },
          );
  }
}

class CatalogueItem extends StatelessWidget {
  final ITEM catalogue;
  const CatalogueItem({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalogue.id.toString()),
        child: CatalogueImage(
          image: catalogue.image,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalogue.name.text.lg.color(context.accentColor).bold.make(),
            catalogue.desc.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalogue.price}".text.bold.xl.make(),
                "Add to Cart".text.bold.make().box.color(Colors.blue).make(),
              ],
            ).pOnly(right: 8.0)
          ],
        ).p(context.isMobile ? 4 : 16),
      )
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    ).color(context.cardColor).rounded.square(150).make().p16();
  }
}

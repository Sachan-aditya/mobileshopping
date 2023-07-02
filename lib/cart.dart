import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/catlogue.dart';
import 'package:myshop/sort.dart';
import 'package:velocity_x/velocity_x.dart';
import 'cartmodel.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // VxConsumer(
          VxBuilder(
            // notifications: {},
            mutations: const {RemoveMutation},
            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
            builder: (context, MyStore, _) {
              // print("Rebuild Happened");
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.accentColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet.".text.make(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.canvasColor),
            ),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show.".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}

class AddToCart extends StatelessWidget {
  final ITEM catalogue;
  const AddToCart({
    Key? key,
    required this.catalogue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: []);
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    final CatalogueModels _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalogue);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalogue);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.accentColor),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

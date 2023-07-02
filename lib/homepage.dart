// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:myshop/cardheader.dart';
import 'package:myshop/cart.dart';
import 'package:myshop/cartmodel.dart';
import 'package:myshop/catlogue.dart';
import 'package:myshop/home.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
// ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "Aditya SACHAN";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    // final catalogueJson =
    //     await rootBundle.loadString("assets/files/catalogue.json");

    final catalogueJson =
        await rootBundle.loadString("assets/files/catlogue.json");
    final decodedData = jsonDecode(catalogueJson);
    var productsData = decodedData["Product"];
    CatalogueModels.item = List.from(productsData)
        .map<ITEM>((item) => ITEM.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
          builder: (context, MyStore, _) => FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            ),
            backgroundColor: context.accentColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: const Color.fromARGB(255, 130, 122, 122),
              size: 20,
              count: _cart.items.length),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Catlogheader(),
                if (CatalogueModels.item != null &&
                    CatalogueModels.item!.isNotEmpty)
                  const CatalogueList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}

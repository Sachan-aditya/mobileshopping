// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:myshop/catlogue.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class itemwidgets extends StatelessWidget {
  final ITEM item;

  const itemwidgets({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          ("${item.name}press");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

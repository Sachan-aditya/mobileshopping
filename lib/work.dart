// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:myshop/catlogue.dart';
import 'package:myshop/sort.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
//catalogue field
  CatalogueModels? _catalogue;

//collection of IDs - store IDs of each item
  final List<int> _itemIds = [];

  // Get Catalogue
  CatalogueModels get catalogue => _catalogue!;

  set catalogue(CatalogueModels newCatalogue) {
    _catalogue = newCatalogue;
  }

  //Get items in the cart
  List<ITEM> get items =>
      _itemIds.map((id) => _catalogue!.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final ITEM item;

  AddMutation(this.item);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'item': item.toMap(),
    };
  }

  factory AddMutation.fromMap(Map<String, dynamic> map) {
    return AddMutation(
      ITEM.fromMap(map['item'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddMutation.fromJson(String source) =>
      AddMutation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class RemoveMutation extends VxMutation<MyStore> {
  final ITEM item;

  RemoveMutation(this.item);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

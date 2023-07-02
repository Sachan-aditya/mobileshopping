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

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final ITEM item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}

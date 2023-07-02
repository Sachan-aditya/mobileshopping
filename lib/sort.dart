import 'package:myshop/cartmodel.dart';
import 'package:myshop/catlogue.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogueModels catalog = CatalogueModels();
  CartModel cart = CartModel();
  MyStore() {
    catalog = CatalogueModels();
    cart = CartModel();
    cart.catalogue = catalog;
  }
}

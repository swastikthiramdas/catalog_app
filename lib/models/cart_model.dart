import 'package:flutter_first_project/models/catalog.dart';

class CartModel{

  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;



  CatalogModel? _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catmodel => _catalog!;

  set catlog(CatalogModel newcatalog){
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  List<Item> get items => _itemIds.map((id) => CatalogModel.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total = total + current.price!);


  void add(Item item){
    _itemIds.add(item.id!);
  }
  
  void remove(Item item){
    _itemIds.remove(item.id);
  }

}
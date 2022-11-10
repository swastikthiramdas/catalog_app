import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart_model.dart';
import '../models/catalog.dart';

class ItemDetailsPage extends StatelessWidget {
  final Item item;

  ItemDetailsPage({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(
                item.id.toString(),
              ),
              child: Image.network(item.image!).p32(),
            ).h32(context),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                height: 30.0,
                child: Container(
                  padding: EdgeInsets.only(top: 60),
                  width: double.maxFinite,
                  color: Colors.white,
                  child: Column(
                    children: [
                      item.name.toString().text.xl4.black.bold.make(),
                      item.desc
                          .toString()
                          .text
                          .xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                          .scrollVertical()
                          .expand()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${item.price!}".text.xl4.color(Colors.red.shade800).make(),
            _AddToCart(item: item)
          ],
        ).p32(),
      ),
    );
  }
}

class _AddToCart extends StatefulWidget {
  final Item item;

  _AddToCart({Key? key, required this.item}) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  final _cart = CartModel();
  final _catalog = CatalogModel();
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    isAdded = _cart.items.contains(widget.item) ? true : false;
    return ElevatedButton(
      onPressed: () {
        if (isAdded == false) {
          setState(() {
            isAdded = !isAdded;
            _cart.catlog = _catalog;
            _cart.add(widget.item);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: "Product Alredy added".text.make(),
            ),
          );
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black87),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: "Buy".text.make(),
    ).wh(120, 50);
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_project/models/cart_model.dart';
import 'package:flutter_first_project/utils/myraouts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import 'item_details_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catlogJson = await rootBundle.loadString("assets/files/catlog.json");
    var decodedData = jsonDecode(catlogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          Navigator.pushNamed(context, MyRaouts.cartraouts);
        },
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainHeader(),
              SizedBox(
                height: 20,
              ),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatlogList().expand()
              else
                Expanded(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Colors.black.withOpacity(0.8)).make(),
        "Trending Product".text.xl2.make()
      ],
    );
  }
}

class CatlogList extends StatelessWidget {
  const CatlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (_, index) {
          final item = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailsPage(
                  item: item,
                ),
              ),
            ),
            child: CatlogItem(
              item: item,
            ),
          );
        });
  }
}

class CatlogItem extends StatelessWidget {
  final Item item;

  CatlogItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(item.id.toString()),
            child: Image.network(item.image!)
                .box
                .p16
                .rounded
                .color(Colors.white12)
                .make()
                .p16()
                .w40(context),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                item.name.toString().text.lg.black.bold.make(),
                item.desc
                    .toString()
                    .text
                    .textStyle(context.captionStyle)
                    .make(),
                10.heightBox,
                ButtonBar(
                  buttonPadding: EdgeInsets.all(0),
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${item.price!}".text.color(Colors.black).make(),
                    _AddToCart(
                      item: item,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ).white.rounded.square(150).make().py16();
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
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isAdded
          ? Icon(CupertinoIcons.cart_badge_plus)
          : "Add to cart".text.make(),
    );
  }
}

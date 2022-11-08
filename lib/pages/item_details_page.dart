import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class ItemDetailsPage extends StatelessWidget {
  final Item item;

  ItemDetailsPage({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black87),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Buy".text.make(),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
    );
  }
}

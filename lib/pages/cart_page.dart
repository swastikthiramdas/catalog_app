import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatefulWidget {

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();

}

class _CartPageState extends State<CartPage> {

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        body: Container(
          child: Column(
            children: [
              _CartList().p32().expand(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  "\$${_cart.totalPrice}".text.xl4.make(),
                  10.widthBox,
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black87)),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: "Buying is not avalable yet".text.make(),
                        ),
                      );
                    },
                    child: "Buy".text.make(),
                  ).w32(context)
                ],
              ).p(20)
            ],
          ),
        ),
      ),
    );
  }
}

class _CartList extends StatefulWidget {

  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();

}

class _CartListState extends State<_CartList> {

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.length == 0?Center(child: "Nothing To Show".text.color(Colors.black).lg.make(),):ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: "${_cart.items[index].name}".text.make(),
        trailing: IconButton(
          onPressed: () {
            _cart.remove(_cart.items[index]);
            setState(() {});
          },
          icon: Icon(Icons.remove_circle_outline),
        ),
      ),
    );
  }
}

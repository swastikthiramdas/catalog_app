import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ProductWedget extends StatelessWidget {

  final Item item;

  ProductWedget({Key? key, required this.item}) : assert(item != null) , super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image!),
        title: Text(item.name!),
        subtitle: Text(item.desc!),
        trailing: Text("\$${item.price}",textScaleFactor: 1.5,style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
      ),
    );
  }
}

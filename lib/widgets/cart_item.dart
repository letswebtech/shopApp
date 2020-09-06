import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartItem(
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.price,
    @required this.quantity,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        print("hello");
        Provider.of<Cart>(context, listen: false).removeItem(productId);  
      },
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('\$$price')),
            ),
            title: Text(title),
            subtitle: Text('\$${(price * quantity)}'),
            trailing: Text('${quantity} X'),
          ),
        ),
      ),
    );
  }
}

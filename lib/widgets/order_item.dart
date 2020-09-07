import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../providers/orders.dart' as or;

class OrderItem extends StatelessWidget {
  
  final or.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${order.amount}"),
            subtitle: Text(DateFormat.yMMMd().format(order.datetime)),
            trailing: IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {

              },
            ),
          )
        ],
      ),
    );
  }
}
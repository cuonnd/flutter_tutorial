import 'package:flutter/material.dart';
import 'package:newapp/type/items_scree2.dart';

Container itemsList(int index, DataItemLists data) {
  // print('name is: '+data.name);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      height: 50,
      color: index % 2 == 0 ? Colors.amber : Colors.blue,
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('${data.name}'), Icon(Icons.delete)],
        ),
      ),
    );
  }
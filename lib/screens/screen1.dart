import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  static final String screen1 = "/screen1";

  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    Container boxMethod(int key, {double? radius}) {
      Alignment alignItem;
      switch (key) {
        case 1:
          alignItem = Alignment.topLeft;
          break;
        case 2:
          alignItem = Alignment.topRight;
          break;
        case 3:
          alignItem = Alignment.bottomLeft;
          break;
        case 4:
          alignItem = Alignment.bottomRight;
          break;
        default:
          alignItem = Alignment.center;
      }
      return Container(
        width: 100,
        height: 100,
        alignment: alignItem,
        decoration: radius!=null? BoxDecoration(borderRadius:BorderRadius.circular(radius), color: Colors.blue ) :null,
        color: radius==null ? Colors.amber : null,
        child: Text('Box $key'),
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Screen1')),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [boxMethod(1), boxMethod(2)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [boxMethod(3), boxMethod(4)],
              ),
            ],
          ),
          Center(
            child: boxMethod(5, radius: 100),
          )
        ],
      ),
    );
  }
}

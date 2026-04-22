import 'package:flutter/material.dart';
import 'package:newapp/type/items_scree2.dart';
import 'package:newapp/widgets/item_list_screen2.dart';
import 'package:newapp/widgets/modals/modal_bottom_sheet.dart';

class Screen2 extends StatefulWidget {
  static final String screen1 = "/screen1";

  const Screen2({super.key});

  @override
  State<Screen2> createState() => _MyScreen2();
}

class _MyScreen2 extends State<Screen2> {
  List<dynamic> listData = [];

  List<DataItemLists> list2 = [DataItemLists(id: "1", name: "1sadas dasdasd")];

  void addData(dynamic data) {
    setState(() {
      listData.add(data);
    });
  }

  void _handleAddTask(String name) {
    final newItem = DataItemLists(id: DateTime.now().toString(), name: name);
    setState(() {
      list2.add(newItem);
    });
  }

  void deleteData(int index) {
    setState(() {
      listData.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDoList',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              // children: [
              //   ...listData.asMap().entries.map(
              //     (entry) => itemsList(entry.key, entry.value),
              //   ),
              // ],
              children: list2
                  .asMap()
                  .entries
                  .map((item) => itemsList(item.key, item.value))
                  .toList(),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        // onPressed: () => bottomSheet(context, _textController, addData),
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return ModalBottomSheet(addData: _handleAddTask);
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

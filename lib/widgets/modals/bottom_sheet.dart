  import 'package:flutter/material.dart';

void bottomSheet(dynamic context,dynamic textController,void addData) {
    // _textController.clear();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Thêm mới',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
//             TextField(
//               controller: _textController,
//               style: TextStyle(fontSize: 16),
//               decoration: InputDecoration(
//                 hintText: 'Nhập nội dung...',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 prefixIcon: Icon(Icons.edit),
//                 filled: true,
//                 fillColor: Colors.grey[100],
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 border: OutlineInputBorder(
//  borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Colors.black, width: 2),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Colors.blue, width: 2),
//                 ),
//               ),
//             ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Hủy'),
                ),
                TextButton(
                  onPressed: () {
                    // if (_textController.text.isNotEmpty) {
                    //   addData(_textController.text);
                    // }
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
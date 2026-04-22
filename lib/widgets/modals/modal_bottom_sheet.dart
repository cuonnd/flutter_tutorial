import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  ModalBottomSheet({
    super.key,
    // required this.addData,
    required this.addData,
  });
  final void Function(String) addData;

  final TextEditingController controller = TextEditingController();

  void handleOnAddItem(BuildContext context) {
    final name = controller.text;
    if (name.isNotEmpty) {
      addData(name);
      controller.clear();
      // FocusScope.of(context).unfocus();
      Navigator.pop(context);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            TextField(
              controller: controller,

              // onChanged: (value) => {
              //   textValue=value,
              // },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'your task',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Color.fromARGB(255, 47, 108, 169),
                ),
              ),
              onPressed: () => handleOnAddItem(context),
              child: Text(
                'Add item',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight(600),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

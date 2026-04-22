import 'package:flutter/material.dart';
import 'package:newapp/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  int _selectedIndex = 0;

  void decrement() {
    setState(() {
      if (count > 0) count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 1:
              Navigator.pushNamed(context, Routes.screen1);
              break;
            case 2:
              Navigator.pushNamed(context, Routes.screen2);
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Screen1'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Screen12',
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.add, size: 30),
                  label: Text('Reset111'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.red,
                    textStyle: TextStyle(fontSize: 20),
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    side: BorderSide(width: 5, color: Colors.white),
                    shadowColor: Colors.deepPurple,
                    disabledBackgroundColor: Colors.red,
                    disabledForegroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      count = 0;
                    });
                  },
                  child: Text('Reset111'),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    FloatingActionButton(
                      onPressed: increment,
                      child: Icon(Icons.add),
                    ),
                    Text('Hello, World! Count: $count'),
                    FloatingActionButton(
                      onPressed: decrement,
                      child: Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: count,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  margin: EdgeInsets.all(10),
                  child: Text('Item $index'),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: EdgeInsets.all(10),
              itemCount: count,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  child: Text('Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

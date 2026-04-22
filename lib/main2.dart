import 'package:flutter/material.dart';
import 'package:newapp/screens/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false, // Ẩn chữ DEBUG
        home: MyHomePage2(),

        // home: Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: Colors.deepPurple,
        //     title: Text('Flutter Demo'),
        //   ),
        //   body: const Center(child: Text('Hello, World!')),
        // ),
      ),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});
  @override
  State<MyHomePage2> createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  int count = 0;
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
      body: PageView(
        children: [
          Column(
            children: [
              Center(
                child: Column(
                  children: [
                    TextButton.icon(
                      onPressed: null,

                      // () {
                      //   setState(() {
                      //     count = 0;
                      //   });
                      // },
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
                child: Row(
                  children: [
                    Expanded(
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
                  ],
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
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen1()),
                );
              },
            ),
          ],
        ),
      ),
      // Center(child: Text('Hello, World!')),
      // Center(child: Text('Hello, World! Count: $count')),

      // ListView.builder(
      //   itemCount: count,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text('Item $index'),
      //       subtitle: Text('Item $index'),
      //       leading: Icon(Icons.star),
      //       trailing: Icon(Icons.star),
      //     );
      //   },
      // ),
    );
  }
}

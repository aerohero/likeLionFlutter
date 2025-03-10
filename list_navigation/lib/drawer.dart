import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Demo'),
      ),
      body: Center(
        child: Text('Drawer Demo'),
      ),
      drawer: MyDrawerWidget(),
    );
  }
}

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: InkWell(
                  child: Icon(Icons.home, size: 35),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => DrawerDemo()));
                  })),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Drawer Item #1'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DemoPageOne()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Drawer Item #2'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DemoPageTwo()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Drawer Item #3'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DemoPageThree()));
            },
          ),
        ],
      ),
    );
  }
}

class DemoPageOne extends StatelessWidget {
  const DemoPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Page One'),
      ),
      body: Center(
        child: Text('Drawer Page One'),
      ),
      drawer: MyDrawerWidget(),
    );
  }
}

class DemoPageTwo extends StatelessWidget {
  const DemoPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Page Two'),
      ),
      body: Center(
        child: Text('Drawer Page Two'),
      ),
      drawer: MyDrawerWidget(),
    );
  }
}

class DemoPageThree extends StatelessWidget {
  const DemoPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Page Three'),
      ),
      body: Center(
        child: Text('Drawer Page Three'),
      ),
      drawer: MyDrawerWidget(),
    );
  }
}

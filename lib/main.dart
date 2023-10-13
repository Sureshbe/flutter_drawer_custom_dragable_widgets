import 'package:flutter/material.dart';
import 'package:flutter_drawer_widget/dashboard.dart';
import 'package:flutter_drawer_widget/SettingScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/settings': (context) => SettingScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      drawer: MyDrawer(),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "\n\n\nCurrently there is no widget please go to setting and create it",
            style: TextStyle(
                backgroundColor: Color.fromARGB(223, 235, 233, 233),
                fontSize: 20),
          ))
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.of(context).pushNamed('/dashboard');
            },
          ),
          ListTile(
            title: const Text('Setting page'),
            onTap: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}

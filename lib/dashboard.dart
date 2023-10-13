import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class DashboardScreen extends StatelessWidget {
  final List<String> _widgets = [
    // 'widget1',
    // 'widget2',
    // 'widget3',
    // 'widget4',
    // 'widget5',
    // 'widget6',
    // 'widget7',
    // 'widget8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (_widgets.length == 1) {
            // If there's only one widget, create a big centered widget
            return Center(
              child:
                  Mysquare(child: _widgets[0], size: constraints.maxWidth / 3),
            );
          } else if (_widgets.length == 2) {
            // If there are two widgets, create smaller widgets aligned to the center
            final itemWidth = constraints.maxWidth / 3;
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Mysquare(child: _widgets[0], size: itemWidth),
                  Mysquare(child: _widgets[1], size: itemWidth),
                ],
              ),
            );
          } else if (_widgets.length >= 3) {
            // If there are three or more widgets, create smaller widgets in a grid
            final itemWidth = constraints.maxWidth / 3;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _widgets.length,
              itemBuilder: (BuildContext context, int index) {
                return Mysquare(child: _widgets[index], size: itemWidth);
              },
            );
          } else {
            // No widgets
            return const Center(
                child: Text(
              "\n\n\nCurrently there is no widget please go to setting and create it",
              style: TextStyle(
                  backgroundColor: Color.fromARGB(223, 235, 233, 233),
                  fontSize: 20),
            ));
          }
        },
      ),
    );
  }
}

class Mysquare extends StatelessWidget {
  final String child;
  final double size;

  const Mysquare({required this.child, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            child,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

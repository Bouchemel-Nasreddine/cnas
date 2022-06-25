import 'package:cnas/config/const.dart';
import 'package:cnas/config/size_config.dart';
import 'package:cnas/views/demande.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _widgets = [
    Container(
      child: Text(
        'home',
      ),
    ),
    DemandesView(),
    Container(child: Text('ETS')),
  ];

  int selectedWidgetIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('home')),
              NavigationRailDestination(
                  icon: Icon(Icons.request_page), label: Text('demande')),
              NavigationRailDestination(
                  icon: Icon(Icons.delivery_dining_rounded),
                  label: Text('ETS')),
            ],
            selectedIndex: selectedWidgetIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedWidgetIndex = index;
              });
            },
          ),
          Expanded(
            child: _widgets[selectedWidgetIndex],
          ),
        ],
      ),
    );
  }
}

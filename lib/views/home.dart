import 'package:cnas/config/const.dart';
import 'package:cnas/config/size_config.dart';
import 'package:cnas/views/auth/loginView.dart';
import 'package:cnas/views/demande/list_demande_view.dart';
import 'package:cnas/views/reclamation/list_reclamation_view.dart';
import 'package:cnas/views/transport/list_transport_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _widgets = [
    ListDemande(),
    ListTransport(),
    ListReclamation(),
    Container(child: Text('profile')),



  ];

  int selectedWidgetIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Row(
        children: [
          NavigationRail(
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('demande')),
              NavigationRailDestination(
                  icon: Icon(Icons.request_page), label: Text('transports')),
              NavigationRailDestination(
                  icon: Icon(Icons.delivery_dining_rounded),
                  label: Text('reclamation')),
              NavigationRailDestination(
                  icon: Icon(Icons.delivery_dining_rounded),
                  label: Text('profile')),
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

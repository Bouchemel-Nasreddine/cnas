import 'package:cnas/config/const.dart';
import 'package:cnas/config/size_config.dart';
import 'package:cnas/views/demande.dart';
import 'package:cnas/views/auth/loginView.dart';
import 'package:cnas/views/demande/list_demande_view.dart';
import 'package:cnas/views/profile/Screens/ProfilePage.dart';
import 'package:cnas/views/reclamation/list_reclamation_view.dart';
import 'package:cnas/views/transport/list_transport_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

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
    ProfilePage(),
  ];

  PageController pageController = PageController();

  int selectedWidgetIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<SideMenuItem> items = [
      SideMenuItem(
        priority: 0,
        title: 'Demandes',
        onTap: () => pageController.jumpToPage(0),
        icon: Icon(
          Icons.add_box,
          color: lightRed,
        ),
      ),
      SideMenuItem(
        priority: 1,
        title: 'Transports',
        onTap: () => pageController.jumpToPage(1),
        icon: Icon(Icons.local_shipping),
      ),
      SideMenuItem(
        priority: 2,
        title: 'Reclamation',
        onTap: () => pageController.jumpToPage(2),
        icon: Icon(Icons.description),
      ),
      SideMenuItem(
        priority: 3,
        title: 'Profile',
        onTap: () => pageController.jumpToPage(3),
        icon: Icon(Icons.person),
      ),
    ];

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Row(
        children: [
          SideMenu(
            items: items,
            controller: pageController,
            style: SideMenuStyle(
              selectedIconColor: red,
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.03,
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                ),
                child: PageView(
                  controller: pageController,
                  children: _widgets,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:purscliq_app/Homepage/homepage.dart';
import 'package:purscliq_app/help_and_support.dart';
import 'package:purscliq_app/more.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int bottomNavigatorPageIndex = 0;
  final pages = [const Homepage(), HelpAndSupport(), const More()];
  void onItemTapped(int index) {
    setState(() {
      bottomNavigatorPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        currentIndex: bottomNavigatorPageIndex,
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_rounded),
            label: 'Help and support',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
            ),
            label: 'More',
          ),
        ],
      ),
      body: pages[bottomNavigatorPageIndex],
    );
  }
}

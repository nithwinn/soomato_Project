import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:soomato/pages/profile.dart';
import 'package:soomato/pages/wallet.dart';
import '../pages.dart';
import 'order.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex=0;

  late List<Widget>pages=[const Home(),const Wallet(),const Order(),const Profile(),];
  void updateIndex(int newindex){
    setState(() {
      currentTabIndex=newindex;
    });}
  // late Widget currentPage;
  // late Home homepage;
  // late Profile profile;
  // late Order order;
  // late Wallet wallet;

  @override
  void initState() {
    currentTabIndex=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTabIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height:65,
        animationDuration: Duration(milliseconds: 500),
        items: [Icon(Icons.home),Icon(Icons.wallet),Icon(Icons.shopping_bag),Icon(Icons.person)],
        onTap: (index){
          updateIndex(index);
        },
        backgroundColor: Colors.black38,
      ),
    );
  }
}
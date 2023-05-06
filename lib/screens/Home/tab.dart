import 'package:flutter/material.dart';
import './tabs/tab1.dart';
import './tabs/tab2.dart';
import './tabs/tab3.dart';
import './drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
            title: const Text("Home"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.notifications_active)),
                Tab(icon: Icon(Icons.mediation)),
                Tab(icon: Icon(Icons.handshake_outlined)),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              Tab1(),
              Tab2(),
              Tab3(),
            ],
          )),
    );
  }
}

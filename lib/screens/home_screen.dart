/*
 * © 2023 Yared Kassa - LDS. All rights reserved.
 * This code is protected by copyright law and may not be reproduced or distributed without permission.
 */

import 'package:flutter/material.dart';
import '../constants/coors.dart';
import '../model/entry_data.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart';
import '../widgets/entery.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final enteryDataList = EnteryData.enteryDataList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bellBlue,
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              leading: Icon(Icons.menu),
              title: Text('Home Profile'),
              actions: const [
                Icon(Icons.share),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.search),
                ), // Icon(Icons.more_vert),
              ],
              backgroundColor: bellBlue,

              bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'CHAT', icon: Icon(Icons.add_alert_rounded)),
                Tab(text: 'GROUP', icon: Icon(Icons.supervised_user_circle)),
                Tab(text: 'DATE', icon: Icon(Icons.handshake_rounded)),
              ],
            ),
          ),

            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                    ),
                    title: const Text('Page 1'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.train,
                    ),
                    title: const Text('Page 2'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          
          body: TabBarView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        // vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 30, bottom: 30),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'All enters',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                //Entery(),
                                for (EnteryData enteryData in enteryDataList)
                                  Entery(
                                    enteryData: enteryData,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(child: Text('CATS')),
              Center(child: Text('BIRDS')),
            ],
          ),

        ),
      ),
    );
  }
}
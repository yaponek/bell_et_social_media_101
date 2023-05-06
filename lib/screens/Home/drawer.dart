import 'package:flutter/material.dart';
import 'package:bell_et_social_media_101/screens/login_screen.dart';
import '../../constants/coors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  navigateTo(String route, BuildContext context) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // const UserAccountsDrawerHeader( // <-- SEE HERE
          //   decoration: BoxDecoration(color: const Color.fromRGBO(155,155, 155, 0.0),),
          //   accountName: Text(
          //     "Pinkesh Darji",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: bellBlack,
          //       fontSize: 16,
          //     ),
          //   ),
          //   accountEmail: Text(
          //     "user Bio Goes Here",
          //     style: TextStyle(
          //         color: bellBlack
          //     ),
          //   ),
          //   currentAccountPicture: FlutterLogo(),
          //
          // ),
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(155, 155, 155, 0.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 71,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/noProfile.png'),
                  ),
                ),
                const Text(
                  "Pinkesh Darji",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: bellPrimaryDrawerTextColor,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "Defult Profile",
                  style: TextStyle(
                      color: bellSecondaryDrawerTextColor,
                      fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 10, // <-- SEE HERE
                ),
                const Text(
                  "user Bio Goes Here",
                  style: TextStyle(
                    color: bellSecondaryDrawerTextColor,
                    fontSize: 12,
                    fontFamily:  'Roboto',
                  ),
                ),
                //...additional header items here
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: bellBlue,
            ),
            title: const Text('Home Profile'),
            onTap: () {
              navigateTo("/home", context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_add,
              color: bellBlue,
            ),
            title: const Text('Add More Profile'),
            onTap: () {
              // navigateTo("/settings", context);
            },
            // Divider(), //here i
          ),
          Divider(),
          ListTile(
            leading: const Icon(
              Icons.mediation,
              color: bellBlue,
            ),
            title: const Text('Create Media'),
            onTap: () {
              // navigateTo("/home", context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: bellBlue,
            ),
            title: const Text('Settings'),
            onTap: () {
              navigateTo("/settings", context);
            },
            // Divider(), //here i
          ),
          // Divider(), //here is a divider
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              color: bellBlue,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

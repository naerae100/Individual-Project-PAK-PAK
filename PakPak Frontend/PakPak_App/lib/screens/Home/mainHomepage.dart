import 'package:electronic_accessories_app/screens/Home/map.dart';
import 'package:electronic_accessories_app/screens/Widget/recents.dart';
import 'package:electronic_accessories_app/screens/login_scren.dart';
import 'package:electronic_accessories_app/screens/profile_screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Color(0xff764abc),
                  image: DecorationImage(image: AssetImage("assets/pd.jpg"))),
              accountName: Text(
                "Nitesh Karki",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "Nitesh.karki31@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Get.to(() => ProfilePage());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
              ),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.clear();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
            ),
            const AboutListTile(
              // <-- SEE HERE
              icon: Icon(
                Icons.info,
              ),
              applicationIcon: Icon(
                Icons.local_play,
              ),
              applicationName: 'ShopWisely',
              applicationVersion: '1.0.25',
              applicationLegalese: '© 2020 NK',
              aboutBoxChildren: [Text('Made By NK')],
              child: Text('About app'),
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/after.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AppBar(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        color: Colors.white.withOpacity(0.9),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),

                    title: const Center(
                      child: Text(
                        'Pak Pak',
                        style: TextStyle(
                            color: Color.fromARGB(255, 13, 153, 85),
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quickstand'),
                      ),
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white.withOpacity(0.9),
                          size: 24,
                        ),
                      )
                    ],
                    backgroundColor: Colors.transparent,
                    elevation: 0,

                    // ...
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 28, top: 40, right: 28, bottom: 10),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide.none,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          title: TextField(
                            enabled: false,
                            decoration: InputDecoration.collapsed(
                                hintText: 'Where do you go?',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[700],
                                    letterSpacing: 0.2)),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Get.to(MapView());
                            },
                            child: Icon(
                              Icons.search,
                              size: 27,
                              color: Colors.orange[400],
                            ),
                          ),
                        )),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 28, top: 1, right: 28, bottom: 1),
                  child: Card(
                      // ...
                      ),
                ),
                Recents(),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GaClient extends StatefulWidget {

  @override
  State<GaClient> createState() => _GaClientState();
}

class _GaClientState extends State<GaClient> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String _notif = "10";
  String _name = "";
  String _email = "";

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = prefs.getString("email")!;
      _name = prefs.getString("name")!;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          child: Text("Client Page"),
        ),
        leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: IconButton(
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: const Icon(Icons.menu, size: 32, color: Colors.white))),
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                  padding: const EdgeInsets.only(right: 15.0, top: 15.0),
                  onPressed: () {},
                  icon: const Icon(Icons.email, color: Colors.white)
              ),
              _notif == "0" ? Container() : Positioned(
                right: 13.0,
                top: 10.0,
                child: Stack(
                  children: [
                    const Icon(
                        Icons.brightness_1,
                        size: 20.0,
                        color: Colors.redAccent
                    ),
                    Positioned(
                      top: 3.0,
                      right: 6.0,
                      child: Text(
                          _notif,
                          style: const TextStyle(color: Colors.white, fontSize: 11.0
                          )
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              accountName: Text(_name),
              accountEmail: Text(_email),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/budget.png"),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context).pushNamed('/client');
              },
            ),
            ListTile(
              title: const Text("Pengaturan"),
              onTap: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ),
            ListTile(
              title: const Text("Laporan"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Logout"),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Text(
            "Hi $_name\n(Client)",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            )
        ),
      ),
    );
  }
}

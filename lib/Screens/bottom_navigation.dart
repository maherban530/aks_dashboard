import 'package:aks_dashboard/Screens/dashboard.dart';
import 'package:flutter/material.dart';

class BotttomNAvigation extends StatefulWidget {
  BotttomNAvigation({Key? key}) : super(key: key);

  @override
  _BotttomNAvigationState createState() => _BotttomNAvigationState();
}

class _BotttomNAvigationState extends State<BotttomNAvigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Center(child: Text('Subscription')),
    Center(child: Text('Wallet')),
    Center(child: Text('Orders')),
    Center(child: Text('Account')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 1,
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
              // Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.view_list_sharp,
              color: Theme.of(context).primaryColor,
            )),
        title: Image.asset(
          'assets/logo.jpg',
          height: 40,
        ),
        backgroundColor: Colors.grey.shade50,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const ListTile(
                            title: Text('Change Location'),
                            subtitle: Text(
                                'Product availablity, price, offer & delivery options may differ'),
                          ),
                          Container(
                              padding: EdgeInsets.all(26),
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.add_circle,
                                    size: 40,
                                  ),
                                  Text('Add New\nAddress'),
                                ],
                              )),
                        ],
                      );
                    });
              },
            ),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Store',
              // backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range_rounded),
              label: 'Suscription',
              // backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Wallet',
              // backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_sharp),
              label: 'Orders',
              // backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
              // backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.grey.shade100,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).primaryColor,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5),
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            // const DrawerHeader(
            //     decoration: BoxDecoration(
            //       color: Colors.green,
            //     ), //BoxDecoration
            //     child: Text("")), //DrawerHeader
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Row(
                    children: const [
                      Expanded(child: Text('Hi!')),
                      Text('View'),
                      Icon(Icons.navigate_next_outlined)
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text('FAQs'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.support),
              title: const Text('Support'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_list_outlined),
              title: const Text('Team and condition'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.emoji_transportation_rounded),
              title: const Text('Refer & Earn'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Log In/Register'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

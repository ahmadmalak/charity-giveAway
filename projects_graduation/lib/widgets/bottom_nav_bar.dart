import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:projects_graduation/pages/donator/home/home_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  static String routeNav = "/root";
  const BottomNavBarWidget({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavBarWidget> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  var screens = [
    MyHomePage(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: 0.2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        tilesPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            showBadge: true,
            badge: Text("5"),
            badgeColor: Colors.deepPurpleAccent,
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
            title: Text("Home"),
          ),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Logs")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.folder_open,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.folder_open,
                color: Colors.indigo,
              ),
              title: Text("Folders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              title: Text("Menu"))
        ],
      ),
      body: screens[currentIndex],
    );
  }
}

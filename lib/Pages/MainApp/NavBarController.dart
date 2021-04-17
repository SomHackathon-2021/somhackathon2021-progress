import 'package:flutter/material.dart';
import 'package:hackathon/Pages/MainApp/CategoriesScreen/CategoriesScreen.dart';
import 'package:hackathon/Pages/MainApp/HomeScreen/HomeScreen.dart';
import 'package:hackathon/Pages/MainApp/ProfileScreen/ProfileScreen.dart';
import 'package:hackathon/Pages/MainApp/ShopCartScreen/ShopCartScreen.dart';
import 'HomeScreen/MessagesScreen.dart';

class NavBarController extends StatefulWidget {
  NavBarController({Key key}) : super(key: key);

  @override
  _NavBarControllerState createState() => _NavBarControllerState();
}

class _NavBarControllerState extends State<NavBarController> {

  int selectedIndex = 0;

    final pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    void _onItemTap(int index) {
      setState(() {
        selectedIndex = index;
        pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      });
    }

    void pageChanged(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        scrollDirection: Axis.horizontal,
        children: [
          HomeScreen(),
          CategoriesScreen(),
          ShopCartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.blueGrey,
            type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home, color: Colors.orange,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: "Categories",
            activeIcon: Icon(Icons.shopping_bag_rounded, color: Colors.orange,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label: "Carrito",
            activeIcon: Icon(Icons.shopping_cart, color: Colors.orange,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            activeIcon: Icon(Icons.person, color: Colors.orange,)
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}

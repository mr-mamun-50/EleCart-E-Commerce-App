import 'package:ele_cart_e_commerce_app/views/favourites.dart';
import 'package:ele_cart_e_commerce_app/views/home.dart';
import 'package:ele_cart_e_commerce_app/views/search_products.dart';
import 'package:flutter/material.dart';

class TemplateView extends StatefulWidget {
  const TemplateView({Key? key}) : super(key: key);

  @override
  _TemplateViewState createState() => _TemplateViewState();
}

class _TemplateViewState extends State<TemplateView> {
  int _selectedIndex = 0;
  static const List _pages = [
    HomeView(),
    FavouritesView(),
    Icon(
      Icons.shopping_cart,
      size: 150,
    ),
    Icon(
      Icons.person,
      size: 150,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EleCart"),
        backgroundColor: const Color(0xff583D72),
        leading: Container(
          margin: const EdgeInsets.only(left: 15),
          child: Image.asset('images/logo_40.png'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchProducts()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.message_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        unselectedIconTheme: const IconThemeData(
          color: Color(0xffFFC996),
        ),
        unselectedItemColor: const Color(0xffFFC996),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Color(0xff583D72),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favourites',
            backgroundColor: Color(0xff583D72),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Chats',
            backgroundColor: Color(0xff583D72),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
            backgroundColor: Color(0xff583D72),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

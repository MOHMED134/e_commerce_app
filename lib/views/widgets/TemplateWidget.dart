import 'package:final_project/views/pages/accountPage.dart';
import 'package:final_project/views/pages/cartPage.dart';
import 'package:final_project/views/pages/favouritePage.dart';
import 'package:final_project/views/pages/homepage.dart';
import 'package:flutter/material.dart';

class TemplateWidget extends StatelessWidget {
  final int? bottomNavIndex;
  final Widget body;

  const TemplateWidget({this.bottomNavIndex, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavIndex == null
          ? null
          : Column(
              children: [
                Expanded(child: body),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    currentIndex: bottomNavIndex!,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    unselectedItemColor: Colors.black.withOpacity(.5),
                    selectedItemColor: Color(0xffF16A26),
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                          icon: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage()));
                            },
                            icon: Icon(Icons.home),
                          ),
                          label: 'Shop'),
                      BottomNavigationBarItem(
                          icon: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => cartProductPage()));
                            },
                            icon: Icon(Icons.shopping_cart),
                          ),
                          label: 'Cart'),
                      BottomNavigationBarItem(
                          icon: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => favouriteProductPage()));
                            },
                            icon: Icon(Icons.favorite_border),
                          ),
                          label: 'account'),
                      BottomNavigationBarItem(
                          icon: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => accountPage()));
                            },
                            icon: Icon(Icons.account_circle_outlined),
                          ),
                          label: 'account'),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

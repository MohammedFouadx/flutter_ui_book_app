import 'package:dark_mode_app/src/pages/home/widget/coming_book.dart';
import 'package:dark_mode_app/src/pages/home/widget/custom_app_bar.dart';
import 'package:dark_mode_app/src/pages/home/widget/recommended_book.dart';
import 'package:dark_mode_app/src/pages/home/widget/trending_book.dart';
import 'package:flutter/material.dart';
import 'package:dark_mode_app/src/settings/settings_controller.dart';

class HomeScreen extends StatelessWidget {
  final SettingsController settingsController;
  const HomeScreen({Key? key, required this.settingsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          CustomAppBar(settingsController: settingsController,),
          ComingBook(),
          RecommendedBook(),
          TrendingBook(),
        ],
      ),
      bottomNavigationBar: _BuildBottomNavigation(context),
    );
  }
  Widget _BuildBottomNavigation(context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xff6741ff),
        items:  const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_rounded ,

            )),
          BottomNavigationBarItem(
              label: 'Book',
              icon: Icon(
                Icons.menu_book_rounded,

              )),
          BottomNavigationBarItem(
              label: 'Column',
              icon: Icon(
                Icons.view_week_outlined,

              )),
          BottomNavigationBarItem(
              label: 'Person',
              icon: Icon(Icons.person_outlined)),
        ]
    );
  }
}

import 'package:eclipsdigital/bloc/bottom_navbar_bloc.dart';
import 'package:eclipsdigital/repository/repository.dart';
import 'package:eclipsdigital/screens/home_screen.dart';
import 'package:eclipsdigital/screens/profile_screen.dart';
import 'package:eclipsdigital/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclipsdigital/style/theme.dart' as style;

import 'favourite_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BottomNavBarBloc _bottomNavBarBloc = BottomNavBarBloc();

  @override
  void dispose() {
    _bottomNavBarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _bottomNavBarBloc.streamNavBar,
        initialData: _bottomNavBarBloc.navBarItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          switch (snapshot.data) {
            case NavBarItem.home:
              return const HomeScreen();
            case NavBarItem.users:
              return const UsersScreen();
            case NavBarItem.albums:
              return const FavouriteScreen();
            case NavBarItem.profile:
              return const ProfileScreen();
            default:
              return Container();
          }
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.streamNavBar,
        initialData: _bottomNavBarBloc.navBarItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withOpacity(0.4),
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              elevation: 0.9,
              iconSize: 21,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              currentIndex: snapshot.data!.index,
              type: BottomNavigationBarType.fixed,
              onTap: _bottomNavBarBloc.pickItem,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: SizedBox(
                    child: SvgPicture.asset(
                      "assets/icons/home.svg",
                      color: Colors.white,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      "assets/icons/home-active.svg",
                      color: style.Colors.mainColor,
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                    label: "Users",
                    icon: SizedBox(
                      child: SvgPicture.asset(
                        "assets/icons/search.svg",
                        color: Colors.white,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      "assets/icons/search-active.svg",
                      color: style.Colors.mainColor,
                      height: 25,
                      width: 25,
                    )),
                BottomNavigationBarItem(
                    label: "Favourite",
                    icon: SizedBox(
                      child: SvgPicture.asset(
                        "assets/icons/heart.svg",
                        color: Colors.white,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    activeIcon: SizedBox(
                      child: SvgPicture.asset(
                        "assets/icons/heart-active.svg",
                        color: style.Colors.mainColor,
                        height: 25,
                        width: 25,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "Profile",
                    icon: SizedBox(
                      child: SvgPicture.asset(
                        "assets/icons/profile.svg",
                        color: Colors.white,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    activeIcon: SizedBox(
                      child: SvgPicture.asset(
                        "assets/icons/profile-active.svg",
                        color: style.Colors.mainColor,
                        height: 25,
                        width: 25,
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

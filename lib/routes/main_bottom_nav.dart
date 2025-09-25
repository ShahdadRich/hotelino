import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelino/core/constans/constans.dart';
import 'package:hotelino/features/home/presentation/homePage.dart';
import 'package:hotelino/routes/test_pages.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _builderNav() {
    return [Homepage(), FavoritePage(), BookingPage(), ProfilePage()];
  }

  List<PersistentBottomNavBarItem> _bottomItem() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_home.svg',
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            AppColors.lightInputFill,
            BlendMode.srcIn,
          ),
        ),
        activeColorPrimary: AppColors.primeryColor,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_home.svg',
          width: 20,
          height: 20,
        ),
        title: 'home',
        activeColorSecondary: AppColors.darkText,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_favorite.svg',
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            AppColors.lightInputFill,
            BlendMode.srcIn,
          ),
        ),
        activeColorPrimary: AppColors.primeryColor,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_favorite.svg',
          width: 20,
          height: 20,
        ),
        title: 'favorite',
        activeColorSecondary: AppColors.darkText,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_booking.svg',
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            AppColors.lightInputFill,
            BlendMode.srcIn,
          ),
        ),
        activeColorPrimary: AppColors.primeryColor,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_booking.svg',
          width: 20,
          height: 20,
        ),
        title: 'booking',
        activeColorSecondary: AppColors.darkText,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_profile.svg',
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            AppColors.lightInputFill,
            BlendMode.srcIn,
          ),
        ),
        activeColorPrimary: AppColors.primeryColor,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_profile.svg',
          width: 20,
          height: 20,
        ),
        title: 'profile',
        activeColorSecondary: AppColors.darkText,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _builderNav(),
      controller: _controller,
      items: _bottomItem(),
      hideNavigationBarWhenKeyboardAppears: true,
      handleAndroidBackButtonPress: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      navBarStyle: NavBarStyle.style7,
      confineToSafeArea: true,
      animationSettings: NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
      ),
    );
  }
}

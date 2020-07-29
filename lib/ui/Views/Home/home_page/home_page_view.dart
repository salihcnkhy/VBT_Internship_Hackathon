import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/core/app/theme/color_scheme.dart';
import 'package:vbt_hackathon/core/extensions/build_context_extension.dart';
import 'package:vbt_hackathon/ui/Views/Home/category_list_page/category_list_page.dart';
import 'package:vbt_hackathon/ui/Views/settings/settings_view.dart';
import './home_page_view_model.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: buildBody,
    );
  }

  PreferredSize get buildAppBar {
    return PreferredSize(
      preferredSize: Size.fromHeight(75),
      child: Container(
        child: buildLogo,
        decoration: buildBoxDecorationAppBar,
      ),
    );
  }

  BoxDecoration get buildBoxDecorationAppBar {
    return BoxDecoration(
      gradient: context.baseGradient,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    );
  }

  Widget get buildLogo {
    return Center(
      child: Text(
        "Logo".toUpperCase(),
        style: context.textTheme.headline2.copyWith(
          color: AppColorScheme.light_khaki,
          fontSize: 36,
        ),
      ),
    );
  }

  Widget get buildBody {
    return PersistentTabView(
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: context.colorScheme.background,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style13,
    );
  }

  List<Widget> _buildScreens() {
    return [CategoryListPage(), SettingsView()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.book),
        title: ("Home"),
        activeColor: context.colorScheme.primary,
        inactiveColor: context.colorScheme.secondary,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColor: context.colorScheme.primary,
        inactiveColor: context.colorScheme.secondary,
      ),
    ];
  }
}

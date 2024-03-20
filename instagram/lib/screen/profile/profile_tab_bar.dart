import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/util/constants.dart';

class ProfileTabBar extends StatefulWidget {
  const ProfileTabBar({super.key});

  @override
  State<ProfileTabBar> createState() => _ProfileTabBarState();
}

class _ProfileTabBarState extends State<ProfileTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _tabBar();
  }

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('${Constants.imageBasePath}/postGrid.svg'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('${Constants.imageBasePath}/tag.svg'),
        ),
      ],
    );
  }
}

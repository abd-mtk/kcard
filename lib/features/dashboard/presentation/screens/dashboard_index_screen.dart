import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../widgets/dashboard_tabs.dart';
import '../widgets/dashboard_tabs_view.dart';

class DashBoardIndexScreen extends StatelessWidget {
  const DashBoardIndexScreen({super.key});
  static const String routeName = '/dashBoardIndexScreen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 2,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonsTabBar(
                  splashColor: Colors.purple[300],
                  backgroundColor: Colors.purple[500],
                  unselectedBackgroundColor: Colors.grey[500],
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  labelStyle:
                      const TextStyle(color: Colors.white, fontSize: 16),
                  radius: 15,
                  tabs: dashboardTabs,
                ),
              ],
            ),
          ),
          const DashboardTabsView(),
        ],
      ),
    );
  }
}

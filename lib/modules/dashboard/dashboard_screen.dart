import 'package:flutter/material.dart';
import 'package:home_ful/modules/resources/resources_financial_assistance.dart';

import '../../components/shared/shared_appbar.dart';
import '../../core/constants/constants.dart';
import '../home/home_screen.dart';
import '../settings/settings_screen.dart';
import '../shelter/shelter_item_screen.dart';
import 'components/bottom_bar_item.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final PageController _pageController;

  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _onchangepage(int page) {
    setState(() {
      _currentIndex = page;
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  int _currentIndex = 0;
  final List<String> _titleList = [
    "Home",
    "Shelters",
    "Resources for Financial Assistance to Prevent Eviction",
    "Back"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.homeBackground,
      appBar: _currentIndex == 0 || _currentIndex == 1
          ? null
          : SharedAppbar(
              title: _titleList[_currentIndex],
              backgroundColor: Palette.homeBackground,
              onLeading: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen())),
            ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        children: [
          const HomeScreen(),
          ShelterItemViews(),
          const ResourcesFinancialAssistance(),
          const SettingsScreen()
        ],
      ),
      bottomNavigationBar: SizedBox(
        child: BottomAppBar(
          color: Palette.white,
          elevation: 4,
          child: Row(
            children: [
              BottomBarItem(
                icon: Symbols.home_filled,
                title: "Home",
                selected: _currentIndex == 0,
                onTap: () => _onchangepage(0),
              ),
              BottomBarItem(
                icon: SvgAssets.tablerBed,
                title: "Shelters",
                selected: _currentIndex == 1,
                onTap: () => _onchangepage(1),
              ),
              BottomBarItem(
                icon: SvgAssets.donate,
                title: "Resources",
                selected: _currentIndex == 2,
                onTap: () => _onchangepage(2),
              ),
              BottomBarItem(
                icon: SvgAssets.singleCircle,
                title: "Profile",
                selected: _currentIndex == 3,
                onTap: () => _onchangepage(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

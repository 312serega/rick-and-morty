import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/svgs_src.dart';
import '../user_settings/user_settings.dart';
import 'widget/character_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static List<Widget> tabsScreen = <Widget>[
    CharacterList(),
    const Text('data'),
    const Text('data'),
    const UserSettings(),
  ];
  int _activeTab = 0;
  void onSelectTsb(int index) {
    if (_activeTab == index) return;
    setState(() {
      _activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGray,
      body: tabsScreen[_activeTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.colorGray,
        currentIndex: _activeTab,
        selectedItemColor: AppColors.colorSuccess,
        unselectedItemColor: const Color(0xff5B6975),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgsSrc.character,
            activeIcon: SvgsSrc.characterActive,
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            icon: SvgsSrc.location,
            activeIcon: SvgsSrc.locationActive,
            label: 'Локации',
          ),
          BottomNavigationBarItem(
            icon: SvgsSrc.episode,
            activeIcon: SvgsSrc.episodeActive,
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(
            icon: SvgsSrc.settings,
            activeIcon: SvgsSrc.settingsActive,
            label: 'Настройки',
          ),
        ],
        onTap: onSelectTsb,
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/legacy.dart'; // <-- BU QATORNI O'CHIRING
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/menu/navigation_items.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/enums/user_role.dart';

// Hozircha UserRole ni shu yerdan olib turamiz (Test uchun)
final userRoleProvider = StateProvider<UserRole>((ref) => UserRole.oshpaz);

class MainNavigation extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigation({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRole = ref.watch(userRoleProvider);
    final tabs = NavigationConfig.getTabsForRole(currentRole);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: AppColors.primary500,
          unselectedItemColor: AppColors.grey500,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          items: tabs.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(item.icon),
              activeIcon: Icon(item.activeIcon),
              label: item.label,
            );
          }).toList(),
        ),
      ),
    );
  }
}

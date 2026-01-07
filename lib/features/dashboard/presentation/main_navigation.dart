import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/menu/navigation_items.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/enums/user_role.dart';

// Hozircha UserRole ni shu yerdan olib turamiz (Test uchun)
// Keyinchalik AuthProviderga ulaymiz
final userRoleProvider = StateProvider<UserRole>((ref) => UserRole.oshpaz);

class MainNavigation extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigation({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Hozirgi rolni aniqlaymiz
    final currentRole = ref.watch(userRoleProvider);

    // 2. Shu rolga tegishli menyularni olamiz
    final tabs = NavigationConfig.getTabsForRole(currentRole);

    return Scaffold(
      // Tepa qism (Body) - GoRouter o'zi boshqaradi
      body: navigationShell,

      // Pastki qism (Bottom Bar)
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
            // Tab bosilganda o'sha sahifaga o'tish
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          type: BottomNavigationBarType
              .fixed, // 4 tadan ko'p element bo'lsa shart
          backgroundColor: Colors.white,
          elevation: 0,

          // Ranglar (Dizayndan olindi)
          selectedItemColor: AppColors.primary500, // Yashil
          unselectedItemColor: AppColors.grey500, // Kulrang

          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.5, // Matn va ikonka orasini ochish
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),

          // Menyularni chizamiz
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

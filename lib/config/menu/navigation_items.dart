import 'package:flutter/material.dart';
import '../../core/enums/user_role.dart';

// Menyu turlari (ID sifatida ishlatamiz)
enum NavItemEnum {
  home, // Asosiy
  orders, // Buyurtma
  menu, // Taomnoma
  cart, // Savat
  profile, // Hisob
  attendance, // Davomat (Hamshira uchun)
}

// Har bir tugmaning modeli
class NavItem {
  final NavItemEnum id;
  final String label;
  final IconData icon;
  final IconData activeIcon; // Bosilgandagi ikonka (to'ldirilgan)
  final String route; // GoRouter uchun yo'l

  const NavItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });
}

class NavigationConfig {
  // Hamma menyular ro'yxati
  static const List<NavItem> _allTabs = [
    NavItem(
      id: NavItemEnum.home,
      label: "Asosiy",
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      route: '/home',
    ),
    NavItem(
      id: NavItemEnum.orders,
      label: "Buyurtma",
      icon: Icons.receipt_long_outlined,
      activeIcon: Icons.receipt_long,
      route: '/orders',
    ),
    NavItem(
      id: NavItemEnum.menu,
      label: "Taomnoma",
      icon: Icons.restaurant_menu_outlined, // Yoki calendar_today
      activeIcon: Icons.restaurant_menu,
      route: '/menu',
    ),
    NavItem(
      id: NavItemEnum.attendance,
      label: "Davomat",
      icon: Icons.people_outline,
      activeIcon: Icons.people,
      route: '/attendance',
    ),
    NavItem(
      id: NavItemEnum.cart,
      label: "Savat",
      icon: Icons.shopping_cart_outlined,
      activeIcon: Icons.shopping_cart,
      route: '/cart',
    ),
    NavItem(
      id: NavItemEnum.profile,
      label: "Hisob",
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      route: '/profile',
    ),
  ];

  // Rolga qarab filtrlash funksiyasi
  static List<NavItem> getTabsForRole(UserRole role) {
    // Endi "Admin hammasini ko'radi" degan qism YO'Q.
    // Har bir rol uchun qat'iy filtr qo'yamiz.

    return _allTabs.where((tab) {
      // OSHPAZ: Davomatni ko'rmasin
      if (role == UserRole.oshpaz && tab.id == NavItemEnum.attendance) {
        return false;
      }

      // HAMSHIRA: Buyurtma, Taomnoma va Savatni ko'rmasin
      if (role == UserRole.hamshira &&
          (tab.id == NavItemEnum.orders ||
              tab.id == NavItemEnum.menu ||
              tab.id == NavItemEnum.cart)) {
        return false;
      }

      return true;
    }).toList();
  }
}

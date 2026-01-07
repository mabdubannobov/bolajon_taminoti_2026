import 'package:bolajon_taminoti_2026/features/home/presentation/home_page.dart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/dashboard/presentation/main_navigation.dart';

// Global kalit (Contextsiz navigatsiya uchun)
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home', // Dastur shu yerdan boshlanadi
    routes: [
      // SHELL ROUTE (Bottom Bar bor sahifalar)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // Biz yasagan MainNavigation vidjeti shu yerda ishlatiladi
          return MainNavigation(navigationShell: navigationShell);
        },
        branches: [
          // 1. Asosiy (Home)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),

          // 2. Buyurtma (Orders)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/orders',
                builder: (context, state) =>
                    const Center(child: Text("Buyurtmalar sahifasi")),
              ),
            ],
          ),

          // 3. Taomnoma (Menu)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/menu',
                builder: (context, state) =>
                    const Center(child: Text("Taomnoma sahifasi")),
              ),
            ],
          ),

          // 4. Davomat (Attendance) - Hamshira uchun
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/attendance',
                builder: (context, state) =>
                    const Center(child: Text("Davomat sahifasi")),
              ),
            ],
          ),

          // 5. Savat (Cart)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cart',
                builder: (context, state) =>
                    const Center(child: Text("Savat sahifasi")),
              ),
            ],
          ),

          // 6. Hisob (Profile)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) =>
                    const Center(child: Text("Profil sahifasi")),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
